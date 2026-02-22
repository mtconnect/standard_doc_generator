
package :qif, 'QIF Assets' do

  enum :QifDocumentType, 'type of qif document' do
    extensible
    value :MEASUREMENT_RESOURCE, ''
    value :PLAN, ''
    value :PRODUCT, ''
    value :RESULTS, ''
    value :RULES, ''
    value :STATISTICS, ''
  end

  type :QIFDocument, 'QIF document' do
    mixed
    ordered
    member :any, 'Any elements', 1
  end
  
  type :QIFDocumentWrapper, 'QIF document wrapper', :Asset do
    member :QifDocumentType, 'contained QIF Document type', 0..1
    member :QIFDocument, 'QIF Document as given by the QIF standard', 1
    
    member :Description, 'description of an asset', 0..1, :AssetDescription
    member :Configuration, 'The configuration information about this Asset', 0..1, :AssetConfiguration
  end

end
