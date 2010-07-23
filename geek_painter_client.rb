require "rubygems"
require "geek_painter"


painting1 = GeekPainter.paint do
  label "[".in    :brown
  label "\\u".in  :red
  label ":".in    :yellow
  label "\\h".in  :red
  label "] ".in   :magenta
  label "\\w ".in :default
  label "\$(__git_ps1)".in :blue
end

painting2 = GeekPainter.paint do
  label "$ ".in    :yellow
end


#puts painting1.raw_prompt

#puts painting2.for_text
#puts painting2.for_prompt

puts painting1.prompt