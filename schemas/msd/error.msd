
package :Error, 'The error package' do
  basic_type :ErrorDescription, 'The text description of the error'
  enum :ErrorCode, 'The error code' do
    value :UNAUTHORIZED, 'The request did not have sufficient permissions to perform the request.'
    value :NO_DEVICE, 'The device specified in the URI could not be found.'
    value :OUT_OF_RANGE, 'The sequence number was beyond the end of the buffer.'
    value :TOO_MANY, 'The count given is too large.'
    value :INVALID_URI, 'The URI provided was incorrect.'
    value :INVALID_REQUEST, 'The request was not one of the three specified requests.'
    value :INTERNAL_ERROR, 'Contact the software provider, the agent did not behave correctly.'
    value :INVALID_PATH, 'The xpath could not be parsed. Invalid syntax.'
    value :UNSUPPORTED, 'The request is not supported by this implementation'
    value :ASSET_NOT_FOUND, 'The asset ID cannot be found'
  end

  basic_type :URI, 'http request'
  basic_type :ErrorMessage, 'reason for error'
  basic_type :Request, 'text of invalid response document type'

  type :ErrorDeprecated, 'An error description' do
    member :ErrorCode, 'The error code'
    member :Value, 'The description', :ErrorDescription
  end
  
  type :Error, 'An error description' do
    abstract
  end

  enum :QueryParameterName, 'name of parameter' do
    value :device, ''
    value :deviceType, ''
    value :path, ''
    value :from, ''
    value :count, ''
    value :interval, ''
    value :heartbeat, ''
  end

  basic_type :QueryParameterValue, 'given value', :string
  basic_type :QueryParameterType, 'expected datatype', :string
  basic_type :QueryParameterFormat, 'expected datatype format', :string
  basic_type :QueryParameterConstraint, 'constrained value for the parameter', :float

  type :QueryParameter, 'property of the HTTP Request that modifies the information returned by the HTTP Request' do
    member :Name, 'name of the parameter', 1, :QueryParameterName
    member :Maximum, 'maximum allowed value', 0..1, :QueryParameterConstraint
    member :Minimum, 'minimum allowed value', 0..1, :QueryParameterConstraint
    member :Value, 'given value of parameter', 0..1, :QueryParameterValue
    member :Type, 'expected datatype of the parameter', 0..1, :QueryParameterType
    member :Format, 'expected datatype format of the parameter', 0..1, :QueryParameterFormat
  end

  type :InvalidParameterValue, 'supplied value does not match the required type', :Error do
    member :QueryParameter, 'property of the HTTP Request that modifies the information returned by the HTTP Request', 1
    member :URI, 'http request', 1
    member :ErrorMessage, 'reason for error', 0..1
    member :Request, 'text of invalid response document type', 0..1
  end

  type :OutOfRange, 'request for information specifies streaming data that includes sequence number(s) for pieces of data that are beyond the end of the buffer', :Error do
    member :QueryParameter, 'property of the HTTP Request that modifies the information returned by the HTTP Request', 1
    member :URI, 'http request', 1
    member :ErrorMessage, 'reason for error', 0..1
    member :Request, 'text of invalid response document type', 0..1
  end

  basic_type :AssetNotFoundAssetId, 'asset id', :ID

  type :AssetNotFound, 'request for information specifies an Asset that is not recognized by the agent', :Error do
    member :AssetId, 'asset id of asset not found', 1, :AssetNotFoundAssetId
    member :URI, 'http request', 1
    member :ErrorMessage, 'reason for error', 0..1
    member :Request, 'text of invalid response document type', 0..1
  end
  
  type :InternalError, 'agent experienced an error while attempting to publish the requested information', :Error do
    member :URI, 'http request', 1
    member :ErrorMessage, 'reason for error', 0..1
    member :Request, 'text of invalid response document type', 0..1
  end

  type :InvalidQueryParameter, 'agent does not recognize the parameter', :Error do
    member :URI, 'http request', 1
    member :ErrorMessage, 'reason for error', 0..1
    member :Request, 'text of invalid response document type', 0..1
  end
  
  type :InvalidRequest, 'request contains information that was not recognized by the agent', :Error do
    member :URI, 'http request', 1
    member :ErrorMessage, 'reason for error', 0..1
    member :Request, 'text of invalid response document type', 0..1
  end
  
  type :InvalidURI, 'URI provided was incorrect', :Error do
    member :URI, 'http request', 1
    member :ErrorMessage, 'reason for error', 0..1
    member :Request, 'text of invalid response document type', 0..1
  end
  
  type :InvalidXPath, 'XPath is either structurally malformed or the XPath does not exist', :Error do
    member :URI, 'http request', 1
    member :ErrorMessage, 'reason for error', 0..1
    member :Request, 'text of invalid response document type', 0..1
  end
  
  type :NoDevice, 'identity of the Device specified in the request for information is not associated with the agent', :Error do
    member :URI, 'http request', 1
    member :ErrorMessage, 'reason for error', 0..1
    member :Request, 'text of invalid response document type', 0..1
  end
  
  type :QueryError, 'agent was unable to interpret the query', :Error do
    member :URI, 'http request', 1
    member :ErrorMessage, 'reason for error', 0..1
    member :Request, 'text of invalid response document type', 0..1
  end
  
  type :TooMany, 'more than agent is capable of handling', :Error do
    member :URI, 'http request', 1
    member :ErrorMessage, 'reason for error', 0..1
    member :Request, 'text of invalid response document type', 0..1
  end
  
  type :Unauthorized, 'requester does not have sufficient permissions to access the requested information', :Error do
    member :URI, 'http request', 1
    member :ErrorMessage, 'reason for error', 0..1
    member :Request, 'text of invalid response document type', 0..1
  end
  
  type :Unsupported, 'valid request was provided, but the agent does not support the feature or type of request', :Error do
    member :URI, 'http request', 1
    member :ErrorMessage, 'reason for error', 0..1
    member :Request, 'text of invalid response document type', 0..1
  end
  

end
