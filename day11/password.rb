#!/usr/bin/env ruby -w

# Notes: Uses ruby 2.2.3 slice_when method
def valid?(password)
   # Does not contain i o l
   return false if password =~ /i|o|l/

   # Finds a straight
   return false unless password
                         .split('')
                         .each_cons(3)
                         .find {|a| a[1] == a[0].next && a[2] == a[1].next }
 
   # Contains two different overlapping pairs
   return false unless password
                         .split('')
                         .slice_when{|i,j| i!=j}
                         .select{|a| a.size == 2}
                         .uniq
                         .count >= 2
   return true
end

password = ARGV[0]
#puts password if valid?(password)

loop do
   break if valid?(password) 
   password = password.next
end
p password






