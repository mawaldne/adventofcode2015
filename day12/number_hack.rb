#!/usr/bin/env ruby -w

# A beautiful hack
hash = ARGF.read
p hash.scan(/-?[0-9]\d*/).map(&:to_i).inject(:+)

