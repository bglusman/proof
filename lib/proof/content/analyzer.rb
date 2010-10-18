# -*- encoding: utf-8 -*-

require 'lingua'

module Proof
  module Content
    #  Content analysis
    class Analyzer < Lingua::EN::Readability
      # Returns a summary of the text
      def self.summarize(name, text, attributes)
        analyzer = self.new(text)
        summary = {}
        summary[:name] = name
        summary[:statistics] = analyzer.statistics(attributes)
        summary
      end
      
      # Returns a Hash of the specified readability statistics
      def statistics(attributes)
        results = {}
        attributes.each do |a|
          results[a] = self.send(a)
        end
        results
      end

    end
  
  end
end
