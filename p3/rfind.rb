#!/usr/bin/env ruby

filename = ARGV[0]

puts "Files with names that matches <#{filename}>"
sname = `find . -name  '\*.rb' -o -name '\*.html' -o -name '\*.erb' -o -name '\*.js' -o -name '\*.css' -o -name '\*.yml' -o -name '\*.txt'`
sarr = sname.split("\n")
sarr.select! { |str|    str.include? "#{filename}"}
sarr.each { |str| print "  ", str, "\n"}
puts '*' *50

puts "Files with content that matches <#{filename}>"
a = string=`grep -r -i -n --include=*.rb --include=*.html --include=*.erb --include=*.js --include=*.css --include=*.yml --include=*.txt "#{filename}" .`
arr = a.split("\n")
arr.sort_by! { |str| str }
arr.each { |str|  str.gsub!(/\:/,"\n")
		arr2 = str.split("\n")
		puts arr2[0]
		puts "  #{arr2[1]}:#{arr2[2]}"
		if str != arr[-1]
			puts '-' *50 
		end}

