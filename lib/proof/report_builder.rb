# -*- encoding: utf-8 -*-

module Proof
  # Builder for Report objects
  class ReportBuilder
    attr_accessor :content, :report
    def initialize(content)
      @content = content
      @report = Proof::ContentReport.new()
    end
    
    # Returns the completed Report
    def report()
      @report
    end
    
  end
end
