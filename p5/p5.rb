
def factor_array(n)
  arr = []
  arr.fill(0..n/2) { |i| i +  }
end

factors = factor_array(n)

factors.each { |f| 

=begin

Simple pencil and paper solution, easy to follow reasoning clearly delineated below. 

(Ruby and/or Python code to follow when I have time)

Some of the following reasoning may appear circular at first blush, but a careful reading will reveal that each step follows necessarily if the remaining numbers not in the list beginning with '20' are factors of the solution; since the solution is arrived at by finding the product of the numbers not in the list, they are by definition factors of the solution.

20: if a number is evenly divisible by each of two integers with no common factors (e.g. 3 and 5), it's evenly divisible by their product (15). If our solution is evenly divisible by both 4 and 5, it will be evenly divisible by 20.
18: if the solution is divisible by 2 and 9, it will be divisible by 18
15: if divisible by 3 and 5, divisible by 15
14: if divisible by 2 and 7, divisible by 14
12: if divisible by 3 and 4, divisible by 12
10: if divisible by 2 and 5, divisible by 10
8: if divisible by 16, divisible by 8
6: if divisible by 2 and 3, divisible by 6
4: if divisible by 16, divisible by 4
3: if divisible by 9, divisible by 3
2: if divisible by 16, divisible by 2
1: everything's divisible by 1 :)

So, if the numbers 5, 7, 9, 11, 13, 16, 17, 19 are factors of the solution, 2, 3, 4, 6, 8, 10, 12, 14, 15, 18 and 20 must be as well.

5 * 7 * 9 * 11 * 13 * 16 * 17 * 19 = 232792560

Since we know that 5, 7, 9, 11, 13, 16, 17, and 19 are (by definition) factors of the solution, all natural numbers < 21 must be, and the solution must the smallest number evenly divisible by the set.

QED

=end

def make_array_beta(n)
  arr = []
  (1..n).each { |i| arr.push(i) }
  return arr
end

=begin
Project Euler  
Smallest multiple
Problem 5

2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
=end
