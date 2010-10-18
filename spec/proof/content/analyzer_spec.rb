# -*- encoding: utf-8 -*-

require 'spec_helper'

module Proof
  module Content
  
  describe Analyzer do
  
      describe ".analyze" do
  
        it "should generate a Summary from the provided content" do
          content = contents('small.txt')
          summary = Proof::Content::Analyzer.analyze('small.txt', content, READABILITY_ATTRIBUTES)
          summary.should be_kind_of(Proof::Content::Summary)
        end

      end
  
    end
  
  end
  
end
