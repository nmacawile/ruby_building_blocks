def stock_picker(stock_prices)
	# store each possible combination of buy day and sell day as key
	# with profit as the value
	days_pair = {}
	
	# match each element with all elements to its right, store it in the hash
 	stock_prices.each_with_index do |buy_price, buy_day|
 		# start counting from the element right after buy_day index with #drop(buy_day + 1)
 		stock_prices.drop(buy_day + 1).each_with_index do |sell_price, sell_day|
 			days_pair[[buy_day,buy_day + sell_day + 1]] = sell_price - buy_price
 		end
 	end
	# look for elements in the hash with values equal to the maximum value
	# return a nested array
	days_pair.select {|k, v| v == days_pair.values.max }.keys

end
stock_picker([17,3,6,9,15,8,6,1,10]).each { |pair| p pair }
#[1,4]  # for a profit of $15 - $3 == $12