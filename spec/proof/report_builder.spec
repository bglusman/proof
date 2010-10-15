# -*- encoding: utf-8 -*-

require 'spec_helper'

module Proof
  
  describe ReportBuilder do
    
    it "should return a Report from the provided collection of Summary objects" do 
      summaries = []
      report_builder = Proof::ReportBuilder.new(summaries)
      report = report_builder.report()
      report.should be_kind_of(Proof::Report)
    end
    
  end
  
end