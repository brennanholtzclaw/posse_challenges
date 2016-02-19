require_relative 'person'
require 'pry'
require 'faker'

class PeopleDatabase
attr_accessor :pd

  def initialize
    @pd = []
  end

  def add(person_details)
    @pd << Person.new(person_details)
  end

  def delete_by_email(email)
    @pd.delete_if do |person|
      person.email == email
    end
    puts @pd.count
  end

  def return_by_state(state)
    selection = @pd.select do |person|
      person.state == state
    end
    selection.each do |person|
      puts person.last_name
    end
    puts selection.count
  end

  def return_all_emails
    a = @pd.map do |person|
      person.email
    end.join(", ")
    puts a
  end

  def count_by_state(state)
    puts @pd.count {|person| person.state == state}
  end

end

pd = PeopleDatabase.new

pd.add(first_name: "Tess", last_name: "Griffin", email: "tess@turing.io", state: "CO")

5.times do
  pd.add(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, state: "CO")
end

5.times do
  pd.add(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, state: "MO")
end

puts "Loading in one known person, and 10 Faker entries"
puts @pd.all
puts "Delete an entry by email (tess@turing.io)"
pd.delete_by_email("tess@turing.io")
puts "Return all people in Colorado."
pd.return_by_state("CO")
puts "Return all fake e-mail addresses in the database."
pd.return_all_emails
puts "How many people are from Missouri?"
pd.count_by_state("MO")
