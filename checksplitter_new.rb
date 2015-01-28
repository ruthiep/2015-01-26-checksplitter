
class Checksplitter

  def initialize (total, tip, party_size) 
    
    attr_accessor (:@total, :@party_size)
    
   # @total = total
    @tip = tip * .01
   # @party_size = party_size
  end
  
  def tip 
     if @tip <= 0 
       @tip = 1
     else @tip += 1
     end
   @tip
 end
     
   # def set_party
#      puts "how many in your party"
#      @party = gets.chomp.to_i
#    end
#
#    def set_bill
#      puts "how much was the bill"
#      @total = gets.chomp.to_i
#    end
   
   def total_bill
     total_bill = @tip * total 
   end
   
  def amount_due
    amt_due = total_bill / party_size
    amt_due.to_s
  end
    
  def pay_amount
    puts "you each owe $" + amount_due
  end
end
  
  
  #test = Checksplitter.new
  
  #test.pay_amount
  
  
  
  
  