require 'pry'

class Person
  attr_accessor :first_name, :last_name, :email, :state

  def initialize(details)
    @first_name = details[:first_name]
    @last_name = details[:last_name]
    @email = details[:email]
    @state = details[:state]
  end
end
