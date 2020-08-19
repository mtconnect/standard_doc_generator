module MarkDownParser

	def format_markdown(description)
		
		#format terms
		description = format_block(format_property(format_glossary_term(description)))

		#format references
		description = format_citation(format_reference(description))
		
		#format deprecation
		description = format_deprecation(format_deprecation_warning(format_strikeout(description)))
		
		#format styles
		description = format_math_char(format_italics(format_bolds(format_monospaces(description))))

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
		return format_glossary_termplural(description)
	end
	
	def format_glossary_termplural(description)
		terms = description.scan(/{{termplural\(([a-zA-Z0-9*\/\-: _]+)\)}}/)
		terms.each do |term|
			term_command = "{{termplural("+ term[0] +")}}"
			term_latex = "\\glspl{" +term[0]+ "}"
			description = description.gsub(term_command,term_latex)
		end
		return description
	end
	
	def format_citation(description)
		citations = description.scan(/{{cite\(([a-zA-Z0-9*\/\-: _]+)\)}}/)
		citations.each do |citation|
			citation_command = "{{cite("+ citation[0] +")}}"
			citation_latex = "\\cite{" +citation[0]+ "}"
			description = description.gsub(citation_command,citation_latex)
		end
		return description
	end
	
	def format_reference(description)
		refs = description.scan(/{{ref\(([a-zA-Z0-9*\/\-: _]+)\)}}/)
		refs.each do |ref|
			ref_command = "{{ref("+ ref[0] +")}}"
			ref_latex = "\\ref{" +ref[0]+ "}"
			description = description.gsub(ref_command,ref_latex)
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
end
