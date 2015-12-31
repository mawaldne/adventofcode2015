#!/usr/bin/env ruby -w

input = ARGF.read
total = 0
ribbon = 0
input.each_line do |line|
  l,w,h = line.split('x').map(&:to_i) 
  l_w = l * w
  l_h = l * h
  w_h = w * h
  min = [l_w, l_h, w_h].min
  total += min + (2*l_w + 2*l_h + 2*w_h)

  shortest = [l, w, h].sort.first(2)
  ribbon += (l*w*h) + shortest.inject(0) { |sum, side| sum + (side * 2) }
end
puts total
puts ribbon



