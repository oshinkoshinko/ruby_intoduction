

# print array = (1..64).to_a
# new_array = Array.new

# array.each do |n|

# new_array << n ** 4

# end

# print new_array.sum

# a = [1,0,5]
# 35.times do
#   p a << a[-3..-1].sum
# end

# p a[4] #=>11
# p a[31] #=>162149716 32番目

# array = (1..40000).to_a
# new_array = Array.new

# array.each do |n|

#   if n % 3 == 0 || n.to_s.include?("3")
#     new_array << n.to_i
#   end
# end

# puts new_array.sum #600726804  12ふん

# array = (1..80).to_a
# new_array = Array.new

# p array.sample(3)

# p new_array

array3 = Array.new
array = (1..500).to_a

1000.times do
new_array = array.sample(3).sort
dimen = new_array[0] * new_array[1] / 2
if dimen <= 5000
  if new_array[0]**2 + new_array[1]**2 == new_array[2]**2
    array3 << new_array
    array3 << ","
  end
end
end

p array3

array = (1..500).to_a

sum = 0
array.each do |n|
  p sum += n
end

puts sum

205円切手が30枚、82円切手が40枚、30円切手が10枚あります。

これらの切手の全部または一部（1枚以上）を使って額面の和として表せる金額は何通りあるか、求めてください。