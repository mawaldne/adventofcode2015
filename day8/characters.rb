#!/usr/bin/env ruby -w

total_string = 0
total_memory = 0
total_encoded = 0
ARGF.each_line do |string|
  evaled = eval(string)
  string = string.strip!
  puts "#{evaled}, #{string}, #{string.inspect}"

  total_string += string.size
  total_memory += evaled.size
  total_encoded += string.inspect.size
end
p total_string - total_memory
p total_encoded - total_string
   

