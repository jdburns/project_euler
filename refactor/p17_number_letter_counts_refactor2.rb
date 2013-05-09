class CountLetters

  def initialize(max)
    @max = max
    @lengths = lengths
    puts "It takes #{total_letters} letters to spell out each natural number up to " + 
          "#{@max}, inclusive."
  end

  def lengths
    @num_words = {}
    @num_words[:teens] = ["ten", "eleven", "twelve", "thirteen", "fourteen", \
                            "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
    @num_words[:ones] = ["", "one", "two", "three", "four", "five", "six", "seven", \
                            "eight", "nine"]
    @num_words[:tens] = ["", "", "twenty", "thirty", "forty", "fifty",  \
                            "sixty", "seventy", "eighty", "ninety"]
    @num_words[:hundreds] = @num_words[:ones].map { |e| e.empty? ? e : e + "hundred" } 
    @num_words[:thousands] = ["", "onethousand"]
    # Map hash to new hash with strings replaced by their respective lengths
    Hash[@num_words.map {|k,v| [ k,v.map {|s| s.length || 0} ] }] 
  end      
  
  def letters_in_int(n)
    ones_digit =      n % 10
    tens_digit =      n % 100 / 10
    hundreds_digit =  n / 100 % 10
    thousands_digit = n / 1000
    # look up letter count of words needed to spell out number, digit by digit
    if tens_digit == 1 then  # if n ends in 10..19, use value from teens array
      ones_ltrs = 0
      tens_ltrs = @lengths[:teens][ ones_digit ]
    else
      ones_ltrs = @lengths[:ones][ ones_digit ]
      tens_ltrs = @lengths[:tens][ tens_digit ]
    end
    hundreds_ltrs = @lengths[:hundreds][ hundreds_digit ]
    thousands_ltrs = @lengths[:thousands][ thousands_digit ]
    and_ltrs = hundreds_ltrs.zero? || (tens_ltrs.zero? && ones_ltrs.zero?) ? 0 : 3 
    
    thousands_ltrs + hundreds_ltrs + and_ltrs + tens_ltrs + ones_ltrs
  end

  def total_letters
    1.upto(@max).inject { |total,i| total + letters_in_int(i) }
  end

end

require "benchmark" 
time = Benchmark.realtime {CountLetters.new 1000}
puts "This code ran in #{time*1000} milliseconds"

#1.upto(@max).inject { |sum,i| int_to_letter_count(i) }
    


=begin commented code
 
require "benchmark"  

time = Benchmark.realtime {(0..1_000_000).each {new_hash = Hash[@nums.map {|k,v| [k,v.element_lengths] }] } }
 => 22.682184

time = Benchmark.realtime {(0..1_000_000).each {new_hash = Hash[@nums.each.map {|k,v| [k,v.element_lengths] }] } }

puts "Time elapsed #{time*1000} milliseconds"

NEW => Time elapsed 2.084 milliseconds

1ST Refactor=> Time elapsed 19.542 milliseconds

First Successful: ~20 s

 
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


# Creates transformed hash from existing hash. The "Rails way"
@nums.inject({}) do |hash, (key,value)|
  hash[key] = value.element_lengths
  hash
 end


# Check out .tap method. Looks useful for debugging and whatnot  
(1..10).tap {|x| puts "original: #{x.inspect}"}.to_a\
.tap {|x| puts "array: #{x.inspect}"}.select {|x| x%2==0}\
.tap {|x| puts "evens: #{x.inspect}"}.map { |x| x*x }\
.tap {|x| puts "squares: #{x.inspect}"}


[update=fake_tag]
I've made two major revisions to reduce my bloated running time. First, I realized that I was building the word string arrays from scratch 1000 times; I moved this code out of the #letters_to_int method I call for each number and into a hash inside a method which is only called once. This reduced my runtime from ~15s to ~20ms. Later, I pulled the calculation to find the number of letters in each word string out of the repeatedly called method as well, which got me down to about 2ms. I did this last in a hurry, so my code needed an even more serious cleanup than before. I went back in, removed the monkeypatch to class Integer and used (what I understand at this point to be) standard OO modularization to build a proper class. While a bit verbose, I think the end product is very clean and pretty much self-documenting. At this point in the learning process, I'm trying to choose clean, readable, extensible code over extreme performance tuning--which, of course, you wouldn't use Ruby for anyway, as I'm sure all you C folks will attest ;).

[/update]

=end comment

