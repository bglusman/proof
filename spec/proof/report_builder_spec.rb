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

    it "should include summaries in the Report" do
      subject.should have(3).summaries
    end
    
    it "should set the title of the Report" do
      subject.title()
      subject.report.title.should == "Readability Report"      
    end
        
    describe "#total values" do

      it "should give the total number of characters" do
        report_builder = Proof::ReportBuilder.new(summaries)
        total = report_builder.total(:num_characters)
        total.should == 10443
      end
            
    end
    
    describe "#mean values" do

      it "should give the mean number of characters" do
        report_builder = Proof::ReportBuilder.new(summaries)
        mean = report_builder.mean(:num_words)
        mean.should == 523
      end
            
    end
        
    describe "#verdict" do
    
      it "should include a verdict in the Report" do
        subject.verdict()
        subject.report.verdict.should_not be_nil      
      end

      it "should include a verdict with a Flesch–Kincaid Grade Level" do
        subject.verdict()
        subject.report.verdict.should include(:kincaid)
      end

      it "should include a verdict with a Flesch Reading Ease" do
        subject.verdict()
        subject.report.verdict.should include(:flesch)
      end
    
      it "should include a verdict with a Fog Index" do
        subject.verdict()
        subject.report.verdict.should include(:fog)
      end
      
    end
    
  end
  
end