#!/usr/bin/env ruby -w
require 'set'

class Table

  attr_reader :happiness, :names

  def initialize 
    @happiness = {}
    @names = Set.new
  end 

  def add(happiness)
    fail "Bad happiness str: #{happiness} " unless happiness =~ /\A(\w+) would (\w+) (\d+) happiness units by sitting next to (\w+)\.\Z/
    name, value, next_to  = $1, $3.to_i, $4

    value = $2 == 'gain' ? value * 1 : value * -1

    @happiness[[name, next_to]] = value
    @names.merge([name, next_to])
  end

  def max_happiness
    max_arrangement = []
    current_max = 0

    @names.to_a.permutation(@names.count).each do |arrangement|
      max = 0
      arrangement.each_with_index do |value, index|
         if index == 0
           max += @happiness[[value, arrangement[index + 1]]]
           max += @happiness[[value, arrangement[arrangement.length - 1]]]
         elsif index == arrangement.length - 1
           max += @happiness[[value, arrangement[index - 1]]]
           max += @happiness[[value, arrangement[0]]]
         else
           max += @happiness[[value, arrangement[index + 1]]]
           max += @happiness[[value, arrangement[index - 1]]]
         end
      end

      if max > current_max
        current_max = max
        max_arrangement = arrangement
      end

    end
    [max_arrangement, current_max]
  end
end 


table = Table.new
ARGF.each_line do |happiness|
  table.add(happiness)
end

p table.max_happiness
 



