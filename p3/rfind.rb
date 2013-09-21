#!/usr/bin/env ruby

filename = ARGV[0]

puts "Files with names that matches <#{filename}>"
puts '*' *50
puts `find . -name  "#{filename}" && /\.rb$ -o -name /\.html$`
puts "Files with content that matches <#{filename}>"
puts `grep -r -i -n "#{filename}" .` 

