class Person
  
  attr_accessor :name, :spending_amount
  
  def initialize( name ) 
    
    @name = name
    @spending_amount=0
    
  end
  
  def spend( amt )
    @spending_amount += amt
  end
  
end