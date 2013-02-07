=begin
After sending smileys, John decided to play with arrays. Did you know that hackers enjoy playing with arrays? John has a zero-based index array, m, which contains n non-negative integers. However, only the first k values of the array are known to him, and he wants to figure out the rest.

John knows the following: for each index i, where k <= i < n, m[i] is the minimum non-negative integer which is *not* contained in the previous *k* values of m.

For example, if k = 3, n = 4 and the known values of m are [2, 3, 0], he can figure out that m[3] = 1.

John is very busy making the world more open and connected, as such, he doesn't have time to figure out the rest of the array. It is your task to help him.

Given the first k values of m, calculate the nth value of this array. (i.e. m[n - 1]).

Because the values of n and k can be very large, we use a pseudo-random number generator to calculate the first k values of m. Given non-negative integers a, b, c and positive integer r, the known values of m can be calculated as follows:

m[0] = a
m[i] = (b * m[i - 1] + c) % r, 0 < i < k
Input
The first line contains an integer T (T <= 20), the number of test cases.
This is followed by T test cases, consisting of 2 lines each.
The first line of each test case contains 2 space separated integers, n, k (1 <= k <= 105, k < n <= 109).
The second line of each test case contains 4 space separated integers a, b, c, r (0 <= a, b, c <= 109, 1 <= r <= 109).
Output
For each test case, output a single line containing the case number and the nth element of m.
=end
input_flag = 0
n = 0
k = 0
def fill_the_array_till_k(array_m, n, k, a, b, c, r)
  array_m[0]=a
  for i in (1...k)
      array_m[i] = ((b* array_m[i-1]) + c) %r
  end
end
def find_min_in_previos_k(array_m, k)
  start = 0
  terminate =k
#  puts "#{start}, #{terminate}"
  min_element = array_m[start...terminate].min_by{|x| x.to_i}
#  puts "MIN ELEMENT: #{min_element}\n*****"
  return min_element
end
def minimum_not_present_in_array(array_m)
  temp = []
  for i in (0..array_m.length)
    temp[i] = 0
  end
  i=0
  for i in (0...array_m.length)
    if(array_m[i]>0 && array_m[i]<=array_m.length)
      temp[array_m[i]] = 1
    end
  end
  i = 1
  len = 0
  for i in (1...temp.length)
    if(temp[i] == 1)
      len = len + 1
    else
      break
    end
  end
  return len+1
end
def calculate_min(n, k, a, b, c, r, index)
  array_m = []
  fill_the_array_till_k(array_m, n, k, a, b, c, r)
  puts array_m
  for i in (0..k)
#    min_element = find_min_in_previos_k(array_m, k)
#    test_number = min_element+1
#    while array_m[0...k].include?(test_number)
#      test_number = test_number + 1
#    end
#    array_m[k] = test_number
    array_m[k] = minimum_not_present_in_array(array_m)
    puts array_m[k]
    array_m.slice!(0,1)
#    puts array_m.length
#    puts array_m[i-k..i]
  end
  puts "*****"
  value = (n-2) % (k-1)
  puts array_m
  puts array_m[k+value]
#  exit
  File.open('minimum_output', 'a+') {|f| f.write("Case ##{index/2}: #{array_m[k-1]}\n")}
end

File.open(ARGV[0]).each_with_index do |line , index|
  if index == 0
    @total_tests=line.to_i
  else
    if input_flag==0
      input = line.split(' ')
      n = input[0].to_i
      k = input[1].to_i
      input_flag = 1
    else
      input = line.split(' ')
      a = input[0].to_i
      b = input[1].to_i
      c = input[2].to_i
      r = input[3].to_i
      calculate_min(n, k, a, b, c, r, index)
      input_flag = 0
    end
  end
end

