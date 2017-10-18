numbers = [
2007, 2002, 2011, 12, 2010, 2, 16, 24, 12, 2007,
10, 24, 14, 8, 2002, 3, 6, 2015, 2007, 2001, 18,
6, 6, 26, 12, 16, 2003, 3, 2, 1
]
year_arr = []
numbers.select {|x| year_arr << x.to_s.size }
puts year_arr
