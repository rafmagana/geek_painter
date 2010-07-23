module GeekPainter

  #TODO: Refactor!!!!!
  module EscapingTools
    
    def open_escape
      '\['
    end
    
    #con dos funciona para prompt, pero no para text
    #con una funciona para text, pero no para prompt
    def start_color
      "\033["
    end
    
    def end_color
      'm'
    end
    
    def end_escape
      '\]'
    end
    
    def escape(string, foreground_color_code, background_color_code, format)
      color_delimiter = ";"
      escaped_string = ''
      
      if background_color_code == '0'
        color_delimiter = ""
        background_color_code = ""
      end
      
      if format == :for_prompt
        escaped_string = open_escape + start_color + foreground_color_code + color_delimiter + background_color_code + end_color + end_escape + string
      elsif format == :for_text
        escaped_string = start_color + foreground_color_code + color_delimiter + background_color_code + end_color + string
      end
      
      escaped_string
    end

  end
end