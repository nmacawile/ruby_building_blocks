module Enumerable
  	def my_each
  		if block_given?
	        self.length.times do |index|
	        	yield(self[index])
	        end
        end
    end
    
  	def my_each_with_index
  		if block_given?
	        self.length.times do |index|
	        	yield(self[index], index)
	        end
        end
    end
    
    def my_select
    	new_array = []
    	if block_given? 
	    	self.my_each do |item|
	        	if yield(item) 
	        		new_array << item
	        	end
	        end
        end
        new_array
    end
    
    def my_all?
    	if block_given? 
    		self.my_each do |item|
    			unless yield(item)
    				return false
    			end
    		end
    	end
    	true
    end
    
  	def my_any?
    	if block_given? 
    		self.my_each do |item|
    			if yield(item)
    				return true
    			end
    		end
    	else
    		return true
    	end
    	false
    end
    
 	def my_none?
 		if block_given?
    		!self.my_any? { |item| yield(item) }
    	else
    		false
    	end
    end
    
    def my_count
    	count = self.length
    	if block_given?
    		self.my_each do |item|
    			unless yield(item)
    				count -= 1
    			end
    		end
    	end
    	count
    end
    
    def my_map(proc = nil)
    	new_array = []
    	if proc
	    	self.my_each { |item| new_array << proc.call(item) }
	    elsif block_given?
	    	self.my_each { |item| new_array << yield(item) }
        end
        new_array	
    end
    
    def my_inject(initial = nil)
        array = self.clone
        accumulator = initial || array.pop

    	array.my_each do |item|
    		accumulator = yield(accumulator, item)
    	end
    	accumulator
    end
    
end

def multiply_els array
	array.my_inject { |product, item| product *= item }
end