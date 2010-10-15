# -*- encoding: utf-8 -*-

require 'spec_helper'

module Proof
  
  describe Report do
    let(:summaries) { mock_summaries }
    
    it "should render itself using a Markdown template" do
      template = get_template('report.erb.md') 
      report_builder = Proof::ReportBuilder.new(summaries)
      report = report_builder.report()
      output = report.render(template)
      # FIXME: Use a smarter expectation
      output.should_not be_nil
    end
    
  end
  
end