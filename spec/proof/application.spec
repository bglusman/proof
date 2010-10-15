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
    
      it "should read three filenames from arguments" do
        args = ['example1.txt', 'example2.txt', 'example3.txt']
        sources = Proof::Application.read_arguments(args)
        sources[0].should == 'example1.txt'
        sources[1].should == 'example2.txt'
        sources[2].should == 'example3.txt'
      end
    
      it "should set output format from short-form argument" do
        args = ['-f', 'markdown', 'example.txt']
        Proof::Application.read_arguments(args)
        Proof::Application.config[:format].should == :markdown
      end
    
      it "should set output format from long-form argument" do
        args = ['--format=markdown', 'example.txt']
        Proof::Application.read_arguments(args)
        Proof::Application.config[:format].should == :markdown
      end
    
    end

    describe "#read_file" do
    
      it "should read the contents of the source file" do
        filename = File.join('spec', 'files', 'small.txt')
        content = Proof::Application.read_file(filename)
        content.length == 3481
      end
        
    end
      
    describe "#report" do

      it "should return a Report for a single source file" do
        filename = File.join('spec', 'files', 'small.txt')
        sources = [filename]
        report = Proof::Application.report(sources)
        report.should be_kind_of(Proof::Report)
      end

    end
      
  end
      
end
