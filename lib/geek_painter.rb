require 'lib/geek_painter/string'

require 'lib/geek_painter/escaping_tools'
require 'lib/geek_painter/palette'
require 'lib/geek_painter/canvas'

module GeekPainter
  def self.paint(&block)
    @canvas = Canvas.new
    @canvas.instance_eval(&block)
    @canvas
  end
end