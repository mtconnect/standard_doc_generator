$: << File.dirname(__FILE__)

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
		   elsif type == 'uml:Enumeration'
		     'base_Enumeration'
           else
             if e['association']
               id = e['association']
               'base_Association'
             else
               'base_Element'
             end
           end
    if attr
      element_stereo = e.document.root.at("/xmi:XMI/*[@base_Element='#{id}']")
      element_stereo = e.document.root.at("/xmi:XMI/*[@#{attr}='#{id}']") unless element_stereo
	  element_stereo_name = element_stereo ? element_stereo.name : ''
	  
	  property_stereo = e.document.root.at("/xmi:XMI/*[@base_Property='#{e['xmi:id']}']")
	  property_stereo_name = (property_stereo and property_stereo.name!='Restriction') ? property_stereo.name : ''
      
	  return [element_stereo_name, property_stereo_name]
    end
  end

  def xmi_documentation(e)
	comment = e.at('ownedComment')
    return (comment and comment['body']) ? comment['body'] : ''
  end

  def xmi_additional_documentation(e)
    documentation = ''
	e.xpath('./ownedComment').map do |comment|
      documentation += comment['body'] ? comment.at('ownedComment') ? "\n#{comment.at('ownedComment')['body']}" : '' : ''
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
