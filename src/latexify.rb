require 'kramdown'
require 'fileutils'

module Kramdown
  module Parser
    class MTCKramdown < Kramdown

      def initialize(source, options)
        super
        @span_parsers.unshift(:inline_macro)
      end

      INLINE_MACRO_START = /\{\{.*?\}\}/

      # Parse the inline math at the current location.
      def parse_inline_macro
        start_line_number = @src.current_line_number
        @src.pos += @src.matched_size
        # puts "---- #{start_line_number} : #{@src.matched}"
        @tree.children << Element.new(:macro, @src.matched, nil, category: :span, location: start_line_number)
      end
      define_parser(:inline_macro, INLINE_MACRO_START, '{{')
    end
  end

  module Converter
    class MtcLatex < Latex
      def initialize(root, options)
        @colspan = nil
        @rowspan = nil
        super
      end

      def convert_macro(el, _opts)
        el.value.sub(/\{\{([a-zA-Z0-9_]+)(\(([^\)]+)\))?\}\}/) do |s|
          command = $1
          args = $3.gsub(/\\([<>])/, '\1') if $3
          case command
          when 'term'
            "\\gls{#{args}}"
            
          when 'termplural'
            "\\glspl{#{args}}"

          when 'latex'
            args

          when 'table'
            "Table~\\ref{table:#{args}}"

          when 'figure'
            "Figure~\\ref{fig:#{args}}"

          when "span", "colspan"
            @colspan = args.to_i
            ''

          when "rowspan"
            @rowspan = args.to_i
            ''

          when "sect"
            id = args.downcase.gsub('/', '').split.join('-')
            "\\sect{#{id}}"

          when 'markdown'
            kd = ::Kramdown::Document.new(args.gsub(/<br\/?>/, "\n"), input: 'MTCKramdown')
            kd.to_mtc_latex
            
          else
            "\\#{command}{#{args}}"
          end
        end
      end

      def convert_header(el, opts)
        level = output_header_level(el.options[:level]) - 1
        type = @options[:latex_headers][level]
        mbox = "\\mbox{}" if level >= 3
        if ((id = el.attr['id']) ||
            (@options[:auto_ids] && (id = generate_id(el.options[:raw_text])))) && in_toc?(el)
          "\\#{type}{#{inner(el, opts)}}\\hypertarget{sec:#{id}}{}\\label{sec:#{id}}#{mbox}\n\n"
        else
          "\\#{type}*{#{inner(el, opts)}}#{mbox}\n\n"
        end
      end

      TABLE_ALIGNMENT = { default: 'X', right: 'r', center: 'c', left: 'l' }

      def caption_and_label(el, context)
        caption = el.attr['caption']
        if caption
          label = el.attr['label'] || caption.gsub(/[ ]+/, '')
          if context and not label.index(':')
            label = "#{context}:#{label}"
          end
          caption = latex_caption(caption)
        end
        [caption, label]
      end

      def convert_table(el, opts)
        cap, lbl = caption_and_label(el, 'table')
        long = el.attr['long'] && el.attr['long'] == 'true'
        puts "Table: #{cap} – long=#{long}"

        if cap
          if long
            caption = " caption = {#{cap}},"
            label = "  label = {#{lbl}},"
          else
            caption = "\n  \\caption{#{cap}}"
            label = "\n  \\label{#{lbl}}"
          end
        end

        align = el.options[:alignment].map {|a| TABLE_ALIGNMENT[a] }

        if el.attr['format']
          default = el.attr['format'] 
          align.map! { |a| default }
        end

        el.attr.keys.each do |k|
          if k =~ /^format-(\d+)/
            align[$1.to_i - 1] = el.attr[k]
          end
        end

        columns = '| ' + align.map do |f|
          a, w = f.split
          a << "{#{w}}" if w
          a
        end.join(' | ') + ' |'
        
        if long
          text = <<EOT
\\begin{longtblr}[
  #{caption}
  #{label}  
]
EOT
        else
          text = <<EOT
\\begin{table}[ht]
  \\centering#{caption}#{label}
  \\fontsize{9pt}{11pt}\\selectfont
  \\begin{tblr}
EOT
        end

        text<< "{colspec={#{columns}}, hlines, vlines}\n"
        text<< inner(el, opts)
        if long
          text<< "\\end{longtblr}\n"
        else        
          text<< "  \\end{tblr}\n"
          text<< "\\end{table}\n"
        end
        text<< "\\FloatBarrier\n"
        text
      end

      def convert_tr(el, opts)
        sep = opts[:sep] || ""
        el.children.map {|c| send("convert_#{c.type}", c, opts) }.compact.join(' & ') << " \\\\ #{sep}\n"
      end

      def convert_thead(el, opts)
        opts = opts.dup.merge(style: 'textbf', sep: "")
        inner(el, opts)
      end

      def convert_tbody(el, opts)
        super
      end      

      def convert_td(el, opts)
        opts = opts.dup.merge(hypenate: true)
        text = inner(el, opts)
        text.gsub!("\\newline\n", '\break \break')
        
        if text.empty?
          ""
        else
          span = nil
          spans = []          
          if @colspan
            spans << "c=#{@colspan}"
            @colspan = nil
          end
          if @rowspan
            spans << "r=#{@rowspan}"
            @rowspan = nil
          end
          unless spans.empty?
            span = "\\SetCell[#{spans.join(',')}]{c}"
          end
          if opts[:style]
            "#{span}\\#{opts[:style]}{#{text}}"
          else
            "#{span}{#{text}}"
          end
        end
      end

      def convert_ul(el, opts)
        if el.attr['class'] == 'tight'
          type = el.type == :ul ? 'itemize' : 'enumerate'
          <<EOT
\\begin{#{type}}
\\setlength\\itemsep{-0.5em}
#{inner(el, opts)}\\end{#{type}}
EOT
        else
          super
        end
      end
      alias convert_ol convert_ul

      def convert_text(el, opts)
        kls =  opts[:parent].attr['class']
        close = open = nil
        case kls
        when 'large'
          open = '\\Large{'
          close = '}'
        end

        text = super
        if opts[:hypenate]
          text = text.gsub(/[A-Za-z0-9{}]+/) do |w|
            if w.index('{').nil? and w.length > 10
              w.gsub(/([A-Z]+[a-z]+)(?=[A-Z])/, '\1\-\2')
            else
              w
            end
          end
        end
          
        "#{open}#{text}#{close}"
      end

      def convert_p(el, opts)
        text = ''
        close = nil
        case el.attr['class']
        when 'center'
          text << "\\begin{center}\n"
          close = "\\end{center}\n"
        end
        
        if el.children.size == 1 && el.children.first.type == :img
          text << convert_img(el.children.first, opts)
        else
          text << "#{latex_link_target(el)}#{inner(el, opts)}\n\n"
        end
        text << close if close
        
        text
      end

      def convert_img(el, opts)
        src = el.attr['src']
        alt = el.attr['alt']
        title = el.attr['title']
        width = el.attr['width']

        puts "Image: #{src}, #{alt}, #{title}"
        figure = "\\begin{figure}[ht]\n"

        if src =~ /\.tex$/
          figure << "\\input{#{src}}\n"
        else
          figure << "\\centering{\\includegraphics[width=#{width}\\textwidth]{#{src}}}"
        end

        caption = alt
        label = "  \\label{fig:#{title}}" if title
        
        figure << <<EOT
\\captionsetup{justification=centering}
\\caption{#{caption}}
#{label}
\\end{figure}
EOT
      end

      def latex_caption(text)
        ::Kramdown::Document.new(text, input: 'MTCKramdown').to_mtc_latex.strip
      end

      def convert_labels(text)
        text.gsub(/\{#([^}]+)}/, '\\label{\1}')
      end

      def convert_math(el, _opts)
        puts "*** Math: #{el.inspect}"
        convert_labels(super)
      end


      def convert_codeblock(el, _opts)
        language = extract_code_language(el.attr)
        if !el.attr.include?('start') or el.attr['start'].empty?
          line = 1
        elsif el.attr['start'] =~ /[0-9]+/i
          line = el.attr['start'].to_i
        else
          line = el.attr['start']
        end
        escape = el.attr['escape']
        caption, label = caption_and_label(el, 'lst')
        
        code = el.value
        code = convert_labels(code) if escape

        options = ['numbers=left', 'xleftmargin=2em', "firstnumber=#{line}"]
        options << "language=#{language.upcase}" if language
        options << "caption={#{caption}}" if caption
        options << "label={#{label}}" if label
        options << "escapechar={#{escape}}" if escape
        
        <<EOT
\\begin{lstlisting}[#{options.join(',')}]
#{code}\\end{lstlisting}
EOT
      end
    end
  end
end

module MarkdownConverter
  def self.generate_latex(file, directory)
    FileUtils.mkdir_p(directory)

    dest = "#{directory}/#{File.basename(file)}.tex"
    
    puts "\n#{'-' * 32}\nRendering #{file} -> #{dest}"
    kd = Kramdown::Document.new(File.read(file), input: 'MTCKramdown', html_to_native: true)
    File.write(dest, kd.to_mtc_latex)
    puts kd.warnings
  end
end

if __FILE__ == $PROGRAM_NAME
  if ARGV.length > 0
    files = ARGV
  else
    files = Dir['*.md'].sort
  end

  files.each do |f|
    MarkdownConverter.generate_latex(f, 'converted')
  end
end