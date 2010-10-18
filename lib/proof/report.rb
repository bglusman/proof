# -*- encoding: utf-8 -*-

require 'erb'

module Proof
  # Report of the results of the analysis
  # Each Report encloses a verdict and one or more summary objects
  class Report
    attr_accessor :date, :summaries, :title, :totals, :verdict
    
    def initialize(summaries, verdict=nil)
      @summaries = summaries
      @verdict = verdict
    end
        
    # Returns the report data formatted with the template
    def render(template)
      ERB.new(template, 0, '>').result(binding)
    end
            
  end
end
