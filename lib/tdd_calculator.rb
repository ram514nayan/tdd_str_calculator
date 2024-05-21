class TddCalculator
  def add(input)
  	return 0 if input.empty?

  	numbers = input.split(',').map(&:to_i)
  	numbers.sum
  end
end