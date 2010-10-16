# -*- encoding: utf-8 -*-

require 'lingua'

module Proof
  module Content
    # Encloses methods for providing analysis of content
    module Analyzer
      # Returns a Summary of the provided content
      def self.analyze(filename, content)
        summary = Proof::Content::Summary.new(filename)
        summary.readability = Lingua::EN::Readability.new(content)
        summary
      end

    end
  
  end
end
