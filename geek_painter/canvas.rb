#
# The main DSL, every single call to the "trace" method pushes the parameters to an array
# and "raw" method then joins the array to generate the actual string to be used in PS1 or wherever.
#
# ie. canvas = Canvas.new
#     canvas.trace "\\[\\033[33m\\]user:" => yellow text
#     canvas.trace "\\[\\033[34m\\]host" => blue text
#     canvas.show => \\[\\033[33m\\]user:\\[\\033[34m\\]host => user:host

class Canvas
  include EscapingTools
  
  def initialize
    @traces = []
  end

  def trace(string)
    add_trace(string)
  end
  
  def raw
    @traces << escape_char("0")
    @traces.join("")
  end
  
  def print_raw
    puts ""
    puts raw
    puts ""
    puts "copy the string above and put it in your ~/.bashrc or ~/.bash_profile like this => PS1='the_string'"
  end
  
  def show
    puts raw
  end
  
  protected
  def add_trace(trace)
    @traces << trace
  end  
end

#
# Extend String to help the DSL to be more readable
# adds a "in" method to specify the color of the text
# ie. "my_text".in :red

class String
  include EscapingTools
  def in(color_name)
    Palette.grab_escaped(color_name) + self.to_s
  end

  def reset
    self + escape_char("0")
  end  
end