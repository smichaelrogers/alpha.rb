$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require 'alpha'
require 'ruby-prof'

def profile(mode)
  report = RubyProf.profile { Alpha.autoplay(turns: 4, height: 4) }
  path = File.dirname(__FILE__)

  begin
    File.open("#{path}/output/#{Time.now.to_i}graph.txt", "w") { |f| RubyProf::GraphPrinter.new(report).print(f, {}) }
    File.open("#{path}/output/#{Time.now.to_i}flat.txt",  "w") { |f| RubyProf::FlatPrinter.new(report).print(f, {}) }
  rescue Exception => e
    return e
  end
end
#
# RubyProf.measure_mode = RubyProf::WALL_TIME
# profile('wall_time')
# RubyProf.measure_mode = RubyProf::PROCESS_TIME
# profile('process_time')
profile('zzzzz')
