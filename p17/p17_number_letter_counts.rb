class Integer
  def to_words  # converts integer no greater than 1000 to (British usage) strings
    n = self

    ones = [nil, "one", "two", "three", "four", "five", "six", "seven", \
            "eight", "nine"]       
    teens = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", \
            "sixteen", "seventeen", "eighteen", "nineteen"]
    tens = [nil, teens,  "twenty", "thirty", "forty", "fifty", "sixty", \
            "seventy", "eighty", "ninety"]
    hundreds = ones.map { |e| e ? e + " hundred" : e }
    thousands = [nil, "one thousand"]

    # digit[1] is digit in unit place, digit[2] is digit in tens place...
    digit = [ nil, (n / 1000), (n / 100 % 10), (n % 100 / 10), (n % 10) ] 

    # convert digits to corresponding strings
    if digit[3] == 1 then  # if n % 100 is between 10 and 19...
      ten = tens[1][ digit[4] ]
    else
      one = ones[ digit[4] ]
      ten = tens[ digit[3] ]
    end
    hundred = hundreds[ digit[2] ]
    thousand = thousands[ digit[1] ]
    and_ = " and " if hundred && (ten || one)
    hyphen = '-' if digit[3] > 1 && digit[4] > 0
    
    # concatenate the strings together and return
    (thousand || '')+(hundred || '')+(and_ || '')+(ten || '')+(hyphen || '')+(one || '')
  end
end

def letter_count(max) # loop through each num, counting letters, ignoring others
  sum = 0
  1.upto(max).each { |n| sum += n.to_words.gsub(/[^a-z]/, '').length }
  return sum
end
  
puts letter_count 1000  => 21124

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
