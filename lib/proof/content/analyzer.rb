# -*- encoding: utf-8 -*-

module Proof
  module Content
    module Analyzer
      require 'lingua'
      # Returns a Summary of the provided content
      def self.analyze(content)
        summary = Proof::Content::Summary.new()
        summary.readability = Lingua::EN::Readability.new(content)
        summary
      end

    end
  
  end
end
