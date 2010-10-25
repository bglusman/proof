# -*- encoding: utf-8 -*-

require 'spec_helper'

module Proof
  
  describe ReportBuilder do
    let(:summaries) { mock_summaries(3) }
    subject { Proof::ReportBuilder.new('Readability Report', summaries, REPORT_TOTALS) }
    
    it "returns a Report" do 
      subject.report()
      subject.report.should be_kind_of(Proof::Report)
    end
    
    it "sets the date of the Report" do
      subject.date()
      subject.report.date.should be_kind_of(Time)
    end

    it "includes summaries in the Report" do
      subject.should have(3).summaries
    end
    
    it "sets the title of the Report" do
      subject.title('This Report')
      subject.report.title.should == "This Report"      
    end
        
    describe "#total for value" do

      it "gives the total number of characters" do
        total = subject.total(:num_characters)
        total.should == 10443
      end
            
    end
    
    describe "#mean for value" do

      it "gives the mean number of characters" do
        mean = subject.mean(:num_words)
        mean.should == 523
      end
            
    end

    describe "#totals" do
    
      it "includes a set of totals in the Report" do
        subject.totals(REPORT_TOTALS)
        subject.report.totals.should_not be_nil      
      end
      
    end
        
    describe "#verdict" do
    
      it "includes a verdict in the Report" do
        subject.verdict()
        subject.report.verdict.should_not be_nil      
      end

      it "includes a verdict with a Flesch–Kincaid Grade Level" do
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