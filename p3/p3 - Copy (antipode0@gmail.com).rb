# Method to find largest prime factor of any integer Ruby can handle
# Uses mathn.rb module and Prime class for convenience, rather than 
#   rolling my own Sieve of Eratosthenes. I will refactor once implemented

def largest_prime_factor( x ) 
  require 'mathjb'
  primes = primes_below(x)
  i = 0
  
  until primes.include?(x)
    div = primes[i]
    if x % div == 0 then
      x /= div   #if div is a factor of x, set x to x / div
      i = 0
    else
      i += 1
    end
  end
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
