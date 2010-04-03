require "rubygems"
require "geek_painter"

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
# >> 
# >> \[\033[0;33m\][\[\033[0;31m\]\u\[\033[1;33m\]:\[\033[0;31m\]\h\[\033[0;35m\]] \[\033[0m\]\w \[\033[1;33m\]$(__git_ps1)\[\033[0m\] $ \[\033[0m\]
# >> 
# >> copy the string above and put it in your ~/.bashrc or ~/.bash_profile like this => PS1='the_string'
