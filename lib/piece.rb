# frozen_string_literal: true
#rubocop : disable all
require 'colorize'


class Bishop 

    attr_accessor :symbol, :arr_symbol, :color, :position

    @@move_set = [[1,1],[1,-1],[-1,-1],[-1,1]]
    @@arr_symbol = ["♗","♝"]

    def initialize(x,y,color,symbol_number)
        
        @color = color
        @position = [x,y]
        @symbol = @@arr_symbol[symbol_number]
    end
    
    

    
    def move?(destinationX, destinationY)
        puts " i'm moving"
    end
end

class Rook 
    attr_accessor :symbol, :arr_symbol, :color, :position

    @@move_set = [[0,1],[1,0],[-1,0],[0,-1]]
    @@arr_symbol = ["♖","♜"]

    def initialize(x,y,color,symbol_number)
        
        @color = color
        @position = [x,y]
        @symbol = @@arr_symbol[symbol_number]
    end
    

    
end

class Knight  #the knight can jump over piece
    attr_accessor :symbol, :arr_symbol, :color, :position

    @@move_set = [[2,1],[2,1],[-2,-1],[2,-1],]
    @@arr_symbol = ["♘","♞"]

    def initialize(x,y,color,symbol_number)
        
        @color = color
        @position = [x,y]
        @symbol = @@arr_symbol[symbol_number]
    end
    

    
end

class Queen 
    attr_accessor :symbol, :arr_symbol, :color, :position

    @@move_set = [[0,1],[1,0],[-1,0],[0,-1],[1,1],[1,-1],[-1,-1],[-1,1]] #Many times
    @@arr_symbol = ["♕","♛"]

    def initialize(x,y,color,symbol_number)
        
        @color = color
        @position = [x,y]
        @symbol = @@arr_symbol[symbol_number]
    end
    

   
end

class King 
    attr_accessor :symbol, :arr_symbol, :color,:position

    @@move_set = [[0,1],[1,0],[-1,0],[0,-1],[1,1],[1,-1],[-1,-1],[-1,1]] #just once
    @@arr_symbol = ["♕","♛"]

    def initialize(x,y,color,symbol_number)
        #puts "DEGUG KING, my symobl arr #{@@arr_symbol}"
        #puts "DEGUG KING, my color is #{@color}"
        @color = color
        @position = [x,y]
        @symbol = @@arr_symbol[symbol_number]
        #puts "duing kind creation, symbol selected was #{@symbol}"
    end
    

    
end

class Pawn  #Can move 2 if first move + Implement "en passant"
    # can transform to any piece
    attr_accessor :symbol, :arr_symbol, :color, :position

    @@move_set = [[0,1][0,2]]
    @@capture_move_set = [[1,1],[1,-1]]
    @@arr_symbol = ["♙","♟"]

    def initialize(x,y,color,symbol_number)
        
        @color = color
        @position = [x,y]
        @symbol = @@arr_symbol[symbol_number]
    end
    

    
end






