require 'pry'

class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  @@completed_transfers = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    self.status = "pending"
    if !@@completed_transfers.include?(self)
      if self.valid? && self.amount < self.sender.balance
        self.receiver.deposit(amount)
        self.sender.balance -= self.amount
        @@completed_transfers << self
        self.status = "complete"
        #binding.pry
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if self.status == "complete"
      amount = self.amount
      self.sender.deposit(amount)
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end 
end
