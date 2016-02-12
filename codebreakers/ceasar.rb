require 'pry'

class Ceasar
  attr_reader :alphabet

  def initialize
    @alphabet = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
    @result = []
  end

  def encrypt(key, message)
    indicies = []
    message.each do |word|
      word.chars.each { |char| indicies << index_value(char) }
      indicies << " "
    end
    rotate(key.to_i, indicies)
  end

  def index_value(char)
    alphabet.find_index(char.downcase)
  end

  def rotate(key, indicies)
    indicies.each do |num|
      if num == " "
        @result << " "
      else
        rotate = key + num
        @result << @alphabet[rotate]
      end
    end
    puts @result.join.chop
  end

end

Ceasar.new.encrypt(ARGV[0], ARGV[1..-1])
