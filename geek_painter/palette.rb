class Palette
  extend EscapingTools
  def self.grab_escaped(color_name)
    case color_name
    when :black         then escape "0;30"
    when :dark_gray     then escape "1;30"
    when :light_gray    then escape "1;37"
    when :red           then escape "0;31"
    when :light_red     then escape "1;31"
    when :green         then escape "0;32"
    when :light_green   then escape "1;32"
    when :yellow        then escape "1;33"
    when :brown         then escape "0;33"
    when :blue          then escape "0;34"
    when :light_blue    then escape "1;34"
    when :magenta       then escape "0;35"
    when :light_magenta then escape "1;35"
    when :cyan          then escape "0;36"
    when :light_cyan    then escape "1;36;5"
    when :white         then escape "1;37"
    when :default       then escape "0"
    end
  end

  private
  def self.escape(color_code)
    self.escape_char(color_code.to_s)
  end  
end