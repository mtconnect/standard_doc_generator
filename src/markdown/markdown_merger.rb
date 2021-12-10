$: << File.dirname(__FILE__)

def recurse_input_files(md)
  md.scan(/\{\{input\(([^\)]+)\)\}\}/) do |s|
    input_cmd = "{{input(#{$1})}}"
    input_md = File.read(File.join(MarkdownModel.directory, $1))
    md = md.gsub(input_cmd,input_md)
  end
  return md.match(/\{\{input\(([^\)]+)\)\}\}/) ? recurse_input_files(md) : md
end

main_md_file = File.join(MarkdownModel.directory,'main.md')
main_md = File.read(main_md_file)

File.write(File.join(MarkdownModel.directory,'main_flattened.md'), recurse_input_files(main_md))