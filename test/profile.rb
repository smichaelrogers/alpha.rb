$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require 'alpha'

require 'graphviz'
require 'ruby-prof'

def profile(mode)
  report = RubyProf.profile { Alpha.autoplay(turns: 5, height: 5) }
  path = File.dirname(__FILE__)
  begin
    File.open("#{path}/output/#{mode}.html", "w") { |f|
      RubyProf::FlatPrinter.new(report).print(f, {})
    }
    File.open("#{path}/output/#{mode}.dot", "w") { |f|
      RubyProf::DotPrinter.new(report).print(f, {})
    }
    GraphViz.parse("#{path}/output/#{mode}.dot").output(:png => "#{path}/output/#{mode}.png")

  rescue Exception => e
    return e
  end
end

RubyProf.measure_mode = RubyProf::WALL_TIME
profile('wall_time')
RubyProf.measure_mode = RubyProf::PROCESS_TIME
profile('process_time')
