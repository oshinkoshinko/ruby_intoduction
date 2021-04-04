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

#例題
class Gate

  STATIONS = [:umeda, :juso, :mikuni]
  FARES = [150, 190]

  def initialize(name)
    @name = name
  end

  def enter(ticket)
    ticket.stamp(@name)
  end

  def exit(ticket)
    fare = calc_fare(ticket)
    fare <= ticket.fare
  end

  def calc_fare(ticket)
    from = STATIONS.index(ticket.stamped_at)
    to = STATIONS.index(@name)
    distance = to - from
    FARES[distance - 1]
  end

end

class Ticket
  attr_accessor :fare, :stamped_at

  def initialize(fare)
    @fare = fare
  end

  def stamp(name)
    @stamped_at = name
  end
end

#クラスの継承 super
class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  # to_sメソッドをオーバーライド
  def to_s
    "name: #{name}, price: #{price}"
  end
end

class DVD < Product
  attr_reader :name, :price, :runnnig_time

  def initialize(name, price, runnnig_time)
    @name = name
    @price = price
    @runnnig_time = runnnig_time
  end

  def to_s
    # "name: #{@name}, price: #{@price}, running_time: #{@running_time}"
    "#{super}, running_time: #{@running_time}" #superでproductのto_sメソッドを継承
  end
end

product = Product.new("A great movie", 1000)
# p product.to_s #=> "#<Product:0x00007fa3ad03c7f0>" オブジェクトクラスのto_sメソッド
p product.to_s #=>"name: A great movie, price: 1000" to_sメソッドをオーバーライド

dvd = DVD.new("An awesome film", 3000, 120)
p dvd.to_s

a = "abc"
b = "abc"

p a.equal?(b)

