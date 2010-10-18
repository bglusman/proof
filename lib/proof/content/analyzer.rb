# -*- encoding: utf-8 -*-

require 'lingua'

module Proof
  module Content
    #  Content analysis
    class Analyzer < Lingua::EN::Readability
      # Returns a summary of the text
      def self.summarize(name, content, attributes)
        analyzer = self.new(content)
        summary = {}
        summary[:name] = name
        summary[:statistics] = analyzer.summary(attributes)
        summary
      end
      
      # Returns a Hash of the specified readability statistics
      def summary(attributes)
        results = {}
        attributes.each do |a|
          results[a] = self.send(a)
        end
        results
      end

    end
  
  end
end
