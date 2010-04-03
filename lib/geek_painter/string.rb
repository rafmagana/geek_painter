#
# Extend String to help the DSL to be more readable
# adds a "in" method to specify the color of the text
# ie. "my_text".in :red
#
module GeekPainter
  module RubyCoreExtensions
    module String
      def in(color_name)
        Palette.grab_escaped(color_name) + self.to_s
      end

      def reset
        self + escape_char("0")
      end
    end
  end
end

String.class_eval do
  include GeekPainter::RubyCoreExtensions::String
end