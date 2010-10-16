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
    
    # Returns the report data formatted with the template
    def render(template)
      ERB.new(template).result(binding)
    end
    
    # Returns the total number of paragraphs for all of the summaries
    def total_paragraphs
      @summaries.inject(0) do |total, summary|
        total + summary.readability.num_paragraphs
      end
    end
    
  end
end
