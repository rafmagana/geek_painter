require "rubygems"
require "geek_painter"


painting = GeekPainter.paint do
  label "[".in    :brown
  label "\\u".in  :red
  label ":".in    :yellow
  label "\\h".in  :red
  label "] ".in   :magenta
  label "\\w ".in :default
  label "\$(__git_ps1)".in :blue
end

puts painting.prompt