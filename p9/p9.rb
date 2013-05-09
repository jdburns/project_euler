# c == Math.sqrt(a**2 + b**2)
# a + b + c == a + b + Math.sqrt(a**2 + b**2) == 1000


squares = [] 
c_squared = []
(0..997).each { |x| squares << x**2 }

pairs = [ [0,0] ]
pairs += squares.combination(2).to_a

# Loop C
pairs.each_with_index do |pair, i|
  pair_sum = pair.inject(:+) 
  c_squared[i] = pair_sum
#  break if pair_sum > squares.max
end

triplets = c_squared.zip(pairs)
triplets.each { |t| t.flatten!}

squares.select { |s| s.find_index(t) }
triplets.select {|t| squares.find_index(t[0]) + squares.find_index(t[1]) + squares.find_index(t[2]) == 1000}



# Index of each element in squares array is its square root.
c_squared.select { |n| squares.include?(n) } 

# Indexes of pairs array 

c_array = []
c_squared.each { |c_sq| c_array << Math.sqrt(c_sq) } 

# answer = [200, 375, 425].inject(:*) = 31875000

###################

#Loop E (from http://stackoverflow.com/questions/16295665/the-most-idiomatic-way-to-iterate-through-a-ruby-array-exiting-when-an-arbitrar)
[[1, 2], [3, 4], [5, 6]].find{|x, y| x + y > 6}

#Loop F (from same SO response)
#array.take_while {|pair| pair.sum < foo}.map(&:sum)
c_squared.take_while { |pair| pair.inject(:+) <= squares.max }.map(&:sum) 

#Loop G (SO)
sums = pairs.lazy.map { |a, b| a + b }.take_while { |pair_sum| pair_sum < some_max_value }.force


#Loop D
pairs.each { |pair| c_squared.last <= squares.max ? c_squared << pair.inject(:+) : break }

# Loop A
pairs.each do |pair|
  pair_sum = pair.inject(:+) 
  c_squared << pair_sum
  break if pair_sum > squares.max
end

#Loop B
i = 0
pair_sum = 0
begin
  pair_sum = pairs[i].inject(:+)
  c_squared << pair_sum
  i += 1
end until pair_sum > squares.max

# Loop C
pairs.each_with_index do |pair, i|
  pair_sum = pair.inject(:+) 
  c_squared[i] = pair_sum
  break if pair_sum > squares.max
end


=begin comment
squares = [] 
c_squared = []
(0..997).each { |x| squares << x**2 }

# Create array of all combination sets of [a**a, b**b]
pairs = squares.combination(2).to_a

#pairs.each { |pair| c_squared << pair.inject(:+) }
=begin

pairs.each do |pair|
  pair_sum = pair.inject(:+) 
  c_squared << pair_sum
  break if pair_sum > squares.max

end

i = 0
pair_sum = 0
begin
  pair_sum = pairs[i].inject(:+)
  c_squared << pair_sum
  i += 1
end until pair_sum > squares.max



##############
Special Pythagorean triplet
Problem 9
A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,

a2 + b2 = c2
For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
=end comment


=begin comment

sum = 1000
n = []
(1..sum-3).each {|x| n.push(x)}


a = 1
b = 2
c = sum - (a + b)

(1..sum-3).each do |a|
  (a+1..sum-3).each do |b|
=end comment    
