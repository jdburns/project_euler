# Method to find largest prime factor of any integer Ruby can handle
# Uses mathn.rb module and Prime class for convenience, rather than 
#   rolling my own Sieve of Eratosthenes. I will refactor once implemented
require "Mathjb"

def largest_prime_factor( x )
#  require 'mathn'   #import mathn.rb module to access Prime class
#  prime = Prime::EratosthenesGenerator.new   #create prime number generator; start at 1  
  require 'mathjb'
  prime = primes_below(x)
  div = primes.first   #set div to next largest prime (2 in this case)   
  
  begin
    if x % div == 0 then
      x /= div   #if div is a factor of x, set x to x / div
      prime = Prime::EratosthenesGenerator.new   #resets to 1 if factor of x found
      div = prime.next   #always start divisors at 2 (since every number divisible by 1)
    else
      div = prime.next   #set div to next prime if last div was not a factor of x
    end
  end until x.prime?   #test if x is prime 
  return x
end  

Benchmark.bm do |b|
  b.report {
    largest_prime_factor(x)
  }
end
 
=begin
The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?
=end

orig_number = 509
x = orig_number
y = []
for i in 2..orig_number do
        if x % i == 0 then
                x = x / i
                y.push i
        end
        if x == 1 then break end
end

p largest = y.last 
