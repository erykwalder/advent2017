class Spiral
  def distance(square)
    wrap = Math.sqrt(square).ceil
    wrap += 1 if wrap % 2 == 0
    return 0 if wrap == 1

    wrappos = square - (wrap-2)**2
    to_center = (wrappos % (wrap-1) - (wrap-1)/2).abs
    (wrap - 1)/2 + to_center
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Distance", Spiral.new.distance(ARGV[0].to_i)
end
