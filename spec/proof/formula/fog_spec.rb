# -*- encoding: utf-8 -*-

require 'spec_helper'

module Proof
  module Formula
  
    describe Fog do
    
      describe ".explain" do 
    
        it "returns an explanation for a value greater than 18" do
          explanation = Proof::Formula::Fog.explain(19)
          explanation.should == "someone with post-graduate education"
        end

        it "returns an explanation for a decimal value" do
          explanation = Proof::Formula::Fog.explain(15.03)
          explanation.should == "an average college junior student"
        end

        it "returns an explanation for a value less than 5" do
          explanation = Proof::Formula::Fog.explain(2)
          explanation.should == "anyone below 5th grade"
        end
        
     end

   end

  end
end
