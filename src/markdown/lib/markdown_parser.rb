module MarkDownParser

	def format_markdown(description)
		
		#format figures and code
		description = format_code(format_diagram(description))
		
		#format terms
		description = format_block(format_property(format_glossary_term(description)))

		#format deprecation
		description = format_deprecation(format_deprecation_warning(format_strikeout(description)))

		#format references
		description = format_reference(format_citation(description))
		
		#format styles
		description = format_math_char(format_italics(format_bolds(format_monospaces(description))))
		
		#format lists and notes
		description = format_list(format_note(description))
		
		#format section headings
		description = format_section_headings(description)

		return format_remaining_cmd(description)
	end

	def format_diagram(description)
		diagrams = description.scan(/!([0-9a-zA-Z .\-_]+)!/)
		diagrams.each do |diagram|
			diagram_name = diagram[0].split('.')[0]
			diagram_name += ' Diagram' if (not diagram_name.end_with?('Diagram') and not diagram_name.end_with?('Example'))
			latex_out = <<-EOT
\\begin{figure}[ht]
  \\centering
    \\includegraphics[width=1.0\\textwidth]{figures/#{diagram[0]}}
  \\caption{#{diagram_name}}
  \\label{fig:#{diagram_name}}
\\end{figure}

\\FloatBarrier
EOT
			description = description.gsub("!#{diagram[0]}!",latex_out)
		end
		return description
	end

	def add_markdown_environment(description)
		if description.length>2 #arbitrary minimum string length
			return "\n\\begin{markdown}\n" + description + "\n\\end{markdown}\n"
		else
			return description
		end
	end

	def format_block(description)
		blocks = description.scan(/{{block\(([a-zA-Z0-9*\/\-: _]+)\)}}/)
		blocks.each do |block|
			block_command = "{{block("+ block[0] +")}}"
			block_latex = "\\block{" + block[0] + "}"
			description = description.gsub(block_command,block_latex)
		end
		return description
	end
	
	def format_property(description)
		properties = description.scan(/{{property\(([a-zA-Z0-9*,\/\-: _]+)\)}}/)
		properties.each do |property|
			property_command = "{{property("+property[0]+")}}"
			block_property = property[0].split(',')
			if block_property.length == 2
				property_latex = "\\property{"+block_property[0]+"}["+block_property[1]+"]"
			else
				property_latex = "\\property{"+block_property[0]+"}"
			end
			description = description.gsub(property_command,property_latex)
		end
		return description
	end

	def format_glossary_term(description)
		terms = description.scan(/{{term\(([a-zA-Z0-9*\/\-: _]+)\)}}/)
		terms.each do |term|
			term_command = "{{term("+ term[0] +")}}"
			term_latex = "\\gls{" +term[0]+ "}"
			description = description.gsub(term_command,term_latex)
		end
		capitalizedTerms = description.scan(/{{Term\(([a-zA-Z0-9*\/\-: _]+)\)}}/)
		capitalizedTerms.each do |term|
			term_command = "{{Term("+ term[0] +")}}"
			term_latex = "\\Gls{" +term[0]+ "}"
			description = description.gsub(term_command,term_latex)
		end
		return format_glossary_termplural(description)
	end
	
	def format_glossary_termplural(description)
		terms = description.scan(/{{termplural\(([a-zA-Z0-9*\/\-: _]+)\)}}/)
		terms.each do |term|
			term_command = "{{termplural("+ term[0] +")}}"
			term_latex = "\\glspl{" +term[0]+ "}"
			description = description.gsub(term_command,term_latex)
		end
		capitalizedTerms = description.scan(/{{Termplural\(([a-zA-Z0-9*\/\-: _]+)\)}}/)
		capitalizedTerms.each do |term|
			term_command = "{{Termplural("+ term[0] +")}}"
			term_latex = "\\Glspl{" +term[0]+ "}"
			description = description.gsub(term_command,term_latex)
		end
		return description
	end
	
	def format_citation(description)
		citations = description.scan(/{{cite\(([a-zA-Z0-9.*\/\-: _]+)\)}}/)
		citations.each do |citation|
			citation_command = "{{cite("+ citation[0] +")}}"
			citation_latex = "\\textit{" +citation[0]+ "}"
			description = description.gsub(citation_command,citation_latex)
		end
		return description
	end
	
	def format_reference(description)
		refs = description.scan(/{{([a-z]+)\(([a-zA-Z0-9*@.\/\-: _]+)\)}}/)
		refs.each do |ref|
			command = "{{#{ref[0]}(#{ref[1]})}}"
			latex = "\\#{ref[0]}{#{ref[1]}}"
			description = description.gsub(command,latex)
		end
		return description
	end
	
	def format_deprecation(description)
		deprecations = description.scan(/{{deprecated\((.[^{]*)\)}}/m)
		deprecations.each do |deprecation|
			deprecation_command = "{{deprecated("+deprecation[0]+")}}"
			#deprecation_md = "**DEPRECATED:** "+deprecation[0]
			deprecation_md = "\\textbf{DEPRECATED:} "+deprecation[0]
			description = description.gsub(deprecation_command,deprecation_md)
		end
		return description
	end
	
	def format_deprecation_warning(description)
		deprecations = description.scan(/{deprecation warning\((.[^{]*)\)}}/m)
		deprecations.each do |deprecation|
			deprecation_command = "{{deprecationwarning("+deprecation[0]+")}}"
			#deprecation_md = "**DEPRECATION WARNING:** "+deprecation[0]
			deprecation_md = "\\textbf{DEPRECATION WARNING:} " + +deprecation[0]
			description = description.gsub(deprecation_command,deprecation_md)
		end
		return description
	end
	
	def format_strikeout(description)
		strikeouts = description.scan(/~~(.*)~~/m)
		strikeouts.each do |strikeout|
			strikeout_command = "~~"+strikeout[0]+"~~"
			strikeout_latex = "\\sout{"+strikeout[0]+"}"
			description = description.gsub(strikeout_command,strikeout_latex)
		end
		return description
	end

	def format_italics(description)
		italics = description.scan(/\*(.+?)\*/)
		italics.each do |italic|
			italic_command = "*"+italic[0]+"*"
			italic_latex = "\\textit{"+italic[0]+"}"
			description = description.gsub(italic_command,italic_latex)
		end
		return description
	end

	def format_bolds(description)
		bolds = description.scan(/\*\*(.+?)\*\*/)
		bolds.each do |bold|
			bold_command = "**"+bold[0]+"**"
			bold_latex = "\\textbf{"+bold[0]+"}"
			description = description.gsub(bold_command,bold_latex)
		end
		return description
	end
	
	def format_whitespaces(description)
		whitespaces = description.scan(/\n(^\s*$)\n/m)
		whitespaces.each do |whitespace|
			whitespace_command = "\n"+whitespace[0]+"\n"
			whitespace_latex = "\n"
			description = description.gsub(whitespace_command,whitespace_latex)
		end
		return description
	end
	
	def format_monospaces(description)
		monospaces = description.scan(/`(.+?)`/)
		monospaces.each do |monospace|
			monospace_command = "`"+monospace[0]+"`"
			monospace_latex = "\\texttt{"+monospace[0]+"}"
			description = description.gsub(monospace_command,monospace_latex)
		end
		return description
	end
	
	def format_math_char(description)
		return description.gsub("^2","$^2$").gsub("^3","$^3$").gsub("_","\\textunderscore ")
	end
	
	def get_section_level(string)
		return "section" if string == "#"
		return "subsection" if string == "##"
		return "subsubsection" if string == "###"
		return "paragraph" if string == "####"
		return "subparagraph" if string == "#####"
	end

	def format_section_headings(description)
		description = "\n"+description if description[0] == "#"
		sections = description.scan(/\n([#]+) (.*)\n/)
		sections.each do |section|
			section_level = get_section_level(section[0])
			section_md = "\n"+section[0]+" "+section[1]+"\n"
			section_heading = section[1].gsub("_","\\textunderscore ")
			section_latex = "\n\\#{section_level}{#{section_heading}}\n\\label{sec:#{section_heading}}\n"
			section_latex += "\\mbox{}\n" if section_level.include?('paragraph')
			description = description.gsub(section_md,section_latex)
		end
		return description
	end
	
	def format_list(description)
		return description if (not description.include?("\n* "))

		list_md_begin = ""
		list_md_end = ""
		list_in_latex = "\n\\begin{itemize}"
		sublist_in_latex = "\n    \\begin{itemize}"

		lines = description.split(/\n(?=[^\n])/).delete_if{|x| x.strip==""}
		lines.each_with_index do |line, i|
			if line.start_with?("* ")
				list_md_begin = description.split(line)[0] if list_md_begin == ""
				list_in_latex += "\n    \\item "+ line[2..-1]
				if (i+1 < lines.length) and lines[i+1].start_with?(" - ")
					lines[i+1..-1].each_with_index do |subline,j|
						sublist_in_latex += "\n        \\item "+ subline[3..-1]
						if (j+1 < lines[i+1..-1].length and (not lines[i+1..-1][j+1].start_with?(" - "))) or (j+1 == lines[i+1..-1].length)
							list_md_end = "\n"+lines[i+1..-1][j+1..-1].join("\n")
							break
						end
					end
					list_in_latex += sublist_in_latex + "\n    \\end{itemize}\n"
				elsif (i+1 < lines.length and (not lines[i+1].start_with?("* "))) or (i+1 == lines.length)
					list_md_end = "\n"+lines[i+1..-1].join("\n")
					break
				end
			end
		end	
		list_in_latex += "\n\\end{itemize}\n"
		
		description = list_md_begin + list_in_latex + list_md_end
		description = format_list(description) if description.include?("\n* ")
		
		return description
	end
	
	def format_note(description)
		return description if (not description.include?("* Note"))

		list_md_begin = ""
		list_md_end = ""
		list_in_latex = "\n\\begin{note}"

		lines = description.split(/\n(?=[^\n])/).delete_if{|x| x.strip==""}
		lines.each_with_index do |line, i|
			if line.start_with?("* Note")
				list_md_begin = description.split(line)[0] if list_md_begin == "" and not description.start_with?("* Note")
				list_in_latex += "\n\\newline #{line[2..-1].split(":",2)[0].upcase} \\tab \\tab #{line.split(":",2)[-1]}"
				if (i+1 < lines.length and (not lines[i+1].start_with?("* Note"))) or (i+1 == lines.length)
					list_md_end = "\n"+lines[i+1..-1].join("\n")
					break
				end
			end
		end	
		list_in_latex += "\n\\end{note}\n"
		
		description = list_md_begin + list_in_latex + list_md_end
		description = format_note(description) if description.include?("* Note")
		
		return description
	end
	
	def format_code(description)
		codes = description.scan(/```(.+?)```/m)
		codes.each do |code|
			caption = code[0].scan(/Caption: ([a-zA-Z0-9\- .]+)\n/)
			caption_name = "Example 1" #Default caption
			caption_name = caption[0][0] if caption[0]
			latex_out = <<-EOT
	\\begin{lstlisting}[firstnumber=1,escapechar=|,% 
	caption={#{caption_name}}, label={lst:#{caption_name}}]
	#{code[0].split("Caption: #{caption_name}")[-1]}
	\\end{lstlisting}
	EOT
			description = description.gsub("```#{code[0]}```",latex_out)
		end
		return description
	end
	
	def format_remaining_cmd(description)
		cmds = description.scan(/{{(.+?)\(\)}}/)
		cmds.each do |cmd|
			cmd_md = "{{"+ cmd[0] +"()}}"
			cmd_latex = "\\" +cmd[0]
			description = description.gsub(cmd_md,cmd_latex)
		end
		return description
	end
end
