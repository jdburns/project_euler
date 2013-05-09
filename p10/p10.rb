module Mathjb
  
  def sum_of_primes( ceiling ) 
    odds = Array.new(ceiling/2, true) 
    odds[0] = false
    (3..ceiling/2).step(2) do |n|
      i = n/2
      (n**2/2...ceiling/2).step(n) { |i| odds[i] = false } if odds[i]
    end
    sum = 2  # Add the only even prime
    odds.each_with_index { |v,i| sum += 2*i + 1 if v }
    return sum
  end

end

include Mathjb

ceiling = 2_000_000
puts sum_of_primes( ceiling )

=> 142913828922  # This is correct

############### refactor
(3..ceiling/2).step(2) do |n|
  i = n/2
  (n**2/2...ceiling/2).step(n) { |i| odds[i] = false } if odds[i]
  end
end 

(3..ceiling/2).step(2) do |n|
  i = n/2
  if odds[i] == true then
    range = n**2/2...ceiling/2 
    range.step(n) { |i| odds[i] = false }
  end
end 




=begin comment
#i_of_n_squared = n**2/2
# index representing n**2 is n**2/2
# index representing ceiling is ceiling/2
# n = 2 * i + 1

Summation of primes
Problem 10
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
=end comment