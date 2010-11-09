# -*- encoding: utf-8 -*-

require 'proof'

REPORT_TOTALS = [:num_paragraphs, :num_sentences, :num_words, :num_characters]

SUMMARY_ATTRIBUTES = [:flesch, :fog, :kincaid, 
  :num_paragraphs, :num_sentences, :num_words, :num_characters, 
  :words_per_sentence, :syllables_per_word]

def contents(filename)
  File.read(File.join('spec', 'files', filename))
end

def get_template(filename)
  File.read(File.join('lib', 'proof', 'layouts', filename))  
end

# FIXME: This should be cleverer
def mock_summaries(total)
  summaries = []
  total.times do |p|
    summaries << Proof::Content::Analyzer.summarize("small.txt",
    contents('small.txt'), SUMMARY_ATTRIBUTES)
  end
  summaries
end
