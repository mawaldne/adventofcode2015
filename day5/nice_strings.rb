#!/usr/bin/env ruby -w

# To run:
# ./nice_strings.rb input.txt

count = 0
ARGF.each_line do |line|
  #next unless /(.*[aeiou]){3,}/ =~ line
  #next unless /([a-z])\1+/ =~ line
  #next if /ab|cd|pq|xy/ =~ line

  next unless /(..).*\1/ =~ line
  next unless /(.).\1/ =~ line

  count += 1
end

puts count
