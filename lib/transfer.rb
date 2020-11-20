require 'pry'

class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  def valid?
  # if self.sender.balance > 0 && self.sender.status == "open" && self.receiver.balance > 0 &&
  #   self.receiver.status == "open"
    if self.sender.valid? && self.receiver.valid?
    return true
  else
    return false
  end
 end

  def execute_transaction
    if valid? && self.sender.balance > @amount && @status != "complete"
      self.status = "complete"
      self.sender.balance -= @amount
      self.receiver.balance += @amount
    else 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
     end
    

    #  binding.pry
  end

  def reverse_transfer
    if self.status == "complete"
    self.receiver.balance -= @amount
    self.sender.balance += @amount 
    self.status = "reversed"
    end
  end

end
