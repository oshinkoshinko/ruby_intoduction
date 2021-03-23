puts 'Hello World'

def fizz_buzz(n)
  if n % 15 == 0
    'FizzBuzz'
  elsif n % 3 == 0
    'Fizz'
  elsif n % 5 == 0
    'Buzz'
  else
    n.to_s
  end
end

puts fizz_buzz(1)
puts fizz_buzz(2)
puts fizz_buzz(3)
puts fizz_buzz(4)
puts fizz_buzz(5)
puts fizz_buzz(6)
puts fizz_buzz(15)

require 'date'
puts Date.today

a = [20,40,50]
a[0] = 100
puts a
p a
print a
a[8] = 99
print a
a.delete_at(8)
print a

a, b = [1000, 90]
p a
p b

numbers = [1,90,22,190]
sum = 0
numbers.each do |f|
  sum += f
end

puts sum

numbers = [1,3,4,55,5553]
new_numbers = []
numbers.each {
|n| new_numbers << n * 10}
print new_numbers

numbers = [1,3,4,55,5553]
new_numbers = numbers.map{ |n| n * 10}
print new_numbers

numbers = [1,3,4,55,5553]
even_numbers = numbers.select{ |n| n.even? }
print even_numbers

numbers = [1,3,4,55,5553]
sum = numbers.inject(0) { |result, n| result + n }
puts sum

range = 1..98
if range.include?(3)
puts "ok"
end

range = 1..98
if range.include?(1009)
puts "ok"
else
puts  "No"
end

def charge(age)
  case age
  when 0..5
    0
  when 6..12
    300
  when 13..20
    2000
  else
    10000
  end
end

puts charge(80)

puts ("a".."ac").to_a

