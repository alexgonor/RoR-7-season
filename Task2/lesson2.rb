def rand_elem
  time = Time.at(rand(Time.now.to_f)).strftime('%d.%m')
  temp = rand(-30..40)
  time.to_s + ' ' + temp.to_s
end
puts Array.new(40) { rand_elem }

def keys_count
  hash = {
    'yes' => 23, 'b' => 'travel', 'yesterday' => 34.5,
    :yesss => :fg, try: 30, key: 'some value',
    'yesterday1' => 34, 'yesteryear' => 2014
  }
  hash.keys.count { |k| k.to_s.include?('yes') }
end
puts keys_count
