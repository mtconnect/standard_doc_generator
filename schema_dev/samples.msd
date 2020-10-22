
package :Samples, 'The samples' do
  attr :SampleRate, 'The target rate a value can be sampled', :float
  attr :CountValue, 'The number of items in the list', :integer
  
  basic_type(:FloatSampleValue, 'Common floating point sample value') {
    union(:float, :UnavailableValue)
  }
  basic_type(:ThreeSpaceSampleValue, 'Common floating point sample value') {
    union(:ThreeSpaceValue, :UnavailableValue)
  }  
  
  type :Sample, 'An abstract sample' do
    abstract
    mixed
    member :Observation, 'The attributes for all observations'
    
    member :SampleRate, 'The rate the waveform was sampled at, default back to the value given in the data item', 0..1
    member :ResetTriggered, 'An optional indicator that the event or sample was reset', 0..1, :DataItemResetValue
    member :Statistic, 'The statistical operation on this data', 0..1, :DataItemStatistics
    member :Duration, 'The number of seconds since the reset of the statistic', 0..1, :DurationTime
  end

  type :CommonSample, 'A sample with a single floating point value', :Sample do
    member :Value, 'A floating ppint value', :FloatSampleValue
  end

  type :ThreeSpaceSample, 'A sample with a three tuple floating point value', :Sample do
    member :Value, 'A floating ppint value', :ThreeSpaceSampleValue
  end    

  type :AbsTimeSeries, 'The abstract waveform', :Sample do
    abstract
    attribute :SampleCount, 'The number of samples', :CountValue    
  end
  
  type :TimeSeries, 'An abstract time series with the restriction value', :AbsTimeSeries do
    abstract    
    member :Value, 'The time series representation', :FloatListValue
  end

  Glossary.samples.each do |name, sample|
    next unless sample['parent'] == 'Sample'

    if sample['units'].end_with?("3D")
      type(name.to_sym, sample['description'], :ThreeSpaceSample) 
    else
      type(name.to_sym, sample['description'], :CommonSample)    
      type("#{name}TimeSeries".to_sym, "Time series of #{sample['description']}", :TimeSeries)
    end
  end
end
