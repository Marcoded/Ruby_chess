require 'colorize'
puts "hello".red

class Piece
    attr_accessor :color, :position, :symbol
    def initialize(x,y,color)
        @color = color
        @position = [x,y]
        @symbol = nil

    end
end

class Bishop

    def initialize
        
    end
    def move?(destinationX, destinationY)
end