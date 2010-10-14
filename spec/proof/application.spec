# -*- encoding: utf-8 -*-

require 'spec_helper'

module Proof
  
  describe Application do
    let(:output) { double('output').as_null_object }
    
    it "should read a single filename from arguments" do
      args = ['example.txt']
      Proof::Application.run(output, args)
      Proof::Application.targets[0].should == 'example.txt'
    end
    
  end
  
end