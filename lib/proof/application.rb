# -*- encoding: utf-8 -*-

module Proof
  class Application
    attr_accessor :output
    
    def initialize(output=STDOUT)
      @output = output
    end
    
  end
end
