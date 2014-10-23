def to_opn(input)
        stack = Array.new
        ad = Array.new
        arr = Array.new
        priority = Hash["(" => 0, "+" => 1, "-" => 1, "*" => 2, "/" => 2, "^" => 3]
        operators = %w(+ - / * ^)
       
        input.delete(" ")
        while input.length != 0
         case input
                when /^\s*([^\+\-\*\/\(\)\^\s]+)\s*(.*)/
                        ad.push($1.to_f)
                        input = $2
                when /^\s*([\+\-\*\/\(\)\^])\s*(.*)/
                        ad.push($1.to_s)
                        input = $2                    
         end  
        end
    ad.each do |i|
            
            arr << i if i.is_a?(Float)
            stack << i if i == "("
            if i == ")"
              while stack.last != "("
                arr.push(stack.pop)
              end
              stack.pop
            end
            if operators.include? i
                #stack << i if stack.empty?
                while operators.include?(stack.last)  && priority[stack.last] >= priority[i]
                       arr.push(stack.pop)
                end
                stack.push(i)
            end    
         
    end
    while el = stack.pop
        arr.push(el)
    end
    puts arr
end

def calculation(arr)
	 new_arr = Array.new
	 i = 0
	while i < arr.length	 
		case arr[i].to_s		   	     	 
			when '+' 
				x = new_arr[-2].to_f + new_arr[-1].to_f
				new_arr.pop
				new_arr.pop
				new_arr.push(x)
			when '-' 
				x = new_arr[-2].to_f - new_arr[-1].to_f
				new_arr.pop
				new_arr.pop
				new_arr.push(x)
			when '*' 
				x = new_arr[-2].to_f * new_arr[-1].to_f
				new_arr.pop
				new_arr.pop
				new_arr.push(x)
			when '/' 
				x = new_arr[-2].to_f / new_arr[-1].to_f
				new_arr.pop
				new_arr.pop
				new_arr.push(x)
			when '^'
			    x = new_arr[-2].to_f **	new_arr[-1].to_f
			    new_arr.pop
				new_arr.pop
				new_arr.push(x)
            else
			new_arr.push(arr[i])		
		end
		i = i + 1
	end	
	puts new_arr	
end
