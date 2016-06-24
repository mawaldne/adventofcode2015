# To run:
# ruby day1.rb day1.input

floor = 0
basement = 0
open('day1.input').read.each_char.with_index(1) do |c,i|
  floor += 1 if c == '('
  floor -= 1 if c == ')'
  basement = i if basement == 0 && floor < 0
end
puts floor
puts basement
