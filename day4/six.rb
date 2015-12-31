#!/usr/bin/env ruby -w

require 'digest/md5'

secret = ARGV[0]

i = 1
loop do
  digest = Digest::MD5.hexdigest("#{secret}#{i}")
  if digest[0..5] == '000000'
      puts digest
      puts i
      break
  end
  i += 1
end

