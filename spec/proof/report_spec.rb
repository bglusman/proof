# -*- encoding: utf-8 -*-

require 'spec_helper'

module Proof
  
  describe Report do
    let(:summaries) { mock_summaries(3) }
    
    describe "#render" do
    
      it "should render itself using a Markdown template" do
        template = get_template('short.md.erb') 
        report_builder = Proof::ReportBuilder.new(summaries)
        report = report_builder.report()
        output = report.render(template)
        output.should_not be_nil
      end
    
    end
    
    describe "#report calculated totals" do

      it "should give the mean number of characters" do
        report_builder = Proof::ReportBuilder.new(summaries)
        report = report_builder.report()
        total = report.total(:num_characters)
        total.should_not be_nil
      end
      
      it "should give the mean number of paragraphs" do
        report_builder = Proof::ReportBuilder.new(summaries)
        report = report_builder.report()
        total = report.total(:num_paragraphs)
        total.should_not be_nil
      end
      
      it "should give the mean number of sentences" do
        report_builder = Proof::ReportBuilder.new(summaries)
        report = report_builder.report()
        total = report.total(:num_sentences)
        total.should_not be_nil
      end
      
      it "should give the mean number of words" do
        report_builder = Proof::ReportBuilder.new(summaries)
        report = report_builder.report()
        total = report.total(:num_sentences)
        total.should_not be_nil
      end
      
    end
    
    describe "#report calculated means" do

      it "should give the mean number of characters" do
        report_builder = Proof::ReportBuilder.new(summaries)
        report = report_builder.report()
        mean = report.mean(:num_characters)
        mean.should_not be_nil
      end
      
      it "should give the mean number of paragraphs" do
        report_builder = Proof::ReportBuilder.new(summaries)
        report = report_builder.report()
        mean = report.mean(:num_paragraphs)
        mean.should_not be_nil
      end
      
      it "should give the mean number of sentences" do
        report_builder = Proof::ReportBuilder.new(summaries)
        report = report_builder.report()
        mean = report.mean(:num_sentences)
        mean.should_not be_nil
      end
      
      it "should give the mean number of words" do
        report_builder = Proof::ReportBuilder.new(summaries)
        report = report_builder.report()
        mean = report.mean(:num_sentences)
        mean.should_not be_nil
      end
      
    end
    
  end
  
end