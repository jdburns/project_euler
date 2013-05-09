
products = []
(800..999).each do |j| 
  (800..999).each do |k|
    p = j * k
    products.push(p)
  end
end

palindromes = []
products.each do |p| 
  s = String(p)
  c = s.clone 
  i = 0
  k = -1
  s[i], s[k], i, k = s[k], s[i], i+1, k-1 until i >= s.length/2
  palindromes.push(s) if s == c
end

largest_pal = Integer(palindromes.max)

  
=begin  
Largest palindrome product
Problem 4

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=end
