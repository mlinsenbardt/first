#!/usr/bin/env ruby

filename = ARGV[0]

puts "Files with names that matches <#{filename}>"
sname = `find . -name  '\*.rb' -o -name '\*.html' -o -name '\*.erb' -o -name '\*.js' -o -name '\*.css' -o -name '\*.yml' -o -name '\*.txt'`
sarr = sname.split("\n")
sarr.select! { |str|    str.include? "#{filename}"}
	 #	|| str.include? ".html" 
	#	|| str.include? ".erb"
	#	|| str.include? ".js" 
	#	|| str.include? ".css" 
	#	|| str.include? ".yml"
	#	|| str.include? ".txt" 
sarr.each { |str| print "  ", str, "\n"}


puts '*' *50
puts "Files with content that matches <#{filename}>"
a = string=`grep -r -i -n "#{filename}" .`
arr = a.split('\n')
puts arr

