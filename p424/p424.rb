
a = [1, 2, 3, 4, 5, 0]
a.take(3)             #=> [1, 2, 3]

# VERY USEFUL FOR THIS p8??
a = [1, 2, 3, 4, 5, 0]
a.take_while { |n| n < 3 }  #=> [1, 2]


run = Array.new(10){ |i| i }
or


For each "run" of numbers, find all combinations (use ::combination method) which are equal to "target" value of line.

run.combination(run.length) 

As stated above, the combination() method may come in quite handy for this, though I may want to refactor by hand just to show I can:

When invoked with a block, yields all combinations of length n of elements from the array and then returns the array itself.

If no block is given, an Enumerator is returned instead:

a = [1, 2, 3, 4]
a.combination(1).to_a  #=> [[1],[2],[3],[4]]
a.combination(2).to_a  #=> [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
a.combination(3).to_a  #=> [[1,2,3],[1,2,4],[1,3,4],[2,3,4]]
a.combination(4).to_a  #=> [[1,2,3,4]]
a.combination(0).to_a  #=> [[]] # one combination of length 0
a.combination(5).to_a  #=> []   # no combinations of length 5

There is also permutation()...
 
a = [1, 2, 3]
a.permutation.to_a    #=> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
a.permutation(1).to_a #=> [[1],[2],[3]]
a.permutation(2).to_a #=> [[1,2],[1,3],[2,1],[2,3],[3,1],[3,2]]
a.permutation(3).to_a #=> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
a.permutation(0).to_a #=> [[]] # one permutation of length 0
a.permutation(4).to_a #=> []   # no permutations of length 4

and product():

[1,2,3].product([4,5])     #=> [[1,4],[1,5],[2,4],[2,5],[3,4],[3,5]]
[1,2].product([1,2])       #=> [[1,1],[1,2],[2,1],[2,2]]
[1,2].product([3,4],[5,6]) #=> [[1,3,5],[1,3,6],[1,4,5],[1,4,6],
                           #     [2,3,5],[2,3,6],[2,4,5],[2,4,6]]
[1,2].product()            #=> [[1],[2]]
[1,2].product([])          #=> []
  
 
Array difference and intersection may also prove useful:

[1, 1, 2, 2, 3, 3, 4, 5] - [1, 2, 4] #=> [3, 3, 5]
[1, 1, 3, 5] & [1, 2, 3]             #=> [1, 3]

arr = [3, 5, 8, 0];          arr.at(2)     #=> 8 
arr.take(3) #=> [3, 5, 8]
arr.drop(2) #=> [8, 0]
arr.first #=> 3
arr.last  #=> 0  
arr.empty? #=> false
arr.include?(5) #=> true
arr.push(7) #=> [3, 5, 8, 0, 7]
arr << 4 #=> [3, 5, 8, 0, 7, 4]
arr.unshift(6) #=> [6, 3, 5, 8, 0, 7, 4]
arr.insert(1, 2, 1) #=> [6, 2, 1, 3, 5, 8, 0, 7, 4]
arr.pop; #=> 4  
  arr #=> [6, 2, 1, 3, 5, 8, 0, 7]
arr.shift #=> 6
  arr #=> [2, 1, 3, 5, 8, 0, 7]
arr.delete_at(3) #=> 5
arr #=> [2, 1, 3, 8, 0, 7]
arr >> 8
arr #=> [2, 1, 3, 8, 0, 7, 8]
arr.delete(8) #=> 8
arr #=> [2, 1, 3, 0, 7]
arr.insert(3, nil, nil) #=> [2, 1, 3, nil, nil, 0, 7]
arr.compact #=> [2, 1, 3, 0, 7]
arr #=> [2, 1, 3, nil, nil, 0, 7]
arr.uniq #=> [2, 1, 3, nil, 0, 7]
arr #=> [2, 1, 3, nil, nil, 0, 7]

arr.map { |a| 2*a }   #=> [2, 4, 6, 8, 10]
arr                   #=> [1, 2, 3, 4, 5]
arr.map! { |a| a**2 } #=> [1, 4, 9, 16, 25]
arr                   #=> [1, 4, 9, 16, 25]

arr = [1, 2, 3, 4, 5, 6]
arr.select { |a| a > 3 }     #=> [4, 5, 6]
arr.reject { |a| a < 3 }     #=> [4, 5, 6]
arr.drop_while { |a| a < 4 } #=> [4, 5, 6]
arr                          #=> [1, 2, 3, 4, 5, 6]

Non-destructive Selection
arr = [1, 2, 3, 4, 5, 6]
arr.select { |a| a > 3 }     #=> [4, 5, 6]
arr.reject { |a| a < 3 }     #=> [4, 5, 6]
arr.drop_while { |a| a < 4 } #=> [4, 5, 6]
arr                          #=> [1, 2, 3, 4, 5, 6]

Destructive Selection

select! and reject! are the corresponding destructive methods to select and reject

Similar to select vs. reject, delete_if and keep_if have the exact opposite result when supplied with the same block:

arr.delete_if { |a| a < 4 } #=> [4, 5, 6]
arr                         #=> [4, 5, 6]
arr.delete_at(1) #=> 5           
arr #=> [4, 6] 

arr = [1, 2, 3, 4, 5, 6]
arr.keep_if { |a| a < 4 } #=> [1, 2, 3]
arr                       #=> [1, 2, 3]

ary = [1, 2, 4, 2]
ary.count                  #=> 4
ary.count(2)               #=> 2
ary.count { |x| x%2 == 0 } #=> 3

a = [[1,2,3], [4,5,6], [7,8,9]]
a.transpose   #=> [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
#If the length of the subarrays don’t match, an IndexError is raised.

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
[1, 2, 3].zip(a, b)   #=> [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
[1, 2].zip(a, b)      #=> [[1, 4, 7], [2, 5, 8]]
a.zip([1, 2], [8])    #=> [[4, 1, 8], [5, 2, nil], [6, nil, nil]]

 =end

