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



class Person
  
  attr_accessor :name, :spending_amount
  
  def initialize( name ) 
    
    @name = name
    @spending_amount=0
    
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
   
  def spend( amt )
    @spending_amount += amt
  end
  
end