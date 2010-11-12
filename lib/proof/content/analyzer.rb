# -*- encoding: utf-8 -*-

require 'lingua'

module Proof
  module Content
    #  Content analysis
    module Syllables
      extend self
      Tokenizer = /([aeiouy]{1,3})/

      def syllable_counter(word)
        len = 0

        if word[-3..-1] == 'ing' then
          len += 1 
          word = word[0...-3]
        end

        got = word.scan(Tokenizer)
        len += got.size()

        # the next exception to the regex is the
        # trailing silent 'e' (which used to be a syllable)
        # and the exception to the exception is 'le'.

        if got.size() > 1 and got[-1] == ['e'] and 
          word[-1].chr() == 'e' and
          word[-2].chr() != 'l' then
          len -= 1 
        end
        return len
      end
      
      def words_and_syllables text_block = self.text
        words, syllables = 0,0
        text_block.scan(/\w+/).each_with_index do |word, index|
          syllables += syllable_counter(word)
          words = index + 1
        end
        return [words, syllables]
      end
    end
    
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
