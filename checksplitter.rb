
class Checksplitter

  def initialize 
    @total = 0
    @tip = 1.2
  end
  
  def calc_tip 
   puts "do you want to change the tip amount? Y/N"
   answer = gets.chomp
   if answer == "Y"
     @tip = 1 + gets.chomp.to_i
   end
 end
     
   def set_party
     puts "how many in your party"
     @party = gets.chomp.to_i
   end
     
   def set_bill
     puts "how much was the bill"
     @total = gets.chomp.to_i
   end

  def amount_due
    @total_bill = @tip * @total
    @amt_due = @total_bill / @party
    puts "the amount you each owe is $#{@amt_due}"
  end
  
end
  
  
  test = Checksplitter.new
  test.calc_tip
  test.set_party
  test.set_bill
  test.amount_due
  
  
  
  
  