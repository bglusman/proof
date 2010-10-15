# -*- encoding: utf-8 -*-

module Proof
  module Content
    module Analyzer
      require 'lingua'
      # Returns a Summary of the provided content
      def self.analyze(filename, content)
        summary = Proof::Content::Summary.new(filename)
        summary.readability = Lingua::EN::Readability.new(content)
        summary
      end

    end
  
  end
end
