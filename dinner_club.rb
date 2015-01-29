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
# @member          - Hash: the names of the diners and their person object.
# @events          - Hash: the name of the restaurant and who attended each event. 
#
# Public Methods:
# #add_member
# #show_members
# #remove_member
# #have_an_outing
# #show_spending_report
# #add_event
# #treat
# 

class DinnerClub
  
  attr_reader :members, :events

  def initialize
    @members = {}
    @events = {}
  end

  # Public: #add_member
  # Adds members to the hash.
  #
  # Parameters:
  # member     - String: name of key to be added.
  # @members   - Hash:  creates a new Person obj to be the value for the member key.
  #
  #
  # Returns:
  # @members.
  #
  # State changes:
  # adds to @members
   
  def add_member( member )
    @members[member] = Person.new ( member )
    @members
  end

  # Public: #show_members
  # Displays the @members hash.
  #
  # Parameters:
  # member   - String: name of the member--hash key.
  # objs     - Object:  the corresponding hash value.
  #
  #
  # Returns:
  # @members: The completed hash.
  #
  # State changes:
  # adds to @members
   

  def show_members
    @members.each do |member, objs|
     puts member 
    end
    @members
  end
  
  # Public: #remove_member
  # Removes a member from the @members hash.
  #
  # Parameters:
  # member    - String: name of individual member to remove.
  # @members  - Hash:  the array to be populated.
  #
  #
  # Returns:
  # @members: The completed hash.
  #
  # State changes:
  # adds to @members
   
  
  def remove_member( member )
    @members.delete(member)
    @members
  end
  
  # Public: #have_an_outing
  # Creates a new CheckSplitter obj so that the members who attended and their spending amount can be recorded.
  #
  # Parameters:
  # total     - String: name input from user.
  # tip       - Float: the percent tip amount.
  # *diners   - splat Array:  a list of members to add the spending amount to their person obj.
  #
  #
  # Returns:
  # @members: The completed hash.
  #
  # State changes:
  # adds to @members
   
  
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
  
  # Public: #get_spending_report
  # Gets the hash of members and their current balances.
  #
  # Parameters:
  # member   - String: name of the key for the @members hash.
  #
  #
  # Returns:
  # @members: The completed array.
  #
  # State changes:
  # adds to @members
   
  def get_spending_report( member )
    @members[member]
  end
  
  # Public: #add_event
  # Adds a new outing to the @events hash.
  #
  # Parameters:
  # restaurant   - String: name of the restaurant where they ate on that event.
  # *members     - splat Array:  a list of the members who attended that event.
  #
  #
  # Returns:
  # @events: The completed hash.
  #
  # State changes:
  # adds to @events
   
  
  def add_event( restaurant, *member )
    @events[restaurant] = *member
    puts @events
  end
  
  
  # Public: #treat
  # Allows one member to pay the total bill.
  #
  # Parameters:
  # treater     - String: name of person who is paying.
  # total       - Integer:  the amount of the total bill for an event.
  # restaurant  - String: the location of the outing.
  # *member     - Array:  list of all the other members who went, but didn't have to pay.
  #
  # Returns:
  # @members :  The updated @members hash.
  #
  # State changes:
  # @members: the treater's spending total is increased by total amount.
  # @events:  all the members who went are recorded for the event.
   
  
  def treat (treater, total, restaurant, *member)
     
        t = @members[treater] 
        t.spend( total )
        puts @members
        
        add_event( restaurant, *member )
  end

end

binding.pry