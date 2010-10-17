# -*- encoding: utf-8 -*-

require 'spec_helper'

module Proof
  
  describe ReportBuilder do
    let(:summaries) { mock_summaries(3) }
    subject { ReportBuilder.new(summaries) }
    
    it "should return a Report" do 
      subject.report()
      subject.report.should be_kind_of(Proof::Report)
    end
    
    it "should set the date of the Report" do
      subject.date()
      subject.report.date.should be_kind_of(Time)
    end

    it "should include Summaries in the Report" do
      subject.should have(3).summaries
    end
    
    it "should set the title of the Report" do
      subject.title()
      subject.report.title.should == "Readability Report"      
    end
    
    it "should include a verdict in the Report" do
      subject.verdict()
      subject.report.verdict.should_not be_nil      
    end
    
  end
  
end