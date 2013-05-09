[refactor=fake_tag]
I've made two major revisions to reduce my bloated running time. First, I realized that I was building the word string arrays from scratch for every number < 1000. I moved this code into a hash outside the method I call repeatedly, so the arrays are only built once. This reduced my runtime from ~15s to ~20ms. Later, I pulled the calculation to find the number of letters in each word string out of the repeatedly called method as well, which got me down to about 2ms. I did this last in a hurry, so my code needs a serious cleanup, which I'll post when I get a chance. 
[code=Ruby]


[/refactor]
/

class NumberLetterCounts
  include
  def ititialize(max)
    






# takes an array of strings (or arrays), replaces each element with its length
class Array
  def element_lengths
    self.map { |e| e ? e.length : 0 } 
  end
end

class Integer
  include NumberLetterCounts
  def letter_count(nums)
    ones_digit =      self % 10
    tens_digit =      self % 100 / 10
    hundreds_digit =  self / 100 % 10
    thousands_digit = self / 1000 

    # look up letter count of words needed to spell out number, digit by digit
    if tens_digit == 1 then
      ones = 0
      tens = nums[0][ ones_digit ]
    else
      ones = nums[1][ ones_digit ]
      tens = nums[2][ tens_digit ]
    end
    hundreds = nums[3][ hundreds_digit ]
    thousands = nums[4][ thousands_digit ]
    and_ = hundreds > 0 && (tens > 0 || ones > 0) ? 3 : 0 
    
    thousands + hundreds + and_ + tens + ones
  end      
end
  
def total_letters(max)
  nums = {}
  nums[:teens] = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", \
                  "sixteen", "seventeen", "eighteen", "nineteen"]
  nums[:ones] = [nil, "one", "two", "three", "four", "five", "six", "seven", \
                  "eight", "nine"]
  nums[:tens] = [nil, nums[:teens], "twenty", "thirty", "forty", "fifty",  \
                  "sixty", "seventy", "eighty", "ninety"]
  nums[:hundreds] = nums[:ones].map { |e| e + "hundred" if e } 
  nums[:thousands] = [nil, "onethousand"]
  nums = nums.each_value.map(&:element_lengths)  # Replace each word string with its letter count
  puts "nums:   #{nums}"
  sum = 0
  1.upto(max).each { |i| sum += i.letter_count(nums) }
  return sum
end

puts total_letters 1000

require "benchmark"  

time = Benchmark.realtime { puts total_letters 1000 }


puts "Time elapsed #{time*1000} milliseconds"

NEW => Time elapsed 2.084 milliseconds

1ST Refactor=> Time elapsed 19.542 milliseconds

First Successful: ~20 s

=begin commented code


 
  def to_words  # converts integer no greater than 1000 to (British usage) strings
    n = self

    # digit[1] is digit in unit place, digit[2] is digit in tens place...
    digit = [ nil, (n / 1000), (n / 100 % 10), (n % 100 / 10), (n % 10) ] 

    # convert digits to corresponding strings
    if digit[3] == 1 then  # if n % 100 is between 10 and 19...
      ten = @@tens[1][ digit[4] ]
    else
      one = @@ones[ digit[4] ]
      ten = @@tens[ digit[3] ]
    end
    hundred = @@hundreds[ digit[2] ]
    thousand = @@thousands[ digit[1] ]
    and_ = " and " if hundred && (ten || one)
    hyphen = '-' if digit[3] > 1 && digit[4] > 0
    
    # concatenate the strings together and return
    (thousand || '')+(hundred || '')+(and_ || '')+(ten || '')+(hyphen || '')+(one || '')
  end   


time = Benchmark.realtime { letter_count 1000 }
puts "Time elapsed #{time*1000} milliseconds"

=> Time elapsed 19.542 milliseconds

=end commented code

=begin comment
Number letter counts
Problem 17
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

words.each { |s| letters[s] = s.length }  

w.push( "one", "thousand" )
(1..1000).each { |num| 

  w.push( letters[num[2]] )
=end comment
