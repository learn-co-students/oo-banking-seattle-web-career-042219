require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    #binding.pry
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction

      if self.status == "pending"
        @sender.deposit(-@amount)
        if @sender.valid? == true
            @receiver.deposit(@amount)
            self.status = "complete"
        else
            self.status = "rejected"
            @sender.deposit(@amount)
            "Transaction rejected. Please check your account balance."
        end
      else
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      self.status = "reversed"
    end

  end

end
