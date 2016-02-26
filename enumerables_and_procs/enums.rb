class Enums

  def self.any?(collection, condition)
    result = false
    collection.each do |elem|
      result = true if condition.call(elem)
    end
    result
  end

  def self.select(collection, condition)
    result = []
    collection.each do |elem|
      result << elem if condition.call(elem)
    end
    result
  end

  def self.reduce(collection, condition)
    result = []
    collection.each do |elem|
      result << condition.call(elem)
    end
    result
  end

  def self.reject(collection, condition)
    result = []
    collection.each do |elem|
      result << elem unless condition.call(elem)
    end
    result
  end

  def self.zip(col1, col2)
    result = []
    col1.each_with_index do |elem, index|
      result << [elem, col2[index]]
    end
    result
  end
end

# require './enums'
#
# puts "********ANY?***********"
# puts "collection = [1, 2, 3, 4, 5]"
# collection = [1, 2, 3, 4, 5]
# puts "condition = Proc.new { |a| a > 6 }"
# condition = Proc.new { |a| a > 6 }
# puts "Expected to return false"
# Enums.any?(collection, condition)
#
#
# puts "********SELECT**********"
# puts "collection = [1, 2, 3, 4, 5]"
# collection = [1, 2, 3, 4, 5]
# puts "condition = Proc.new { |a| a % 2 == 0 }"
# condition = Proc.new { |a| a % 2 == 0 }
# puts "Expected to return '[2, 4]'"
# Enums.select(collection, condition)
#
#
# puts "**********REDUCE*********"
# puts "collection = [\"Rachel\", \"Joanne\", \"Nate\"]"
# collection = ["Rachel", "Joanne", "Nate"]
# puts "condition = Proc.new { |a| \"#{a} works at Turing.\" }"
# condition = Proc.new { |a| "#{a} works at Turing." }
# puts "Expected to return [\"Rachel works at Turing.\", \"Joanne works at Turing.\", \"Nate works at Turing.\"]"
# Enums.reduce(collection, condition)
#
#
# puts "***********REJECT*********"
# puts "collection = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]"
# collection = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# puts "condition = Proc.new { |a| a % 2 != 0 }"
# condition = Proc.new { |a| a % 2 != 0 }
# puts "Expected to return [2, 4, 6, 8, 10]"
# Enums.reject(collection, condition)
#
#
# puts "*********EXTENSION: ZIP***********"
# puts "col1 = [1, 2, 3, 4, 5]"
# col1 = [1, 2, 3, 4, 5]
# puts "col2 = [6, 7, 8, 9, 0]"
# col2 = [6, 7, 8, 9, 0]
# puts "Expected to return [[1, 6], [2, 7], [3, 8], [4, 9], [5, 0]]"
# a = Enums.zip(col1, col2)
