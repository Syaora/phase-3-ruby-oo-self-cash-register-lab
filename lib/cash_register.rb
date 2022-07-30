class CashRegister
  attr_reader :discount
  attr_accessor :total, :items, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, total, quantity = 1)
    itemTotal = total * quantity
    quantity.times { self.items << item }
    self.total += itemTotal
    self.last_transaction = itemTotal
  end

  def apply_discount
    if (self.discount > 0) 
      discount = (100 - self.discount.to_f) / 100
      self.total = (self.total * discount).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end
end
