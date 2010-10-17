# -*- encoding: utf-8 -*-

require 'spec_helper'

module Proof
  
  describe Application do
    let(:output) { double('output').as_null_object }

    before(:all) do
      Proof::Application.output = output
    end
    
    it "should build a list of files for a single directory" do
      sources = [File.join('spec', 'files')]
      files = Proof::Application.list_files(sources)
      files.length.should == 2
    end
    
    it "should build a list of files from two sources" do
      sources = [File.join('spec', 'files', 'gutenburg'), 
        File.join('spec', 'files', 'small.txt')]
      files = Proof::Application.list_files(sources)
      files.length.should == 2
    end
    
    it "should get a template for the short report format" do
      template = Proof::Application.get_template(:short)
      template.should_not be_nil
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
        args = ['-f', 'full', 'example.txt']
        Proof::Application.read_arguments(args)
        Proof::Application.config[:format].should == :full
      end
    
      it "should set output format from long-form argument" do
        args = ['--format=full', 'example.txt']
        Proof::Application.read_arguments(args)
        Proof::Application.config[:format].should == :full
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
