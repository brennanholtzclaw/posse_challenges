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

end
