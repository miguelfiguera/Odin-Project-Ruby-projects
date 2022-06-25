dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
string="Howdy partner, sit down! How's it going?"

def substring(string,dictionary)
array=[]
the_string_array= []
my_hash={}
string.each_codepoint do |num|
  case
  when num.between?(65,90) || num.between?(97,122)
    array.push(num)
  when num == 32
    array.push(num)
  end
end
array.each {|num| the_string_array.push(num.chr)}
new_string_array=the_string_array.join.downcase.split(" ")
puts new_string_array
dictionary.each do |word|
  if new_string_array.count(word) > 0
    my_hash[word.to_s]=new_string_array.count(word)
  else
  end
end
print my_hash
return my_hash
end     

substring(string,dictionary)