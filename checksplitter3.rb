"require pry"


class Checksplitter

  def initialize 
    @party = 0
    @total = 0
    @tip = 1.2
  end
  
  def calc_tip 
   @tip
 end
     
   def set_party
     @party = test.add_diners.length
   end
     
   def set_bill
     puts "how much was the bill"
     @total = gets.chomp.to_i
   end
   
   def total_bill
     calc_tip * set_bill 
   end
   
  def amount_due
    total_bill / set_party
  end
    
end


class DinnerClub
  
  def initialize
    @diners = []
    @balance_sheet = {}
    @dinner_log = []
    @club_history = []
    
  end
  
  def add_diners
    answer = "Y"
    while answer == "Y"
      puts "Who is eating today with the club?"
      answer = gets.chomp
      @diners << answer
      puts "Any more? Y/N"
      answer = gets.chomp.upcase
    end   
  end
  
  
  def update_history 
    puts "which restaurant?"
    restaurant = gets.chomp
    add_diners
    @club_history << restaurant << @diners
    puts @club_history
  end
  
  def check_if_splitting
    puts "Is everyone paying today?"
    answer = gets.chomp.upcase
    if answer == "Y"
      return true
    else
      return false
    end
  end
  
  def amount_due
    if check_if_splitting
      today = Checksplitter.new  
      today.amount_due
    end
  end
  
  # def add_to_total
#     add_amt = amount_due
#     @diners.each do |name, amount|
#       @balance_sheet[@diners] += add_amt
#     end
#      puts @balance_sheet
#   end
  
end

test = DinnerClub.new

# test.add_diners
# test.add_to_total
test.update_history
  
  