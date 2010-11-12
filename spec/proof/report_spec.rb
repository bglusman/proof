# -*- encoding: utf-8 -*-

require 'spec_helper'

module Proof
  
  describe Report do
    let(:summaries) { mock_summaries(3) }
    
    describe "#render" do
    
      it "renders itself using a Markdown template" do
        template = get_template('short.md.erb') 
        report_builder = Proof::ReportBuilder.new('Readability Report', summaries, REPORT_TOTALS)
        report = report_builder.report()
        output = report.render(template)
        output.should_not be_nil
      end
    
    end
    
    describe "#words_and_syllables" do
      it "counts number of words and syllables in provided text var or defaults to text method" do
        syllables.should_not be_nil
        words.should_not be_nil
      end
      
    end
        
  end
  
end