# do names array some methods
class Main
  @names = [
    'Stuart Blanda', 'Kaden Batz', 'Cornell Durgan', 'Mrs. Kieran Goldner',
    'Miss Emile Littel', 'Carolyne Terry', 'Mrs. Ronaldo Buckridge',
    'Cristal Braun', 'Dr. Joanne Bartoletti', 'Kenton Block', 'Jeromy Medhurst',
    'Gussie Daniel V', 'Kitty Senger Jr.', 'Lexus Gibson', 'Kaylah Howell',
    'Maxie Wilderman', 'Kayden Mohr', 'Devonte Skiles',
    'Tina Mante', 'Heloise Mann'
  ]

  def self.array_to_hash
    Hash[*clear_array]
  end

  def self.first_letters
    first_letters = even_elements.map { |x| x.slice(0) }
    second_letters = odd_elements.map { |x| x.slice(1) }
    pre_hash = first_letters.zip(second_letters).flatten.compact
    Hash[*pre_hash]
  end

  def self.array_to_uniq
    clear_array.map { |x| x.downcase.chars }.flatten.uniq.sort
  end

  def self.revers_names
    hash = Hash[*clear_array].invert.to_a
    hash.map { |x| x.join(' ') }
  end

  private_class_method

  def self.clear_array
    arrays_in_array = @names.map { |name| name.split(' ') }
    arrays_in_array.flatten - ['Mrs.', 'Miss', 'Dr.', 'V', 'Jr.']
  end

  def self.even_elements
    clear_array.values_at(* clear_array.each_index.select(&:even?))
  end

  def self.odd_elements
    clear_array.values_at(* clear_array.each_index.select(&:odd?))
  end
end

puts Main.array_to_hash
puts '-----------'
puts Main.first_letters
puts '-----------'
puts Main.array_to_uniq
puts '-----------'
puts Main.revers_names
