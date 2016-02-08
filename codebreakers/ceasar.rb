require 'pry'

class Ceasar
  attr_reader :alphabet

  def initialize
    @alphabet = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  end

  def encrypt(key, message)
    message = message.join(" ").chars
    indicies = message.map do |char|
      @alphabet.find_index(char.downcase)
    end
    rotate(key.to_i, indicies)
  end

  def rotate(key, indicies)
    indicies.each do |num|
      binding.pry
      rotate = key + num
      @alphabet[rotate]
    end
  end

end

Ceasar.new.encrypt(ARGV[0], ARGV[1..-1])
