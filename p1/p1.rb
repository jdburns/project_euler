class SumOfMults

  def self.greatest_mult( limit, arr )
    hash = {}
    args = arr.push( arr.reduce(:*) )
    args.each do |arg| 
      limit.step(0, -1) do |n| 
        if n % arg == 0 then 
          hash[arg] = n
          break
        end
      end  
    end
    return hash
  end

  def self.findSum( ceiling, *arr )
    sum = 0
    limit = ceiling - 1
    half = limit/2
    duplicates = {}
    g = greatest_mult( limit, arr )
    duplicates[g.keys.max] = g.delete(g.keys.max)
    g.each do |arg, greatest|
      greatest.odd? ? sum += (half/arg + 1) * greatest : \
      sum += (half/arg + 0.5) * greatest
    end
    duplicates.each do |arg, greatest|
      greatest.odd? ? sum -= (half/arg + 1) * greatest : \
      sum -= (half/arg + 0.5) * greatest
    end
    return Integer(sum)
  end
  
end # of class

puts SumOfMults.findSum(1000,3,5)

