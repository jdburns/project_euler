num_string = "
73167176531330624919225119674426574742355349194934
96983520312774506326239578318016984801869478851843
85861560789112949495459501737958331952853208805511
12540698747158523863050715693290963295227443043557
66896648950445244523161731856403098711121722383113
62229893423380308135336276614282806444486645238749
30358907296290491560440772390713810515859307960866
70172427121883998797908792274921901699720888093776
65727333001053367881220235421809751254540594752243
52584907711670556013604839586446706324415722155397
53697817977846174064955149290862569321978468622482
83972241375657056057490261407972968652414535100474
82166370484403199890008895243450658541227588666881
16427171479924442928230863465674813919123162824586
17866458359124566529476545682848912883142607690042
24219022671055626321111109370544217506941658960408
07198403850962455444362981230987879927244284909188
84580156166097919133875499200524063689912560717606
05886116467109405077541002256983155200055935729725
71636269561882670428252483600823257530420752963450"

digit = []

num_string.each_line do |row| 
  digit += row.scan(/\d/).map { |string| Integer(string) }
end

# Override obscure Ruby Array#product method with our own. 
# I do this for readability, since non-rubyists won't recognize inject(:*)
class Array
  def product
    inject(:*)
  end
end

temp = digit.first(5).product  # Initialization step

i =  max = 0
j = i + 5
begin
  i += 1
  j += 1
  temp = digit[i.next..j].product if digit[j] > digit[i]
  max = temp if temp > max
end until j == digit.length - 1

puts max

##########################
=begin
digit = []
# Read number from external file into temporary string array, then
# convert to integer array
big_num.foreach("thousand_digit_num.txt") { |row| digit += row.scan(/\d/).map(&:to_i) }
=end

temp = []
i = max = 0
begin
  temp << digit[i]  #push current digit to end of temp array 
  temp.shift if temp.count > 5  #drop first element when temp array exceeds five elements
  max = temp.inject(:*) if temp.inject(:*) > max #find product of elements in temp array, update max if new product is larger
  i += digit[i] == 0 ? 5 : 1  #skip 5 elements when zeros encountered
end until i >= digit.count

puts max #and dance a little jig
 
########################
max = first = last = 0
begin
  last += 1
  first += 1 if (last - first) > 4
  max = digit[first..last].inject(:*) if digit[first..last].inject(:*) > max
  puts max
  first += digit[last] == 0 ? 5 : 1  #skip 5 elements when zero found
  puts "first = #{first}"
  last += digit[last] == 0 ? 2 : 1
  puts "last = #{last}"
end until last >= digit.count
puts "answer = #{max}"




=begin
Project Euler  
Largest product in a series
Problem 8

Find the greatest product of five consecutive digits in the 1000-digit number.

73167176531330624919225119674426574742355349194934
96983520312774506326239578318016984801869478851843
85861560789112949495459501737958331952853208805511
12540698747158523863050715693290963295227443043557
66896648950445244523161731856403098711121722383113
62229893423380308135336276614282806444486645238749
30358907296290491560440772390713810515859307960866
70172427121883998797908792274921901699720888093776
65727333001053367881220235421809751254540594752243
52584907711670556013604839586446706324415722155397
53697817977846174064955149290862569321978468622482
83972241375657056057490261407972968652414535100474
82166370484403199890008895243450658541227588666881
16427171479924442928230863465674813919123162824586
17866458359124566529476545682848912883142607690042
24219022671055626321111109370544217506941658960408
07198403850962455444362981230987879927244284909188
84580156166097919133875499200524063689912560717606
05886116467109405077541002256983155200055935729725
71636269561882670428252483600823257530420752963450

=end

=begin
1. readln (or whatever) to gather all lines into an array
2. split, flatten, or whatever, to convert to a 1_000 element array
3. solve the actual problem
  a. brute force: 
      save sum of array[0] to array[4] ( subrange.inject(:+) ) in new array
      increment by one, save sum of array[1] to array[5] in new array
      repeat until array[999] is last in range
      select largest element of (995 element) sum array
  b. think of more efficient/elegant solution if possible 
      *significantly more efficient solution (lower Big O) may not be possible.
4. consider solving in Python as well, since Python is so good at this kind of stuff.
*****
5. THERE ARE 97 ZEROS, the last of which is the final digit. This means that 
    (96 * 5) + 1 = 481 of the 995 groups of five consecutive digits may be skipped after the zero is detected. I think the most efficient solution may be something like
=end
    