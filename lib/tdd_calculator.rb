class TddCalculator
  def add(input)
    return 0 if input.strip.empty?

    validate_newline(input)

    input, delimiter = delimitere_used(input)

    regex_str = /^[\d\(\)\-#{delimiter}]+$/

    validate_string(input, regex_str)
    numbers = input.split(delimiter).map(&:to_i)
    negative_numbers(numbers)

    if delimiter == '*'
      return 0 if numbers.length == 1 && numbers.include?(0)
      return numbers.inject(&:*)
    else
      numbers.sum
    end
  end

  def validate_newline(input)
    if input[input.length-1] == "\n"
      raise ArgumentError, "The following input is invalid: #{input}"
    end
  end

  def negative_numbers(numbers)
    negative_nums = numbers.select(&:negative?)
    raise ArgumentError, "Negative numbers not allowed: #{negative_nums.join(', ')}" unless negative_nums.empty?
  end

  def delimitere_used(input_str)
    delimiter = ','
    if input_str[0..1].include?("//")
      delimiter = input_str[2]
      validate_delimiter(delimiter)
      input_str = input_str[3..-1]
    end
    #If * then multiply numbers
    if delimiter == '*'
      input_str = input_str.gsub(/-\n+/, "#{delimiter}-").split("\n").reject!(&:empty?).join(delimiter)
    else
      input_str = input_str.gsub(/-\n+/, "#{delimiter}-").split("\n").join(delimiter)
    end
    [input_str, delimiter]
  end

  def validate_delimiter(del)
    raise(ArgumentError, "Invalid input: Delimiter should not be number, #{del}") unless del.to_s.match? /^(?![0-9]+$).*/
  end

  def validate_string input, regex_str
    unless input.match regex_str
      raise(ArgumentError, "Invalid input: Only allowed specified delimiter as (//delimiter) with integer, ")
    end
  end

end