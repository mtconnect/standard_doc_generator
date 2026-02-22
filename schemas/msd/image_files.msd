package :ImageFiles, 'collection of files containing images' do

  attr :MediaType, 'mime type of the file'  

  type :ImageFiles, 'A collection of image files', :AbstractConfiguration do
    mixed
    member :ImageFile, 'file containing an image', 1..INF
  end

  type :ImageFile, 'file containing an image' do
    member :Id, 'unique identifier of the image file', :ID
    member :Name, 'description of the image file', 0..1
    member :MediaType, 'mime type of the file'
    attribute :'href', 'Reference to the file', :'xlink:href'
  end  
end
