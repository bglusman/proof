# -*- encoding: utf-8 -*-

require 'lingua'

module Proof
  module Content
    #  Content analysis
    class Analyzer < Lingua::EN::Readability
      # Returns a Summary of the text
      def self.analyze(filename, content, attributes)
        analyzer = Proof::Content::Analyzer.new(content)
        summary = Proof::Content::Summary.new(filename)
        summary.readability = analyzer.summarize(attributes)
        summary
      end
      
      # Returns a Hash of the specified readability statistics
      def summarize(attributes)
        results = {}
        attributes.each do |a|
          results[a] = self.send(a)
        end
        results
      end

    end
  
  end
end
