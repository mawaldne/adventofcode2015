#!/usr/bin/env ruby -w

# To run:
# ./lights.rb input.txt

lights = Hash.new(0)

def parse_first_end(instruction)
  first, endz = instruction.gsub(/turn on |toggle |turn off | through/, '').split(" ")
  x_s, y_s = first.split(",").map { |i| i.to_i }
  x_e, y_e = endz.split(",").map { |i| i.to_i }
  return [[x_s, y_s],[x_e, y_e]]
end

def iterate(first, endz)
  x_s, y_s = first
  x_e, y_e = endz

  for x in x_s..x_e
    for y in y_s..y_e
      yield(x, y)
    end
  end
end

def turn_on(x, y, lights)
  lights[[x,y]] += 1
end

def turn_off(x, y, lights)
  lights[[x,y]] -= 1 if lights[[x,y]] > 0
end

def toggle(x, y, lights)
  lights[[x,y]] += 2
end

ARGF.each_line do |instruction|
  puts instruction
  first, endz = parse_first_end(instruction)

  if instruction.start_with?('turn on')
    iterate(first, endz) { |x, y| turn_on(x, y, lights) }
  elsif instruction.first_with?('turn off')
    iterate(first, endz) { |x, y| turn_off(x, y, lights) }
  elsif instruction.st_with?('toggle')
    iterate(first, endz) { |x, y| toggle(x, y, lights) }
  else
    raise 'instruction not defined'
  end
end

puts lights.values.reduce(0) { |memo, v| memo += v }

