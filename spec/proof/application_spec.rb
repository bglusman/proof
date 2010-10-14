require 'spec_helper'

module Proof
  
  describe Application do
    let(:output) { double('output').as_null_object }
    let(:app) { Application.new(output) }
    
    it "should run" do
      pending
    end
    
  end
  
end