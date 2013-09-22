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
arr.map! { |str|  str.gsub!(/\:/,"\n")
		arr2 = str.split("\n")
		arr2[1] = "  #{arr2[1]}:#{arr2[2]}"
		arr2.pop
		str = arr2
	}
arr.flatten!
arr.uniq!
arr.each { |str| 
		if str[0] == "."
			puts '-' *50
			puts "#{str}\n"
		else
			puts "#{str}\n"
		end}
