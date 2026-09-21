require 'pry-byebug' #DEBUGGING

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(input, dictionary)
  arr = []
  #Splitting each letter and it's combinations
  for i in 0..input.length-1 
    for j in 0..input.length-1
      unless i > j #Preventing nil or empty spaces
        arr << input[i..j].downcase #This makes it case insensitive
        next
      end
    end
  end
  
  new_arr = arr.select { |word| dictionary.include?(word)} #Create a new array only for words in the dictionary

  #Returns the result as a new Hash
  res = new_arr.reduce(Hash.new(0)) do |result, word|
    result[word] += 1 #Counting repetition of words
    result 
  end

  binding.pry #Debugging with pry-byebug

  return res.sort #Maybe it's unnecessary but returning it just in case
end

substrings("Howdy partner, sit down! How's it going?", dictionary)