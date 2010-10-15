# -*- encoding: utf-8 -*-

module Proof
  # Builder for Report objects
  # Constructs a Report from one or more Summaries
  class ReportBuilder
    attr_accessor :report, :summaries
    def initialize(summaries)
      @summaries = summaries
      @report = Proof::Report.new(@summaries)
    end
    
    # Returns the completed Report
    def report()
      @report
    end
    
  end
end
