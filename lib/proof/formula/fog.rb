# -*- encoding: utf-8 -*-

module Proof
  module Formula
    # Encloses methods for the Gunning Fog Index formula
    module Fog
      # Return a text explanation of the given Gunning Fog Index value
      def self.explain(value)
        case value
          when value > 18
            "someone with post-graduate education"
          when 17
            "an average college graduate"
          when 16
            "an average college senior student"
          when 16
            "an average college senior student"
          when 15
            "an average college junior student"
          when 14
            "an average college sophomore student"
          when 13
            "an average college freshman student"
          when 12
            "an average high school senior"
          when 11
              "an average high school junior"
          when 10
            "an average high school sophomore"
          when 9
            "an average high school freshman"
          when 8
            "an average 8th grade student"
          when 7
            "an average 7th grade student"
          when 6
            "an average 6th grade student"
          when 5
            "an average 5th student"
          when value < 4
            "anyone below 5th grade"
          end
      end
    end
  end
end
