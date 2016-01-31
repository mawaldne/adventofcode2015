#!/usr/bin/env ruby -w

require 'json'

class JsonCounter

  attr_reader :json
  attr_reader :total

  def initialize(string)
    @hash = JSON.parse(string)
    @total = 0
  end 

  def count
    @total = 0
    count_iter(@hash)   
    @total
  end

  def count_iter(obj)
    case obj
    when Array
      obj.each { |o| count_iter(o) }
    when Hash
      obj.values.each { |o| count_iter(o) } unless obj.has_value?("red")
    when Fixnum
      @total += obj
    when String
    else
      fail 'Unknown object'
    end
  end
end 

counter = JsonCounter.new(ARGF.read)
p counter.count

