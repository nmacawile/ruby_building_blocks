def caesar_cipher(text, shift = 3)
	
	# make sure that shift value doesn't go over 26
	if shift.abs > 26
		shift %= 26
	end
	
	# this var stores our output
	encrypted = ""
	
	
	text.each_char do |char|
		
		shifted_index = char.ord + shift
		
		# move the shifted_index 26 characters back
		# if it goes beyond the alphabetic characters
		if (char.between?("A", "Z") && shifted_index > 90) ||
			(char.between?("a", "z") && shifted_index > 122)
			shifted_index -= 26
		end
		
		# only alphabetic characters are encrypted
		# special characters stay the same
		if char.between?("A", "Z")||char.between?("a", "z") 
			encrypted += shifted_index.chr
		else
			encrypted += char
		end
	end
	
	encrypted
end

#puts caesar_cipher("What a string!", 5)
 #   => "Bmfy f xywnsl!"