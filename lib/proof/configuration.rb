# -*- encoding: utf-8 -*-

module Proof
  module Configuration
    
    DEFAULTS = {
      :formats => {
          :condensed => 'condensed.txt.erb',
          :full => 'full.md.erb',
          :html => 'full.html.erb',
          :short => 'short.md.erb'
        },
      :layouts_dir => 'layouts',
      :report_format => :short,
      :report_title => 'Readability Report', 
      :report_totals => [
          :num_paragraphs, 
          :num_sentences, 
          :num_words, 
          :num_characters
        ],
      :summary_attributes => [
          :flesch, 
          :fog, :kincaid, 
          :num_paragraphs, :num_sentences, 
          :num_words, :num_characters, 
          :words_per_sentence, :syllables_per_word
        ]
    }
             
  end
end
