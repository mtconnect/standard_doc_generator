module MarkDownParser

	def format_markdown(description)
		description = format_block(description)
		description = format_property(description)
		description = format_glossary_term(description)
		description = format_citation(description)
		description = format_reference(description)
		description = format_deprecation(description)
		description = format_deprecation_warning(description)
		return format_strikeout(description)
	end

	def format_block(description)
		description.gsub(/{block:/,"\\block{") 
	end
	
	def format_property(description)
		properties = description.scan(/{(\w+)::(\w+)}/)
		properties.each do |property|
			property_command = "{"+property[0]+"::"+property[1]+"}"
			property_latex = "\\property{"+property[0]+"}{"+property[1]+"}"
			description = description.gsub(property_command,property_latex)
		end
		return description
	end

	def format_glossary_term(description)
		description.gsub(/{term:/,"\\gls{").gsub(/{termplural:/,"\\glspl{")
	end

	def format_citation(description)
		description.gsub(/{cite:/,"\\cite{")
	end
	
	def format_reference(description)
		description.gsub(/{ref:/,"\\ref{")
	end
	
	def format_deprecation(description)
		deprecations = description.scan(/{deprecated:(.[^{]*)}/m)
		deprecations.each do |deprecation|
			deprecation_command = "{deprecated:"+deprecation[0]+"}"
			deprecation_md = "**DEPRECATED:** "+deprecation[0]
			description = description.gsub(deprecation_command,deprecation_md)
		end
		return description
	end
	
	def format_deprecation_warning(description)
		deprecations = description.scan(/{deprecation warning:(.[^{]*)}/m)
		deprecations.each do |deprecation|
			deprecation_command = "{deprecation warning:"+deprecation[0]+"}"
			deprecation_md = "**DEPRECATION WARNING:** "+deprecation[0]
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

end