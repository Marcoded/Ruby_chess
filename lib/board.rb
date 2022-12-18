#rubocop : disable all
# think about the direction they are moving
#castling
#pawn promototion
require_relative "piece"
require "colorize"
class Board
    attr_accessor :pieces_arr
    def initialize
        @pieces_arr = []
        set_up_pawns
        set_up_other_pieces
    end

    def set_up_pawns
        x = 0
        8.times do
            pawn = Pawn.new(x,1,"white",0)
            @pieces_arr.push(pawn)
            x +=1
        end
        x = 0
        8.times do
            pawn = Pawn.new(x,6,"black",1)
            @pieces_arr.push(pawn)
            x +=1
        end
    end

    def set_up_other_pieces
        
        white_pieces_order = [Rook.new(0,0,"white",0),Knight.new(1,0,"white",0),Bishop.new(2,0,"white",0),Queen.new(3,0,"white",0),King.new(4,0,"white",0),Bishop.new(5,0,"white",0),Knight.new(6,0,"white",0),Rook.new(7,0,"white",0)]
        black_pieces_order = [Rook.new(0,7,"black",1),Knight.new(1,7,"black",1),Bishop.new(2,7,"black",1),Queen.new(3,7,"black",1),King.new(4,7,"black",1),Bishop.new(5,7,"black",1),Knight.new(6,7,"black",1),Rook.new(7,7,"black",1)]
        white_pieces_order.each do |piece|
            piece
            @pieces_arr.push(piece)
        end
        black_pieces_order.each do |piece|
            piece
            @pieces_arr.push(piece)
        end
    end

    def find_piece(x,y)
        arr = [x,y]
        @pieces_arr.each do |piece|
            puts "DEGUG, FOUND IT #{piece.position} #{piece.symbol}" if piece.position == arr
            return piece if piece.position == arr
            
        end
    end

    
end

b = Board.new
a_piece = b.find_piece(0,7)






