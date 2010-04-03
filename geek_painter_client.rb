require "lib/geek_painter"

painting = GeekPainter.paint do
  trace "[".in    :brown
  trace "\\u".in  :red
  trace ":".in    :yellow
  trace "\\h".in  :red
  trace "] ".in   :magenta
  trace "\\w ".in :default
  trace "\$(__git_ps1)".in :yellow
  trace " $ ".in :default
end

painting.print_raw
#painting.show