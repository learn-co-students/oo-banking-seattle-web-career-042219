

class Transfer

  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount = 50, status = "pending")

    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    @sender.valid?
    @receiver.valid?
  end

  def execute_transaction
    if @status != "complete"
      receiver.balance = receiver.balance + @amount
      sender.balance = sender.balance - @amount
      @status = "complete"
    end
    if !@sender.valid?
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      receiver.balance = receiver.balance - @amount
      sender.balance = sender.balance + @amount
      @status = "reversed"
    end
  end
end
