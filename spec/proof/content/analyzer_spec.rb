# -*- encoding: utf-8 -*-

require 'spec_helper'

module Proof
  module Content
  
  describe Analyzer do
  
      describe ".summarize" do
  
        it "generates a summary from the provided text" do
          text = contents('small.txt')
          summary = Proof::Content::Analyzer.summarize('small.txt', text, SUMMARY_ATTRIBUTES)
          summary.should be_kind_of(Hash)
        end

      end
  
      describe "#statistics" do
  
        it "generates a Hash of statistics from the provided text" do
          text = contents('small.txt')
          analyzer = Proof::Content::Analyzer.new(text)
          summary = analyzer.statistics(SUMMARY_ATTRIBUTES)
          summary.should be_kind_of(Hash)
        end

      end
  
    end
  
  end
  
end
