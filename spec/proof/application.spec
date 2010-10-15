# -*- encoding: utf-8 -*-

require 'spec_helper'

module Proof
  
  describe Application do
    let(:output) { double('output').as_null_object }
    
    it "should read a single filename from arguments" do
      args = ['example.txt']
      Proof::Application.run(output, args)
      Proof::Application.source[0].should == 'example.txt'
    end
    
    it "should read the contents of the source file" do
      filename = File.join('spec', 'files', 'small.txt')
      Proof::Application.output = output
      content = Proof::Application.read_file(filename)
      content.length == 3481
    end
    
  end
  
end