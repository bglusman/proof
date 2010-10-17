# -*- encoding: utf-8 -*-

module Proof
  module Formula
    # Encloses methods for the Gunning Fog Index formula
    module Fog
      # Return a text explanation of the given Gunning Fog Index value
      def self.explain(value)
        case
          when value > 18.0
            "someone with post-graduate education"
          when value >= 17.0
            "an average college graduate"
          when value >= 16.0
            "an average college senior student"
          when value >= 15.0
            "an average college junior student"
          when value >= 14.0
            "an average college sophomore student"
          when value >= 13.0
            "an average college freshman student"
          when value >= 12.0
            "an average high school senior"
          when value >= 11.0
              "an average high school junior"
          when value >= 10.0
            "an average high school sophomore"
          when value >= 9.0
            "an average high school freshman"
          when value >= 8.0
            "an average 8th grade student"
          when value >= 7.0
            "an average 7th grade student"
          when value >= 6.0
            "an average 6th grade student"
          when value >= 5.0
            "an average 5th student"
          when value < 4.0
            "anyone below 5th grade"
          end
      end
    end
  end
end
