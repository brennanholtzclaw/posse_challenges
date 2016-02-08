require 'pry'

class Initials

    def get_initials
      names = ARGV[0..-1]
      initials = names.map do |name|
        name[0]
      end
      puts initials.join
    end

end

Initials.new.get_initials
