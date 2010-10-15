<%= @title %>

Readability
-----------

Totals
------

* Total files: <%= @summaries.length %>

Files
-----

<% @summaries.each do |summary| %>
Summary for <%= summary.filename %>

Readability
-----------

* Flesch Reading Ease: <%= summary.readability.flesch %>
* Kincaid: <%= summary.readability.kincaid %>
* Fog Index: <%= summary.readability.fog %>

Totals
------

* Total paragraphs: <%= summary.readability.num_paragraphs %>
* Total sentences: <%= summary.readability.num_sentences %>
* Total words: <%= summary.readability.num_words %>
* Total characters: <%= summary.readability.num_characters %>

Averages
--------

* Average words per sentence: <%= summary.readability.words_per_sentence %>
* Average syllables per word: <%= summary.readability.syllables_per_word %>
<% end %>

Produced: <%= @date.strftime('%d-%b-%Y %H:%M:%S') %>

To use this report in your own programs, parse it with any software that supports Markdown.
