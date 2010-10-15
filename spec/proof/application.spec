# -*- encoding: utf-8 -*-

require 'spec_helper'

module Proof
  
  describe Application do
    let(:output) { double('output').as_null_object }

    before(:all) do
      Proof::Application.output = output
    end
    
    describe "#read_arguments" do
    
      it "should read a single filename from arguments" do
        args = ['example.txt']
        sources = Proof::Application.read_arguments(args)
        sources[0].should == 'example.txt'
      end
    
    end

    describe "#read_file" do
    
      it "should read the contents of the source file" do
        filename = File.join('spec', 'files', 'small.txt')
        content = Proof::Application.read_file(filename)
        content.length == 3481
      end
    
    end
    
  end
  
end