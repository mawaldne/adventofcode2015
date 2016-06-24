#!/usr/bin/env ruby -w

# To run
# ./helper.rb input.txt

require 'set'
require 'pp'

class Deliverer
  attr_accessor :houses
  attr_reader :x, :y

  def initialize
    @x = 0
    @y = 0
    @houses = Set.new
    @houses.add([@x, @y])
  end

  def deliver(direction)
    case direction
    when '^'
      @x += 1
    when 'v'
      @x -= 1
    when '>'
      @y += 1
    when '<'
      @y -= 1
    else
      raise 'Direction not defined'
    end
    @houses.add([@x, @y])
  end

  def position
    [@x, @y]
  end
end

santa = Deliverer.new
robo = Deliverer.new

ARGF.each_char.each_slice(2) do |santa_direction, robot_direction|
  santa.deliver(santa_direction) if santa_direction
  robo.deliver(robot_direction) if robot_direction
end

pp santa.houses.merge(robo.houses).size

