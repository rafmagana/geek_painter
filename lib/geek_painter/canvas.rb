require 'geek_painter/core-ext'

module GeekPainter  
  #
  # The main DSL, every single call to the "label" method pushes the parameters to an array
  # and "raw" method then joins the array to generate the actual string to be used in PS1 or wherever.
  #
  # ie. canvas = Canvas.new
  #     canvas.label "\\[\\033[33m\\]user:" => yellow text
  #     canvas.label "\\[\\033[34m\\]host" => blue text
  #     canvas.show => \\[\\033[33m\\]user:\\[\\033[34m\\]host => user:host
    
  class Canvas
    include EscapingTools
    
    attr_reader :labels
    
    def initialize
      @labels = []
    end

    def label(string_color_pair)
      @labels << string_color_pair
    end
    #for backwards compatibility with <= 0.1.1
    alias :trace :label
        
    def prompt
      render :for_prompt
    end
    
    def text
      render :for_text
    end

    def for_prompt
      prompt.to_raw
    end
    
    def for_text
      text.to_raw
    end
     
    def reset_color
      @labels << ["", :default]
    end
    
    private
    def render(format=:for_text)
      colored_labels = []
      reset_color unless @labels.last[1] == :default if @labels.last
      @labels.each do |t|
        unless t[2]
          background_color = :default
        else
          background_color = t[2]
        end
        
        if t.is_a? Array
          colored_labels << escape(t[0].to_s, t[1].to_fg_code, background_color.to_bg_code, format)
        else
          colored_labels << t
        end
      end
      colored_labels.join ""     
    end
  end
end