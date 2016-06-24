#!/usr/bin/env ruby -w

# To run:
# ./routes.rb input.txt

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

  routes[route] = route
    .each_cons(2)
    .map { |pair| distances[pair] }
    .inject(:+)

end

p "#{routes.values.min}"
p "#{routes.values.max}"

