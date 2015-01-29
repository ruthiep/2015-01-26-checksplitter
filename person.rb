# Class: Person
#
# Creates a new person object for the Dinnerclub @members hash..
#
# Attributes:
# name             - String: the name of the person obj.
# spending_amount  - Integer: the running total of their dinner club events. 
#
# Public Methods:
# #spend
# 


class Person
  
  attr_accessor :name, :spending_amount
  
  def initialize( name ) 
    
    @name = name
    @spending_amount=0
    
  end
  
  # Public: #spend
  # Adds the amt of a dinner to the running total in their history.
  #
  # Parameters:
  # amt      - Integer: amount of dinner calculated from CheckSplitter.
  #
  #
  # Returns:
  # @spending_amount  : The new balance.
  #
  # State changes:
  # @spending_amount
   
  def spend( amt )
    @spending_amount += amt
  end
  
end