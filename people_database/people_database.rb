require_relative 'person'
require 'pry'
class PeopleDatabase
attr_accessor :pd

  def initialize
    @pd = []
  end

  def add(person_details)
    @pd << Person.new(person_details)
    binding.pry
  end

end
a = PeopleDatabase.new
a.add(first_name: "Tess", last_name: "Griffin", email: "tess@turing.io", state: "CO")
a.add(first_name: "Teresa", last_name: "Griffith", email: "tgriff@turing.io", state: "CO")
