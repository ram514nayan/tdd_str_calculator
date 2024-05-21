class TddCalculator
  def add(input)
  	return 0 if input.empty?

  	validate_newline input

  	#Accept new line in string as delimiter
  	input = input.gsub(/-\n+/, "#{','}-").split("\n").join(',')
  	numbers = input.split(',').map(&:to_i)
  	invalid_numbers numbers

  	numbers.sum
  end

  def validate_newline(input)
    if input[input.length-1] == "\n"
    	raise ArgumentError, "The following input is invalid: #{input}"
    end
  end

  def invalid_numbers(numbers)
    negative_nums = numbers.select(&:negative?)
    raise ArgumentError, "Negative numbers not allowed: #{negative_nums.join(', ')}" unless negative_nums.empty?
  end

  def check_delimiter(input_str)
    delimiter = ','
    if input_str[0..1].include?("//")
      delimiter = input_str[2]
      validate_delimiter(delimiter)
      input_str = input_str[3..-1]
    end
    input_str = input_str.gsub(/-\n+/, "#{delimiter}-").split("\n").join(delimiter)
    [input_str, delimiter]
  end
  
end