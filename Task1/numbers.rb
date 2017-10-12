# do numbers array some methods
class Main
  @numbers = %w(
    9461055376 1098029425 1365826266 3651652057
    6639633927 9198606875 3425027805 9600912575
    8826860435 4244213108 8930423446 6975487430
    2956968315 4024720801 8882048673 4897211695
    6089600553 4272319905 4517433227 5565635133
  )
  def self.max_value_to_value_hash
    pre_hash = @numbers.zip(max_numbers).flatten.compact
    Hash[*pre_hash]
  end

  def self.string_max_and_min_values
    min_numbers = @numbers.map { |number| number.chars.min }
    max_numbers.zip(min_numbers).flatten.compact.join('')
  end

  def self.sum_of_max_and_min
    sorted = @numbers.sort
    sorted[0] + sorted[1] + sorted[-1] + sorted[-2]
  end

  private_class_method

  def self.max_numbers
    @numbers.map { |number| number.chars.max }
  end
end

puts Main.max_value_to_value_hash
puts '----------'
puts Main.string_max_and_min_values
puts '----------'
puts Main.sum_of_max_and_min
