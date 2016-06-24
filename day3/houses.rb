#!/usr/bin/env ruby -w

# To run
# ./houses.rb input.txt

houses = Hash.new(0)
x, y = 0, 0

houses[[x,y]] = 1

ARGF.each_char do |direction|
  case direction
  when '^'
    x += 1
  when 'v'
    x -= 1
  when '>'
    y += 1
  when '<'
    y -= 1
  else
    raise 'Direction not defined'
  end

  houses[[x, y]] += 1
end

puts houses.size

