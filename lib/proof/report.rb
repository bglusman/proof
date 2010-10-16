# -*- encoding: utf-8 -*-

require 'erb'

module Proof
  # Report of the results of the analysis
  # Each Report encloses one or more Summary objects,
  # and also has it's own aggregate information 
  class Report
    include ERB::Util
    attr_accessor :date, :summaries, :title
    
    def initialize(summaries)
      @summaries = summaries
    end
    
    # Return the report data formatted with the template
    def render(template)
      ERB.new(template).result(binding)
    end
    
  end
end
