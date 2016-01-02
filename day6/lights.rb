#!/usr/bin/env ruby -w

lights = Hash.new(0)

def parse_start_end(instruction)
  start, endz = instruction.gsub(/turn on |toggle |turn off | through/, '').split(" ")
  x_s, y_s = start.split(",").map { |i| i.to_i } 
  x_e, y_e = endz.split(",").map { |i| i.to_i } 
  return [[x_s, y_s],[x_e, y_e]] 
end 

def iterate(start, endz)
  x_s, y_s = start
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
  start, endz = parse_start_end(instruction)

  if instruction.start_with?('turn on')
    iterate(start, endz) { |x, y| turn_on(x, y, lights) }
  elsif instruction.start_with?('turn off')
    iterate(start, endz) { |x, y| turn_off(x, y, lights) }
  elsif instruction.start_with?('toggle') 
    iterate(start, endz) { |x, y| toggle(x, y, lights) }
  else
    raise 'instruction not defined'
  end
end

puts lights.values.reduce(0) { |memo, v| memo += v }

