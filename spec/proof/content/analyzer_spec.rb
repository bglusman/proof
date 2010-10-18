# -*- encoding: utf-8 -*-

require 'spec_helper'

module Proof
  module Content
  
  describe Analyzer do
  
      describe ".summarize" do
  
        it "should generate a summary from the provided content" do
          content = contents('small.txt')
          summary = Proof::Content::Analyzer.summarize('small.txt', content, READABILITY_ATTRIBUTES)
          summary.should be_kind_of(Hash)
        end

      end
  
      describe "#summary" do
  
        it "should generate a summary from the provided content" do
          content = contents('small.txt')
          analyzer = Proof::Content::Analyzer.new(content)
          summary = analyzer.summary(READABILITY_ATTRIBUTES)
          summary.should be_kind_of(Hash)
        end

      end
  
    end
  
  end
  
end
