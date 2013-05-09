class SumOfMults

  def self.max_multiples( limit, bases )
    hash = {}
    bases = bases.push( bases.reduce(:*) )
    bases.each do |base|
      max_multiple = limit/base * base
      hash[base] = max_multiple
    end
    return hash
  end

  def self.findSum( ceiling, *bases )
    sum = 0
    half = limit/2
    duplicates = {}
    m = max_multiples( ceiling-1, bases )
    duplicates[m.keys.max] = m.delete(m.keys.max)
    m.each do |base, max|
      max.odd? ? sum += (half/base + 1) * max : sum += (half/base + 0.5) * max
    end
    duplicates.each do |base, max|
      max.odd? ? sum -= (half/base + 1) * max : sum -= (half/base + 0.5) * max
    end
    return Integer(sum)
  end
  
end # of class

puts SumOfMults.findSum(1000,3,5)


x = 3
y = 5
z = 7
----
m = 105 = 3 * 5 * 7

x = 2
y = 4
z = 9