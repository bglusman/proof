# -*- encoding: utf-8 -*-

require 'spec_helper'

module Proof
  module Formula
  
    describe Kincaid do
    
      describe ".explain" do 
    
        it "should return an explanation for a value greater than 18" do
          explanation = Proof::Formula::Kincaid.explain(19)
          explanation.should == "someone with post-graduate education"
        end

        it "should return an explanation for a decimal value" do
          explanation = Proof::Formula::Kincaid.explain(15.03)
          explanation.should == "an average college junior student"
        end

        it "should return an explanation for a value less than 5" do
          explanation = Proof::Formula::Kincaid.explain(2)
          explanation.should == "anyone below 5th grade"
        end
        
     end

   end

  end
end
