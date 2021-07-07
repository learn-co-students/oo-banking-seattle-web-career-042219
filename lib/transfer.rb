require 'pry'

class Transfer
  # your code here

  attr_accessor :sender, :receiver, :amount
  attr_reader :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end


  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if !@sender.valid?
      "#{@sender} is not a valid account."
    elsif !@receiver.valid?
      "#{@receiver} is not a valid account."
    else
      if @sender.balance >= @amount && @status == 'pending'
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = 'complete'
      else
        @status = 'rejected'
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = 'reversed'
      "Reversed."
    else
      "Transfer is in #{@status} and cannot be reversed."
    end
  end

end
