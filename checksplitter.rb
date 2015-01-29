require 'pry'

#Quick version of Monday's homework

class CheckSplitter
  
  # Public: Inititalize
  # Sets initial values for CheckSplitter object
  #
  # Params:
  # + total : integer, total price (in dollars, rounded up)
  # + tip : integer, percentage to tip, e.g. 15% => 15
  # + party_size : how many people in your party?
  #
  # Returns:
  # nil
  #
  # State Changes:
  # Sets the three primary attribute variables  
  def initialize( total, tip, party_size )
    @total = total
    @tip = tip * 0.01
    @party_size = party_size
  end
  
  # Public: split_the_bill
  # Splits the bill evenly, then rounds up to the nearest dollar
  #
  # Params:
  # None
  #
  # Returns:
  # An integer amount representing how many dollars each person should contribute to the bill
  #
  # State Changes:
  # Nones
  
  def split_the_bill
    temp_total = 0
    if @party_size < 1
      @party_size = 1
    end

    temp_total = (@total * (1 + @tip)) / @party_size    
    temp_total.ceil.to_i
  end
end

#binding.pry