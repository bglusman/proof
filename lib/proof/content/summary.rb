# -*- encoding: utf-8 -*-

module Proof
  module Content
  
    # Summary of a file.
    # Use Proof::Content::Analyzer to generate summaries
    class Summary
      attr_accessor :filename, :readability
    
      def initialize(filename=nil)
        @filename = filename
      end
    
    end
  
  end
  
end
