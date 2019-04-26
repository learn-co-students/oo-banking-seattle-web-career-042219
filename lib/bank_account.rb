class BankAccount
  attr_accessor :status, :balance
  attr_reader :balance, :name

  def initialize(name, balance=1000, status='open')
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(deposit_amount)
    @balance += deposit_amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def close_account
      self.status = 'closed'
    end
  def valid?
    self.balance>0 && self.status=='open'
  end
end
