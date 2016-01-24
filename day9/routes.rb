#!/usr/bin/env ruby -w
require 'set'
 
distances = {}
routes = {}
cities = Set.new

ROUTE_FORMAT = /\A(.*) to (.*) = (\d*)\Z/
ARGF.each_line do |route|
  next unless route =~ ROUTE_FORMAT
  distances[[$1, $2]] = Integer($3)
  distances[[$2, $1]] = Integer($3)
  
  cities << $1 << $2
end

cities.to_a.permutation(cities.size).each do |route| 
  next if route.uniq.size < cities.size
  distance = 0
  route.each_cons(2).each do |pair|
    distance += distances[pair] 
  end 
  routes[route] = distance
end 

p "#{routes.values.min}"
p "#{routes.values.max}"

