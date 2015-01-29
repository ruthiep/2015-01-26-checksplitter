require 'pry'
require_relative 'CheckSplitter'
require_relative 'person'


#track members
#spending
#track outings
#let members treat



class DinnerClub
  
  attr_reader :members, :events

  def initialize
    @members = {}
    @events = {}
  end


  def add_member( member )
    @members[member] = Person.new ( member )
    @members
  end

  def show_members
    @members.each do |member, objs|
     puts member 
    end
    @members
  end
  
  def remove_member( member )
    @members.delete(member)
    @members
  end
  
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
  
  def get_spending_report( member )
    @members[member]
  end
  
  def add_event( restaurant, *member )
    @events[restaurant] = *member
    puts @events
  end
  
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