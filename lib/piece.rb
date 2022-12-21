# frozen_string_literal: true
#rubocop : disable all
require 'colorize'

#Move? does not return true if the move is a take



module OnBoard
    def on_board?(x,y)
        on_board = false
        on_board = true if x.between?(0,7) && y.between?(0,7)
        return on_board
    end

    def on_board2?(position)
        position[0].between?(0, 7) && position[1].between?(0, 7)
    end
end

class Bishop 
    include OnBoard
    attr_accessor :symbol, :arr_symbol, :color, :position

    @@move_set = [[1,1],[1,-1],[-1,-1],[-1,1]]
    @@arr_symbol = ["♗","♝"]

    def initialize(x,y,color,symbol_number)
        
        @color = color
        @position = [x,y]
        @symbol = @@arr_symbol[symbol_number]
    end

    def move?(board_obj, destinationX,destinationY)
        found = false
        mooves = @@move_set
        x,y = @position[0],@position[1]
        mooves.each do |move|
            loop do
                x += move[0]
                y += move[1]
                break if on_board?(x,y) == false
                break if board_obj.find_piece(x,y) != nil
                found = true if x == destinationX && y == destinationY
            end
            x,y = @position[0],@position[1] 
        end
        puts "i'm a #{@color} #{self.class.name}, trying to move from #{@position} to [#{destinationX},#{destinationY}]"
        puts found
        return found

    end

    def take?(board_obj, destinationX,destinationY)
        found = false
        mooves = @@move_set
        x,y = @position[0],@position[1]
        mooves.each do |move|
            loop do
                x += move[0]
                y += move[1]
                break if on_board?(x,y) == false
                if board_obj.find_piece(x,y) != nil
                    piece = board_obj.find_piece(x,y)
                    break if piece.color == @color
                end
                
                found = true if x == (destinationX && y == destinationY) && piece.color != @color
            end
            x,y = @position[0],@position[1] 
        end
        puts "i'm a #{@color} #{self.class.name}, trying to take from #{@position} to [#{destinationX},#{destinationY}]"
        puts found
        return found

        
    end
    
end

class Rook
    include OnBoard
    attr_accessor :symbol, :arr_symbol, :color, :position

    @@move_set = [[0,1],[1,0],[-1,0],[0,-1]]
    @@arr_symbol = ["♖","♜"]

    def initialize(x,y,color,symbol_number)
        
        @color = color
        @position = [x,y]
        @symbol = @@arr_symbol[symbol_number]
    end

    def move?(board_obj, destinationX,destinationY)
        found = false
        mooves = @@move_set
        x,y = @position[0],@position[1]
        mooves.each do |move|
            loop do
                x += move[0]
                y += move[1]
                break if on_board?(x,y) == false
                break if board_obj.find_piece(x,y) != nil
                found = true if x == destinationX && y == destinationY
            end
            x,y = @position[0],@position[1] 
        end
        puts "i'm a #{@color} #{self.class.name}, trying to move from #{@position} to [#{destinationX},#{destinationY}]"
        puts found
        return found

    end

    def take?(board_obj, destinationX,destinationY)
        found = false
        mooves = @@move_set
        x,y = @position[0],@position[1]
        mooves.each do |move|
            loop do
                x += move[0]
                y += move[1]
                break if on_board?(x,y) == false
                if board_obj.find_piece(x,y) != nil
                    piece = board_obj.find_piece(x,y)
                    break if piece.color == @color
                end
                
                found = true if x == (destinationX && y == destinationY) && piece.color != @color
            end
            x,y = @position[0],@position[1] 
        end
        puts "i'm a #{@color} #{self.class.name}, trying to take from #{@position} to [#{destinationX},#{destinationY}]"
        puts found
        return found

        
    end
end

class Knight  #the knight can jump over piece
    include OnBoard
    attr_accessor :symbol, :arr_symbol, :color, :position

    @@move_set = [[2,1],[2,-1],[-2,-1],[-2,1],[1,2],[1,-2],[-1,2],[-1,-2]]
    @@arr_symbol = ["♘","♞"]

    def initialize(x,y,color,symbol_number)
        
        @color = color
        @position = [x,y]
        @symbol = @@arr_symbol[symbol_number]
    end

    def move?(board_obj, destinationX,destinationY)
        possible_mooves = @@move_set.map {|move|[@position[0] + move[0], @position[1] + move[1]]}
        possible_mooves.keep_if{|pos| on_board2?(pos)}
        possible_mooves.keep_if{|pos| board_obj.find_piece(pos[0],pos[1]) == nil}
        possible_mooves.keep_if{|pos| pos[0] == destinationX && pos[1] == destinationY}
        return false if possible_mooves.empty?
        true
    end

    
    
    def take?(board_obj,destinationX,destinationY)
        possible_mooves = @@move_set.map {|move|[@position[0] + move[0], @position[1] + move[1]]}
        possible_mooves.keep_if{|pos| on_board2?(pos)}
        possible_mooves.keep_if{|pos| board_obj.find_piece(pos[0],pos[1])}
        possible_mooves.keep_if{|pos| board_obj.find_piece(pos[0],pos[1]).color !=@color}
        possible_mooves.keep_if{|pos| pos[0] == destinationX && pos[1] == destinationY}
        
        return true if possible_mooves
        false
    end
    

    
end

class Queen
    include OnBoard
    attr_accessor :symbol, :arr_symbol, :color, :position

    @@move_set = [[0,1],[1,0],[-1,0],[0,-1],[1,1],[1,-1],[-1,-1],[-1,1]] #Many times
    @@arr_symbol = ["♕","♛"]

    def initialize(x,y,color,symbol_number)
        
        @color = color
        @position = [x,y]
        @symbol = @@arr_symbol[symbol_number]
    end

    def move?(board_obj, destinationX,destinationY)
        found = false
        mooves = @@move_set
        x,y = @position[0],@position[1]
        mooves.each do |move|
            loop do
                x += move[0]
                y += move[1]
                break if on_board?(x,y) == false
                break if board_obj.find_piece(x,y) != nil
                found = true if x == destinationX && y == destinationY
            end
            x,y = @position[0],@position[1] 
        end
        puts "i'm a #{@color} #{self.class.name}, trying to move from #{@position} to [#{destinationX},#{destinationY}]"
        puts found
        return found

    end

    def take?(board_obj, destinationX,destinationY)
        found = false
        mooves = @@move_set
        x,y = @position[0],@position[1]
        mooves.each do |move|
            loop do
                x += move[0]
                y += move[1]
                break if on_board?(x,y) == false
                if board_obj.find_piece(x,y) != nil
                    piece = board_obj.find_piece(x,y)
                    break if piece.color == @color
                end
                
                found = true if x == (destinationX && y == destinationY) && piece.color != @color
            end
            x,y = @position[0],@position[1] 
        end
        puts "i'm a #{@color} #{self.class.name}, trying to take from #{@position} to [#{destinationX},#{destinationY}]"
        puts found
        return found

        
    end
    

   
end

class King
    include OnBoard
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







