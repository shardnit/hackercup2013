=begin
When John was a little kid he didn't have much to do. There was no internet, no Facebook, and no programs to hack on. So he did the only thing he could... he evaluated the beauty of strings in a quest to discover the most beautiful string in the world.

Given a string s, little Johnny defined the beauty of the string as the sum of the beauty of the letters in it.

The beauty of each letter is an integer between 1 and 26, inclusive, and no two letters have the same beauty. Johnny doesn't care about whether letters are uppercase or lowercase, so that doesn't affect the beauty of a letter. (Uppercase 'F' is exactly as beautiful as lowercase 'f', for example.)

You're a student writing a report on the youth of this famous hacker. You found the string that Johnny considered most beautiful. What is the maximum possible beauty of this string?

Input
The input file consists of a single integer m followed by m lines.
Output
Your output should consist of, for each test case, a line containing the string "Case #x: y" where x is the case number (with 1 being the first case in the input file, 2 being the second, etc.) and y is the maximum beauty for that test case.
Constraints
5 ≤ m ≤ 50
2 ≤ length of s ≤ 500
=end
File.open(ARGV[0]).each_with_index do |line, index|
  if index == 0
    @total_test = line.to_i
  else
    score = 0
    alphabet_hash = {}
    line.downcase!
    line.gsub!(/[^a-z]+/, '')
    line.each_char do |char|
      if alphabet_hash.has_key?(char)
        alphabet_hash[char] = alphabet_hash[char] + 1
      else
        alphabet_hash[char]=1
      end
    end
    sorted_hash = alphabet_hash.values.sort{ |x,y| y<=>x }
    sorted_hash.each_with_index do |value, offset|
      score = score + ((26 - offset)*value)
    end
    File.open('beautiful_strings_score', 'a+') {|f| f.write("Case ##{index}: #{score}\n")}
  end
end
