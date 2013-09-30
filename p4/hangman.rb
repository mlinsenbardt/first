#!/user/bin/env ruby

f = File.open("words","r")
words = Array.new
f.each do  |line| 
		words.push(line)
	 end
puts "Enter word length between 5-20: "
range = gets 
if range.to_i <5
	range = "5"
elsif range.to_i >20
	range = "20"
end
words.select! { |string| string.strip!
		string.size == range.to_i}
attempts = 10
guesses = Array.new(range.to_i)
out = '_' *range.to_i
target = ""
while attempts > 0 && out != target
	puts "\nenter your guess: "
	guess = gets[0]
	if guesses.include? guess
		puts "you already guessed #{guess}\n"
	elsif !guess.index(/[a-z]/)
		puts "only lowercase letters a-z are allowed\n"
	else
		guesses.push(guess)
		if words.select { |string| string.include? guesses[-1][0]}.count != words.count && target == ""
			words.delete_if { |string| string.include? guesses[-1][0]}	
			attempts -= 1
		elsif target == ""
			target = words[0]
			index = 0
			target.each_char{|c| if c == guesses[-1]
						out[index] = guesses[-1][0]
						index += 1
						else
							index += 1
						end}
		elsif target.index(guesses[-1][0])
			index = 0
			target.each_char{|c| if c == guesses[-1]
						out[index] = guesses[-1][0]
						index += 1
						else
							index += 1
						end}
		else
			attempts -= 1
		end
	end
		guesses.each { |string| if string
						string.strip!
						print "#{string} "
					end}
		puts "(#{attempts} chances left)\n"	
		out.each_char {|c| print c, ' '}
end
	if out == target
		puts "\nYOU WIN!\n"
	else
		puts "\nYOU LOSE\n"
	end
