# -*- encoding: utf-8 -*-

module Proof
  module Application
    require 'optparse'
    extend self
    attr_accessor :source, :output
    
    # Parse the provided arguments
    def read_arguments(args)
      options = OptionParser.new() do |opts|
        opts.banner = "Usage: proof [options] FILE"
        opts.separator ""
        opts.separator "Specific options:"
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
    
    # Executes the process
    def run(output=STDOUT, args=ARGV)
      @output = output
      @source = read_arguments(args)
    end
    
  end
end
