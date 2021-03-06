# -*- encoding: utf-8 -*-

module Proof
  # Builder for Report objects
  # Constructs a Report from one or more summaries
  class ReportBuilder
    attr_accessor :report, :summaries, :total_attributes
    def initialize(name, summaries, total_attributes)
      @total_attributes = total_attributes
      @summaries = summaries
      @report = Proof::Report.new(@summaries)
      title(name)
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
      date()
      totals(@total_attributes)
      verdict()
      @report
    end
    
    # Sets the title of the Report
    def title(name)
      @report.title = name
    end
    
    # For the specified attribute, 
    # returns the total score for all of the summaries
    def total(attribute)
      @summaries.inject(0) do |t, summary|
        t + summary[:statistics][attribute]
      end
    end
    
    # Produces a set of totals for the Report
    def totals(attributes)
      @report.totals = {}
      attributes.each do |a|
        @report.totals[a] = total(a)  
      end
    end
    
    # Produces a verdict for the Report
    def verdict()
      @report.verdict = {}      
      @report.verdict[:flesch] = {}
      @report.verdict[:flesch][:score] = mean(:flesch)
      @report.verdict[:flesch][:explanation] = Proof::Formula::Flesch.explain(@report.verdict[:flesch][:score])
      @report.verdict[:kincaid] = {}
      @report.verdict[:kincaid][:score] = mean(:kincaid)
      @report.verdict[:kincaid][:explanation] = Proof::Formula::Kincaid.explain(@report.verdict[:kincaid][:score])
      @report.verdict[:fog] = {}
      @report.verdict[:fog][:score] = mean(:fog)
      @report.verdict[:fog][:explanation] = Proof::Formula::Fog.explain(@report.verdict[:fog][:score])      
    end
    
  end
end
