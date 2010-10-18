# -*- encoding: utf-8 -*-

module Proof
  # Builder for Report objects
  # Constructs a Report from one or more summaries
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
    
    # For the specified attribute, 
    # returns the mean average score for all of the summaries
    def mean(attribute)
      total(attribute) / @summaries.length
    end
    
    # Returns the completed Report
    def report()
      title()
      date()
      verdict()
      @report
    end
    
    # Sets the title of the Report
    def title()
      @report.title = "Readability Report"
    end
    
    # For the specified attribute, 
    # returns the total score for all of the summaries
    def total(attribute)
      @summaries.inject(0) do |t, summary|
        t + summary[:statistics][attribute]
      end
    end
    
    # Produces a verdict for the Report
    def verdict()
      @report.verdict = {}
      @report.verdict[:flesch] = Proof::Formula::Flesch.explain(mean(:flesch))
      @report.verdict[:kincaid] = Proof::Formula::Kincaid.explain(mean(:kincaid))
      @report.verdict[:fog] = Proof::Formula::Fog.explain(mean(:fog))
    end
    
  end
end
