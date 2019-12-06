# このコードをコピペしてrubyファイルに貼り付け、そのファイルをirbでrequireして実行しましょう。

# 例

# irb
# require '/Users/tanizawakenta/workspace/work/VendingMachine3.rb'
# （↑のパスは、自動販売機ファイルが入っているパスを指定する）

# 初期設定（自動販売機インスタンスを作成して、vmという変数に代入する）
# vm = VendingMachine.new
#
# 作成した自動販売機に100円を入れる
# vm.slot_money (1000)
#
# 作成した自動販売機に入れたお金がいくらかを確認する（表示する）
# vm.current_slot_money
#
# 作成した自動販売機に入れたお金を返してもらう
# vm.return_money

class Drink
  attr_reader :name, :price

  def self.cola
    self.new(:cola, 120)
  end

  def self.redbull
    self.new(:redbull, 200)
  end

  def self.water
    self.new(:water, 100)
  end

  def initialize(name,price)
    @name = name
    @price = price
  end
end

class VendingMachine
  # ステップ０　お金の投入と払い戻しの例コード
  # ステップ１　扱えないお金の例コード

  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze

  # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
    # 追記：最初の売上金額は０円
    @sale_amount = 0

    @stock = {cola: 5, redbull: 5, water: 5}
  end

  def current_slot_money
    @slot_money
  end

  def current_stock
    @stock
  end

  def slot_money(money)
    return false unless MONEY.include?(money)
    @slot_money += money
  end

  def return_money
      puts @slot_money
    @slot_money = 0
  end

  def cola_info
    if @slot_money > Drink.cola.price && self.current_stock[:cola] > 0
    puts "コーラを購入できます"
    end
  end

  def buy_cola
    if @slot_money > Drink.cola.price && @stock[:cola] > 0
      puts "コーラを購入しました"
      @sale_amount += Drink.cola.price
      @stock[:cola] -= 1
      return_money = @slot_money -= Drink.cola.price
      puts "お釣りは#{return_money}円です。"
      return true
    else
      puts "コーラを購入できません。"
    end
  end

  def redbull_info
    if @slot_money > Drink.redbull.price && self.current_stock[:redbull] > 0
    puts "レッドブルを購入できます"
    end
  end

  def buy_redbull
    if @slot_money > Drink.redbull.price && @stock[:redbull] > 0
      puts "レッドブルを購入しました"
      @sale_amount += Drink.redbull.price
      @stock[:redbull] -= 1
      return_money = @slot_money -= Drink.redbull.price
      puts "お釣りは#{return_money}円です。"
      return true
    else
      puts "レッドブルを購入できません。"
    end
  end

  def water_info
    if @slot_money > Drink.water.price && self.current_stock[:water] > 0
    puts "水を購入できます"
    end
  end

  def buy_water
    if @slot_money > Drink.water.price && @stock[:water] > 0
      puts "水を購入しました"
      @sale_amount += Drink.water.price
      @stock[:water] -= 1
      return_money = @slot_money -= Drink.water.price
      puts "お釣りは#{return_money}円です。"
      return true
    else
      puts "水を購入できません。"
    end
  end

  def sale_amount #現在の売上金額を取得できる
    @sale_amount
  end

end