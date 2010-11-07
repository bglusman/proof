# -*- encoding: utf-8 -*-

require 'find'
require 'optparse'

module Proof
  module Application
    extend self
    attr_accessor :config, :output

    # Returns the template for the specified format
    def get_template(format)
      templates = setting(:formats)
      File.read(File.join(setting(:layouts_dir), templates[format]))
    end
        
    # Returns a list of all of the files from the given sources
    def list_files(sources)
      files = []
      sources.each do |source|
        Find.find(source) do |item|
          if File.basename(item)[0] == ?.
            Find.prune    
          else
            files << item if File.file?(item)
          end
        end
      end
      files
    end
        
    # Parse the provided arguments
    def read_arguments(args)
      @config = Proof::Configuration::DEFAULTS unless @config
      options = OptionParser.new() do |opts|
        opts.banner = "Usage: proof [options] FILE1 FILE2 FILE3"
        opts.separator ""
        opts.separator "Options:"
        opts.separator ""
        opts.on( '-f', '--format FORMAT', 
          'Specifies the format of the report' ) do |f|
          @config[:format] = f.to_sym
        end
        opts.on( '-t', '--title TITLE', 
          'Specifies the title of the report' ) do |t|
          @config[:title] = t
        end
        opts.on( '-v', '--version', 'Show version' ) do
          puts "Proof #{Proof::VERSION}"
          exit
        end
        opts.on( '-h', '--help', 'Display this information' ) do
          puts opts
          exit
        end 
      end
      options.parse!(args)
    end
    
    # Returns a Report for the specified files 
    def report(filenames)
      summaries = []
      filenames.each do |filename|
        content = File.read(filename) 
        summaries << Proof::Content::Analyzer.summarize(filename, content, setting(:summary_attributes))
      end
      report_builder = Proof::ReportBuilder.new(setting(:report_title), summaries, setting(:report_totals))
      report_builder.report()
    end
    
    # Executes the process
    def run(output=STDOUT, args=ARGV)
      @output = output
      sources = read_arguments(args)
      if sources.empty?
        @output.puts 'Proof: Please specify one or more files to analyze.'
        exit(1)
      else
        files = list_files(sources)
        report = report(files)
        template = get_template(setting(:report_format))
        @output.puts report.render(template)
        exit
      end
    end
    
    # Returns configuration setting or the default value
    def setting(key)
      if @config
        @config[key] || Proof::Configuration::DEFAULTS[key]
      else
        Proof::Configuration::DEFAULTS[key]
      end
    end
    
  end
end
