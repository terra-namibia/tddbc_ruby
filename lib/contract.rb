require 'Date'
class Contract

  attr_accessor :key, :signed_on, :revenue, :revenue_recognition
  PRODUCTS = {:msword=> {:price=>18800}, :ichitaro=> {:price=>20000}, :sanshiro=> {:price=>5000}}

  def initialize(key)
    @key = key
    @revenue = 0
    @revenue_recognition = 0
    # @signed_on = xx
  end

  def products
    PRODUCTS
  end

  def sign
    @signed_on = Date.today
    @revenue = products[@key][:price]
    revenue_recognize
  end

  # 商品ごとに変わる
  def revenue_recognize
    # @revenue_recognition = @revenue
  end

  # def current_revenue_recognize(date)
  #   @revenue_recognition
  # end


end

# WIP revenue_recognitionは商品ごとに変えたい...
class Wordprocessor < Contract
  def initialize(key)
    super
  end

  def revenue_recognize
    @revenue_recognition = @revenue
  end

end

class Spreadsheet < Contract
  def initialize(key)
    super
  end

  def revenue_recognize
    @revenue_recognition = @revenue / 3 * 2
    @revenue_recognition_rest = @revenue - @revenue_recognition
  end

  def current_revenue_recognize(date)
  end

end