require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  attr_reader :status

  def initialize(sender, receiver, status='pending')
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = 50

  end

  def valid?
    self.sender.valid? && self.receiver.valid? && self.status =='pending'
  end

  def execute_transaction
  if self.valid? && self.amount < sender.balance
      self.sender.balance =self.sender.balance - @amount
      self.receiver.balance = self.receiver.balance + @amount
      self.status = 'complete'
  else
    self.status = 'rejected'
    "Transaction rejected. Please check your account balance."
  end
end

  def reverse_transfer
    if self.status =='complete'

    self.receiver.balance = self.receiver.balance - @amount
    self.sender.deposit(@amount)
    self.status = 'reversed'

  end
end

end
0
