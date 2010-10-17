# -*- encoding: utf-8 -*-

require 'erb'

module Proof
  # Report of the results of the analysis
  # Each Report encloses a Verdict and one or more Summary objects,
  # and also has it's own aggregate information 
  class Report
    attr_accessor :date, :summaries, :title, :verdict
    
    def initialize(summaries, verdict=nil)
      @summaries = summaries
      @verdict = verdict
    end
    
    # For the specified attribute, 
    # returns the mean average score for all of the summaries
    def mean(attribute)
      total(attribute) / @summaries.length
    end
    
    # Returns the report data formatted with the template
    def render(template)
      ERB.new(template, 0, '>').result(binding)
    end
    
    # For the specified attribute, 
    # returns the total score for all of the summaries
    def total(attribute)
      @summaries.inject(0) do |t, summary|
        t + summary.readability.send(attribute)
      end
    end
        
  end
end
