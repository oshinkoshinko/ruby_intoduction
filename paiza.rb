array = [8, 1, 3, 3, 8, 1, 1, 3, 8, 8]
puts array


array = [10,13,21,1,6,51,10,8,15,6]
if array.include?(21)
  puts "Yes"
else
  puts "No"
end

puts "Yes" if array.include?(15)

#配列の中で指定した要素が何番目か→index(引数)
puts array.index(51)

array1 = [3, 5]
array2 = [1,2,3,4,5]

N = array1[0]
puts array2.index(N)

array3 = [1,1,1,1,2,3,4,4,5,6,6]
puts array3.count(1)
puts array3.count(4)

#二次元配列
# 二次元配列とは、配列の中に配列の入った、入れ子のデータ構造です。
# 縦横方向にデータを追加していくため、配列(一次元)と比較し、二次元配列と呼びます。
# 二次元配列のことを行列とも呼びます。


array = Array.new(5,1)
p array