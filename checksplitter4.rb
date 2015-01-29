require "pry"

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

  def initialize (total, tip, party_size) 
    
    #attr_accessor (:@total, :@party_size)
    
   @total = total
   @tip = (tip * 0.01) + 1
   @party_size = party_size
  end
  
  def tip 
     if @tip <= 0 
       @tip = 1
     else @tip += 1
     end
   @tip
 end
   
   # def total_bill
#      @tip * @total
#    end
  
   def amount_due
     temp_total = (total_bill * tip) / @party_size
     temp_total.ceil.to_i
   end
    
end


  class Member
    
    def initialize
        @diners = [] 
    end
  
  def add_diners
    answer = "Y"
    while answer == "Y"
      puts "Who is eating with the club today?"
      answer = gets.chomp
      @diners << answer
      puts "Anyone else? Y/N"
      answer = gets.chomp.upcase
    end 
    return @diners  
  end
  
  def get_length
    @diners.length
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
#    @diners = []
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
   
  
  
  def get_restaurant
    puts "which restaurant?"
    restaurant = gets.chomp
  end
  
  def update_history
    dinner = Member.new
    @club_history  << get_restaurant << dinner.add_diners
    puts @club_history
    return dinner.get_length
  end
  
  def check_if_splitting
    puts "Is everyone paying today?"
    answer = gets.chomp.upcase
    if answer == "Y"
      calc_portion_of_bill
      #else
      #treats
    end
  end

  def calc_portion_of_bill
      @party = update_history
      puts "num_in_party = #{@party}"  
      today = Checksplitter.new(50, 20, @party)
      puts "we each owe #{today.amount_due}"
  
  end
 
  def treats
      puts "Who's treating?"
      answer = gets.chomp
      
      #@balance_sheet[answer] += total_bill
  end

  # def add_to_total
#     add_amt = calc_portion_of_bill
#     count = 0
#     while count < @num_in_party
#     @balance_sheet[dinner[count]] = sprintf("%.02f", add_amt)
#     count += 1
#     end
#      puts @balance_sheet
#   end
  
end

test = DinnerClub.new

#test.update_history
#test.add_to_total

test.check_if_splitting
#test.calc_portion_of_bill
#test.update_history
#test.check_if_splitting
#test.add_to_total
#test.update_history  