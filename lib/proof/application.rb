# -*- encoding: utf-8 -*-

require 'find'
require 'optparse'

module Proof
  module Application
    extend self
    attr_accessor :config, :output
      
      DEFAULT_TITLE = 'Readability Report'
      
      REPORT_TOTALS = [:num_paragraphs, :num_sentences, :num_words, :num_characters]
      
      SUMMARY_ATTRIBUTES = [:flesch, :fog, :kincaid, 
        :num_paragraphs, :num_sentences, :num_words, :num_characters, 
        :words_per_sentence, :syllables_per_word]
             
      FORMATS = {
        :condensed => {:template => 'condensed.txt.erb'},
        :full => {:template => 'full.md.erb'},
        :html => {:template => 'full.html.erb'},
        :short => {:template => 'short.md.erb'}
      }
    
    # Returns the template for the specified format
    def get_template(format)
      File.read(File.join('layouts', FORMATS[format][:template]))
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
      @config = {} if @config == nil
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
        summaries << Proof::Content::Analyzer.summarize(filename, content, SUMMARY_ATTRIBUTES)
      end
      @config[:title] = DEFAULT_TITLE unless @config[:title]
      report_builder = Proof::ReportBuilder.new(config[:title], summaries, REPORT_TOTALS)
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
        @config[:format] = :short unless @config[:format]
        template = get_template(@config[:format])
        @output.puts report.render(template)
        exit
      end
    end
        
  end
end
