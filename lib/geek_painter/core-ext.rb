module GeekPainter
  #
  # Extends String to help the DSL to be more readable
  # adds an "in" method to specify the color of the text
  # ie. "my_text".in :red
  #
  module RubyCoreExtensions

    module String
      def in(color_name)
        [self, color_name]
      end
      
      def to_raw
        self.gsub("\e", "\\e")
      end
    end

    module Symbol
      def to_fg_code
        case self
        when :black         then '0;30'
        when :dark_gray     then '1;30'
        when :light_gray    then '1;37'
        when :light_red     then '0;31'
        when :red           then '1;31'
        when :light_green   then '0;32'
        when :green         then '1;32'
        when :yellow        then '1;33'
        when :brown         then '0;33'
        when :light_blue    then '0;34'
        when :blue          then '1;34'
        when :light_magenta then '0;35'
        when :magenta       then '1;35'
        when :light_cyan    then '0;36'
        when :cyan          then '1;36'
        when :white         then '1;37'
        when :default       then '0'
        else '0'
        end
      end
      
      def to_bg_code
        case self
        when :black         then '40'
        when :red           then '41'
        when :green         then '42'
        when :brown         then '43'
        when :blue          then '44'
        when :magenta       then '45'
        when :cyan          then '46'
        when :white          then '47'
        when :default       then '0'
        else '0'
        end
        
      end
    end
  end
end

String.class_eval do
  include GeekPainter::RubyCoreExtensions::String
end

Symbol.class_eval do
  include GeekPainter::RubyCoreExtensions::Symbol
end

Array.class_eval do
  alias :on <<
end