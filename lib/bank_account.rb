class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name, balance=1000, status="open")
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(num)
    self.balance += num
    self.balance
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def close_account
    self.status = "closed"
  end

  def valid?
    if self.balance > 0 && self.status == "open"
      return true
    else
      return false
    end
  end

end
