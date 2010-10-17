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
    
    # Sets the date of the Report
    def date()
      @report.date = Time.now
    end
    
    # Returns the completed Report
    def report()
      title()
      date()
      @report
    end
    
    # Sets the title of the Report
    def title()
      @report.title = "Readability Report"
    end
    
    # Produces a verdict for the Report
    def verdict()
       @report.verdict = {}
    end
    
  end
end
