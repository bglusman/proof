# -*- encoding: utf-8 -*-

module Proof
  # Report on the contents of a particular file
  class ContentReport
    attr_accessor :file, :total_chars
    
    def initialize(file=nil, total_chars=0)
      @file = file
      @total_chars = total_chars
    end
    
  end
end
