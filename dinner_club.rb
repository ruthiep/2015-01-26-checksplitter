require 'pry'
require_relative 'CheckSplitter'
require_relative 'person'


#track members
#spending
#track outings
#let members treat

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
  
  attr_reader :members, :events

  def initialize
    @members = {}
    @events = {}
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
   
  def add_member( member )
    @members[member] = Person.new ( member )
    @members
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
   

  def show_members
    @members.each do |member, objs|
     puts member 
    end
    @members
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
   
  
  def remove_member( member )
    @members.delete(member)
    @members
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
   
  
  def have_an_outing( total, tip, *diners )
    cs = CheckSplitter.new( total, tip, diners.length )
    amount_per_person = cs.split_the_bill
  
    diners.each do |diner|
      if @members.has_key?( diner )
        p = @members[diner]
        p.spend( amount_per_person )
      else
        add_member(diner)
        p = @members[diner]
        p.spend( amount_per_person )
      end
    end
    @members
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
   
  def get_spending_report( member )
    @members[member]
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
   
  
  def add_event( restaurant, *member )
    @events[restaurant] = *member
    puts @events
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
   
  
  def treat (member, total)
     # add_event( restaurant, *members ) 
      #if @members.has_key( member )
        t = @members[member]
        t.spend( total )
        #else
        #add_member( member )
        #t = @members( member )
        #t.spend( total ) 
  end

end

binding.pry