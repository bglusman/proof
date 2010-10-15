# -*- encoding: utf-8 -*-

module Proof
  module Content
  
    # Summary of a file
    class Summary
      attr_accessor :filename, :readability
    
      def initialize(filename=nil)
        @filename = filename
      end
    
    end
  
  end
  
end
