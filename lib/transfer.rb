require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if sender.balance < @amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status == "complete"
      "Transaction already complete."
    else
      receiver.deposit(@amount)
      sender.deposit((@amount*-1))
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      receiver.deposit(@amount*-1)
      sender.deposit(@amount)
      self.status = "reversed"
    end
  end

end
