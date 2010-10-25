# -*- encoding: utf-8 -*-

require 'spec_helper'

module Proof
  module Formula
  
    describe Flesch do
    
      describe ".explain" do 
    
        it "returns an explanation for a value greater than 100" do
          explanation = Proof::Formula::Flesch.explain(101)
          explanation.should == "very easy to read"
        end

        it "returns an explanation for a decimal value" do
          explanation = Proof::Formula::Flesch.explain(15.03)
          explanation.should == "very hard to read"
        end

        it "returns an explanation for a value less than 30" do
          explanation = Proof::Formula::Flesch.explain(29)
          explanation.should == "very hard to read"
        end
        
     end

   end

  end
end
