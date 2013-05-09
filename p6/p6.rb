
#Brute force solution below. A more efficient--though less Rubylicious--solution would involve the trick used in p1 or p2 to find the sum of the first n natural numbers

def sum_of_squares(max)
  a = []
  a.fill(0..max) { |i| i**2 }.inject(:+)
end

def square_of_sum(max)
  a = []
  a.fill(0..max) { |i| i }.inject(:+) ** 2
end
  
def difference(x, y)
  x - y
end

=begin
Project Euler  
Smallest multiple
Problem 6

The sum of the squares of the first ten natural numbers is,
12 + 22 + ... + 102 = 385

The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)2 = 552 = 3025

Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
=end
