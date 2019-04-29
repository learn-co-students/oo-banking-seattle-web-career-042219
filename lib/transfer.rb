class Transfer
	attr_accessor :status
	attr_reader :sender, :receiver, :amount	

	def initialize(sender, receiver, amount)
		@sender = sender
		@receiver = receiver
		@status = "pending"
		@amount = amount
	end

	def valid?
		sender.valid? && 
		receiver.valid?
	end

	def execute_transaction
		if self.valid? && sender.balance > amount && self.status != "complete"
			sender.balance = sender.balance - amount 
			receiver.balance = receiver.balance + amount
			self.status = "complete"
		else
			self.status = "rejected"
			"Transaction rejected. Please check your account balance."
		end
	end

	def reverse_transfer
		if self.valid? && receiver.balance > amount && self.status == "complete"
			receiver.balance = receiver.balance - amount
			sender.balance = sender.balance + amount 
			self.status = "reversed"
		else
			self.status = "complete"
			"Transaction rejected. Your friend does not have the funds to complete transfer."
		end
	end
end
