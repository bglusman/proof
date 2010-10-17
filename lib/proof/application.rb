# -*- encoding: utf-8 -*-

require 'optparse'

module Proof
  module Application
    extend self
    attr_accessor :config, :output, :sources
        
    FORMATS = {
      :full => {:template => 'full.md.erb'},
      :html => {:template => 'full.html.erb'},
      :short => {:template => 'short.md.erb'}
    }
    
    # Returns the template for the specified format
    def get_template(format)
      read_file(File.join('layouts', FORMATS[format][:template]))
    end
    
    # Parse the provided arguments
    def read_arguments(args)
      @config = {} if @config == nil
      options = OptionParser.new() do |opts|
        opts.banner = "Usage: proof [options] FILE1 FILE2 FILE3"
        opts.separator ""
        opts.separator "Options:"
        opts.separator ""
        opts.on( '-f', '--format FORMAT', 
          'Specifies the format of the output' ) do |f|
          @config[:format] = f.to_sym
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

    # Returns the contents of the specified file    
    def read_file(filename)
      File.read(filename)
    end
    
    # Returns a Report from the sources 
    def report(sources)
      summaries = []
      sources.each do |source|
        content = read_file(source)
        summaries << Proof::Content::Analyzer.analyze(source, content)
      end
      report_builder = Proof::ReportBuilder.new(summaries)
      report_builder.report()
    end
    
    # Executes the process
    def run(output=STDOUT, args=ARGV)
      @output = output
      @sources = read_arguments(args)
      if @sources == nil
        @output.puts = 'Please specify one or more files.'
        exit(1)
      else
        report = report(@sources)
        @config[:format] = :short if @config[:format] == nil
        template = get_template(@config[:format])
        @output.puts report.render(template)
        exit
      end
    end
        
  end
end
