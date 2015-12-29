count = 0
open('day1.input').read.each_char do |c|
  count += 1 if c == '('
  count -= 1 if c == ')'
end
puts count
