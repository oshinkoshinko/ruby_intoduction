class Product
  def title
    log "title is called"
    "A great movie"
  end

  private

  def log(text)
    puts "[LOG] #{text}"
  end
end

class User
  def name
    log "name is called"
    "Alice"
  end

  private

  def log(text)
    puts "[LOG] #{text}"
  end
end

product = Product.new
p product.title

user = User.new
p user.name

#↑はログ出力の処理が重複している！！！==>moduleを使える！！ 製品とユーザがis-aの関係ではないため継承は使うべきではない！

module Loggable

  private #クラスの外から呼び出したくない場合

   def log(text)
    puts "[LOG] #{text}"
  end 
end

class Product

  #上で作ったmoduleをincludeする == ミックスイン
  include Loggable

  def title
    log "title is called"
    "A great movie"
  end
end

class User

  #上で作ったmoduleをincludeする == ミックスイン
  include Loggable

  def name
    log "name is called"
    "Alice"
  end
end

product = Product.new
p product.title

user = User.new
p user.name

#moduleにpricate付与した場合
# p product.log 'public?' #=>private method `log' called for #<Product:0x00007fbfa0832478> (NoMethodError)

#Mathモジュール
class Calculator
  include Math

  def calc_sqrt(n)
    sqrt(n)
  end
end

calculator = Calculator.new
p calculator.calc_sqrt(2)