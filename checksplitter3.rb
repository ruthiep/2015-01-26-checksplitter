"require pry"


class Checksplitter

  def initialize 
    @party = 0
    @total = 0
    @tip = 1.2
  end
  
  def calc_tip 
   puts "do you want to change the tip amount? Y/N"
   answer = gets.chomp.upcase
   if answer == "Y"
     puts "what amount would you like?"
     @tip = gets.chomp.to_f
     if @tip <= 0 
       @tip = 1
     else @tip += 1
     end
   end
   @tip
 end
     
   def set_party
     puts "how many in your party"
     @party = gets.chomp.to_i
   end
     
   def set_bill
     puts "how much was the bill"
     @total = gets.chomp.to_i
   end
   
   def total_bill
     total_bill = calc_tip * set_bill 
   end
   
  def amount_due
    amt_due = total_bill / set_party
  end
    
 
end


class DinnerClub
  
  def initialize
    @diners = {Bob: 20, Joan: 25, Ruthie: 20}
    
  end
  
  def update_balance
    today = Checksplitter.new
    today.amount_due
  end
  
  def add_to_total
    add_amt = update_balance
    @diners.each do |name, amount|
      @diners[name] += add_amt
    end
     puts @diners 
  end
  
end

test = DinnerClub.new

test.add_to_total

  
  
 
    
  
  
  