# -*- encoding: utf-8 -*-

module Proof
  module Content
  
    # Summary of the contents of a particular file
    class Summary
      attr_accessor :file, :total_chars
    
      def initialize(file=nil, total_chars=0)
        @file = file
        @total_chars = total_chars
      end
    
    end
  
  end
  
end
