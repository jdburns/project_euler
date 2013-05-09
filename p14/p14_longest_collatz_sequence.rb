max_terms = 1
(3..999_999).each do |n|
  seed = n
  terms = 1
  until n == 1 do
    n = n.even? ? n/2 : 3*n+1
    terms += 1 
  end
  if terms > max_terms then 
    max_terms = terms
    max_seed = seed
  end
end
puts "#{max_seed} produces the longest chain: #{max_terms} terms"

=> 837799 
  
# I think the answer will be odd...