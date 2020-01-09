require_relative '../lib/bank_account'


class Transfer 

  attr_accessor :sender, :receiver, :status, :amount

  def initialize (sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status=status
    @amount = amount
  end 


  def valid?
    if @sender.valid? && @receiver.valid?
    return true
    end 
  end

  def execute_transaction
    if valid? && @sender.balance >= amount && @status == "pending"
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if valid? && sender.balance >= amount && @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end


end



