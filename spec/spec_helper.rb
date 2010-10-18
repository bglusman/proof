# -*- encoding: utf-8 -*-

require 'proof'

READABILITY_ATTRIBUTES = [:flesch, :fog, :kincaid, 
  :num_paragraphs, :num_sentences, :num_words, :num_characters, 
  :words_per_sentence, :syllables_per_word]

def contents(filename)
  File.read(File.join('spec', 'files', filename))
end

def get_template(filename)
  File.read(File.join('layouts', filename))  
end

# FIXME: This should be cleverer
def mock_summaries(total)
  summaries = []
  total.times do |p|
    summaries << Proof::Content::Analyzer.summarize("small.txt",
    contents('small.txt'), READABILITY_ATTRIBUTES)
  end
  summaries
end
