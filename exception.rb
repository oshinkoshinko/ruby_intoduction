#例外処理

puts 'Start'

module Greeter
  def hello
    puts "hello"
  end
end

begin
  #moduleはインスタンスを作成できないのでGreeter.newでエラー(例外)発生
  greeter = Greeter.new
rescue
  puts "例外が発生したが、このまま続行"
end

puts 'End'