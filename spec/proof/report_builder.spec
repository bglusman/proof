# -*- encoding: utf-8 -*-

require 'spec_helper'

module Proof
  
  describe ReportBuilder do
    
    it "should return a ContentReport" do 
      content = contents('small.txt')
      report_builder = Proof::ReportBuilder.new(content)
      report = report_builder.report()
      report.should be_kind_of(Proof::ContentReport)
    end
    
  end
  
end