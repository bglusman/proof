# -*- encoding: utf-8 -*-

module Proof
  # Report of the results of the analysis
  # Each Report encloses one or more Summary objects,
  # and also has it's own aggregate information 
  class Report
    attr_accessor :summaries
    
    def initialize(summaries)
      @summaries = summaries
    end
    
    # Return a formatted plain-text report
    def to_s()
    end
    
  end
end
