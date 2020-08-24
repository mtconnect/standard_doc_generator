require 'markdown_parser'

module Extensions

  include MarkDownParser
  
  def xmi_stereotype(e)
    id = e['xmi:id']
    type = e['xmi:type']
    attr = if type == 'uml:Class'
             'base_Class'
           elsif type == 'uml:Realization'
             'base_Realization'
           else
             if e['association']
               id = e['association']
               'base_Association'
             else
               'base_Property'
             end
           end
    if attr
      stereo = e.document.root.at("/xmi:XMI/*[@base_Element='#{id}']")
      stereo = e.document.root.at("/xmi:XMI/*[@#{attr}='#{id}']") unless stereo
      stereo.name if stereo and stereo.name != 'ValueProperty' #since every value type has ValueProperty stereotype
    end
  end

  def xmi_documentation(e)
    documentation = ""
	e.xpath('./ownedComment').map do |comment|
      documentation += comment['body'] ? comment.at('ownedComment') ? format_markdown(comment.at('ownedComment')['body']) : format_markdown(comment['body']) : ""
	end
	return documentation
  end

  def get_multiplicity(r)
    lower = upper = '1'
    if r.at('upperValue')
      upper = r.at('upperValue')['value']	
	  upper = '0' unless upper
    end
    
    if r.at('lowerValue')
      lower = r.at('lowerValue')['value']
      lower = '0' unless lower
    end


    # $logger.debug "  Multiplicity for #{r.to_s}: #{lower} #{upper}"

    [lower == upper ? upper : "#{lower}..#{upper}",
     optional = lower == '0']
  end
end
