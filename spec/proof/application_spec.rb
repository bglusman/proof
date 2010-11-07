# -*- encoding: utf-8 -*-

require 'spec_helper'

module Proof
  
  describe Application do
    let(:output) { double('output').as_null_object }

    before(:all) do
      Proof::Application.output = output
    end
    
    before(:each) do
      Proof::Application.config = nil
    end
    
    it "builds a list of files for a single directory" do
      sources = [File.join('spec', 'files')]
      files = Proof::Application.list_files(sources)
      files.length.should == 2
    end
    
    it "builds a list of files from two sources" do
      sources = [File.join('spec', 'files', 'gutenburg'), 
        File.join('spec', 'files', 'small.txt')]
      files = Proof::Application.list_files(sources)
      files.length.should == 2
    end
    
    it "gets a template for the short report format" do
      template = Proof::Application.get_template(:short)
      template.should_not be_nil
    end
    
    describe "#read_arguments" do
    
      it "reads a single filename from arguments" do
        args = ['example.txt']
        sources = Proof::Application.read_arguments(args)
        sources[0].should == 'example.txt'
      end
    
      it "reads three filenames from arguments" do
        args = ['example1.txt', 'example2.txt', 'example3.txt']
        sources = Proof::Application.read_arguments(args)
        sources[0].should == 'example1.txt'
        sources[1].should == 'example2.txt'
        sources[2].should == 'example3.txt'
      end
    
      it "sets the output format from a short-form argument" do
        args = ['-f', 'full', 'example.txt']
        Proof::Application.read_arguments(args)
        Proof::Application.config[:format].should == :full
      end
    
      it "sets the output format from a long-form argument" do
        args = ['--format=full', 'example.txt']
        Proof::Application.read_arguments(args)
        Proof::Application.config[:format].should == :full
      end
    
    end
      
    describe "#report" do

      it "returns a Report for a single source file" do
        filename = File.join('spec', 'files', 'small.txt')
        sources = [filename]
        report = Proof::Application.report(sources)
        report.should be_kind_of(Proof::Report)
      end

    end
    
    describe "#setting" do
      
      it "should return a single default setting" do
        setting = Proof::Application.setting(:report_title)
        setting.should == 'Readability Report'
      end
      
      it "should return a default Hash setting" do
        setting = Proof::Application.setting(:formats)
        setting.should be_kind_of(Hash)
      end
      
      it "should return a single setting from the config hash" do
        Proof::Application.config = { :test_setting => 'Test Setting' }
        setting = Proof::Application.setting(:test_setting)
        setting.should == 'Test Setting'
      end
      
      it "should return a Hash from the config hash" do
        Proof::Application.config = { :test_hash => {:test_setting => 'Test Setting'} }
        setting_hash = Proof::Application.setting(:test_hash)
        setting_hash.should include(:test_setting)
      end
      
    end
    
  end
      
end
