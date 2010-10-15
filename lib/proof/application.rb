# -*- encoding: utf-8 -*-

module Proof
  module Application
    require 'optparse'
    extend self
    attr_accessor :config, :output, :sources
        
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
    
    # Executes the process
    def run(output=STDOUT, args=ARGV)
      @output = output
      @sources = read_arguments(args)
    end
    
  end
end
