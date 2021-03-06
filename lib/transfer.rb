require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @amount = amount
    @status = "pending"
  end 

  def valid?
    if receiver.valid? == sender.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @status == "pending" && sender.balance > amount
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
      # binding.pry
    elsif sender.balance < amount
    @status = "rejected"
     "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    else
    end
  end

end
