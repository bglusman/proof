# -*- encoding: utf-8 -*-

require 'spec_helper'

module Proof
  
  describe ReportBuilder do
    let(:summaries) { mock_summaries }
    
    it "should return a Report from the provided collection of Summary objects" do 
      report_builder = Proof::ReportBuilder.new(summaries)
      report = report_builder.report()
      report.should be_kind_of(Proof::Report)
    end
    
    it "should set the date of the Report" do
      report = Proof::ReportBuilder.new(summaries).report()
      report.date.should be_kind_of(Time)
    end
    
    it "should set the title of the Report" do
      report = Proof::ReportBuilder.new(summaries).report()
      report.title.should == "Readability Report"      
    end
    
  end
  
end