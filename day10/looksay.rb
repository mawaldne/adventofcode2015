# Ruby 2.2.3. Using slice_when method

# To run: ./looksay.rb

def looksay(s)
  s.split('')
  .slice_when {|i,j| i != j }
  .map { |a| "#{a.size}#{a[0]}" }
  .join('')
end


s = '1113122113'
1.upto(50).each do |i|
  s = looksay(s)
end

puts s.size
