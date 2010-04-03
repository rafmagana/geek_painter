module EscapingTools
  def open_esc_char
    "\\[\\033["
  end
  
  def close_esc_char
    "m\\]"    
  end
  
  def escape_char(char)
    open_esc_char + char + close_esc_char
  end
end
