require 'geek_painter/escaping_tools'
require 'geek_painter/palette'
require 'geek_painter/canvas'

class GeekPainter
  def paint(&block)
    @canvas = Canvas.new
    @canvas.instance_eval(&block)
    @canvas
  end
end