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
        
  end
  
end