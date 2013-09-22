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
#puts a
arr = a.split("\n")
arr.sort_by! { |str| str }
puts arr
#nstr = ""
#arr.each { |str| arr2 = str.split(":")
#		arr2.each { |str2|
#		if str[0] == "."
#			if nstr != str
#				nstr = str
#				puts str
#			end
#		elsif str[0] != "l"
#			str.delete "\n" #delete the newline at the end
#			puts str
#			puts ":"
#		elsif str != nstr
#			puts str
#		else
#			#its a duplicate, so skip it
#		end
#	}	

#arr.reverse_each { |str| print "  ", str, "\n"}

