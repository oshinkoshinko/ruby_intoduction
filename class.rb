class User
  def initialize #User.newで呼ばれるのがinitializeメソッド
    puts "Initialized"
  end
end

User.new #=> "Initialized"

class User
  #initializeメソッドに引数を付けるとnewメソッドでも引数必要
  def initialize(name, age) #User.newで呼ばれるのがinitializeメソッド
    puts "name: #{name}, age: #{age}"
  end
end

# User.new #`initialize': wrong number of arguments (given 0, expected 2) (ArgumentError)
User.new("Shinya", 26)

class User
  def initialize(name) #User.newで呼ばれるのがinitializeメソッド
    @name = name
  end

  def hello
    puts "Hello, I am #{@name}"
  end
end

user = User.new("Alice")
user.hello

class User
  
  attr_accessor :name #インスタンス変数の内容を外部で読み書きを許可する
  def initialize(name)
    @name = name
  end

end

user = User.new('Alice')
user.name = 'Bob' #nameを変更する
p user.name #=> "Bob" nameを参照

class Oka
  
  attr_reader :name #インスタンス変数の内容を外部で参照のみを許可する
  def initialize(name)
    @name = name
  end

end

user = Oka.new('Alice')
p user.name #"Alice"
#変更はエラーが出る　attr_readerの為
# p user.name = 'Bob' # undefined method `name=' for #<Oka:0x00007fdcf682a688 @name="Alice"> (NoMethodError

class Atleti
  #複数のインスタンスのアクセサメソッドを作成
  attr_accessor :name, :number

  def initialize(name, number)
    @name = name
    @number = number
  end

  def goal
    puts "#{@name} goaaaaal ,numero #{@number}!!!"
  end
end

player = Atleti.new("Koke", 6)
player.goal

#クラスメソッド　インスタンスに含めれるデータを使用しないメソッドを定義したい
class Kagawa

  def initialize(name)
    @name = name
  end

  #self.を付けるとクラスメソッドになる
  def self.create_users(names)
    names.map do |name|
    Kagawa.new(name)
    end
  end

  #インスタンスメソッド
  def hello
    "Hello, I am #{@name}"
  end
end

names = ["Alice", "Bob", "Mike"]
users = Kagawa.create_users(names)
users.each do |user|
  puts user.hello
end

