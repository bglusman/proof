# -*- encoding: utf-8 -*-

module Proof
  module Formula
    # Encloses methods for the Flesch Reading Ease formula
    module Flesch
      # Return a text explanation of the given Flesch Reading Ease value
      def self.explain(value)
        case
          when value >= 100.0
            "very easy to read"
          when value >= 65.0
            "Plain English"            
          when value >= 30.0
            "a little hard to read"
          when value >= 0.0
            "very hard to read"
          end 
      end
    end
  end
end
