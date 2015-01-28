"require pry"

#Class: Checksplitter
#
#Calculates the amount each person owes for dinner.
#
#Attributes:
#@party   - Integer: the number of people to divide the check.
#@total   - Float: the total of the restaurant bill. 
#@tip     - Float: the percentage for the tip + 1.
#
#Public Methods:
# #calc_tip
# #set_bill
# #total_bill
# #set_party
# #amount_due


class Checksplitter

  def initialize (num)
    @party = num
    @total = 0
    @tip = 1.2
  end
  
  def calc_tip 
   @tip
 end
     
   def set_bill
     puts "how much was the bill"
     @total = gets.chomp.to_i
   end
   
   def total_bill
     calc_tip * set_bill 
   end
   
   def set_party
     @party
   end
  
   def amount_due
     total_bill / set_party
   end
  
    
end

# Class: DinnerClub
#
# Tracks who attended each dinner and their running balance.
#
# Attributes:
# @diners          - Array: the names of the people who attended that dinner.
# @balance_sheet   - Hash: the names and how much they owe for that dinner. 
# @club_history    - Array: the history of each person's balance.
#
# Public Methods:
# #add_diners
# #update_history
# #format_history
# #check_if_splitting
# #calc_portion_of_bill
# #treats
# #add_to_total


class DinnerClub
  
  def initialize
    @diners = []
    @balance_sheet = {}
    @club_history = []
    
  end
  
  # Public: #add_diners
  # Adds the diners to the array.
  #
  # Parameters:
  # answer   - String: name input from user.
  # @diners  - Array:  the array to be populated.
  #
  #
  # Returns:
  # @diners: The completed array.
  #
  # State changes:
  # adds to @diners
   
  
  
  def add_diners
    answer = "Y"
    while answer == "Y"
      puts "Who is eating with the club today?"
      answer = gets.chomp
      @diners << answer
      puts "Anyone else? Y/N"
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
  
  # def format_history
    # puts "-" * 20
  #   @club_history
  #   puts "-" * 20
  # end
  
  def check_if_splitting
    puts "Is everyone paying today?"
    answer = gets.chomp.upcase
    if answer == "Y"
      calc_portion_of_bill
    else
      treats
    end
  end
  
  def calc_portion_of_bill
      today = Checksplitter.new (@diners.length)  
      today.amount_due
  end
  
  def treats
      puts "Who's treating?"
      answer = gets.chomp
      @balance_sheet[answer] += total_bill
  end
  
  def add_to_total
    add_amt = calc_portion_of_bill
    count = 0
    while count < @diners.length 
    @balance_sheet[@diners[count]] = sprintf("%.02f", add_amt)
    count += 1
    end
     puts @balance_sheet
  end
  
end

test = DinnerClub.new

test.update_history
#test.check_if_splitting
#test.add_to_total

test.update_history
#test.check_if_splitting
#test.add_to_total
  