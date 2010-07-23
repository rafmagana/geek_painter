require 'geek_painter/escaping_tools'
require 'geek_painter/canvas'

module GeekPainter
  def self.paint(&block)
    canvas = Canvas.new
    canvas.instance_eval(&block)
    canvas
  end
end