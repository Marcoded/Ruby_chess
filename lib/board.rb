#rubocop : disable all
# think about the direction they are moving
#castling
#pawn promototion
require_relative "piece"
require "colorize"
class Board
    attr_accessor :pieces_arr, :bg_color_1, :bg_color_2
    def initialize
        @bg_color_1 = "light_blue"
        @bg_color_2 = "light_white"
        @pieces_arr = []
        #set_up_pawns
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
            
            return piece if piece.position == arr   
        end
        return nil
    end

    def display
        x = 0
        y = 7
        color = @bg_color_2
        helper_arr = ["n1","n2","n3","n4","n5","n6","n7","n8"]
        helper_arr_index = [" 0"," 1"," 2"," 3"," 4"," 5"," 6"," 7"]
        8.times do
            color = alternate_board_color(color)
            
            
            print helper_arr[y]
            print helper_arr_index[y].green
            
            
            8.times do
                color = alternate_board_color(color)
                piece = find_piece(x,y)
                
                print "  #{piece.symbol}  ".colorize(:color => :black, :background => :"#{color}") unless piece.nil?
                print "     ".colorize(:color => :black, :background => :"#{color}") if piece.nil?
                
                x +=1
            end 
            puts ""
            x = 0
            y -= 1  
        end
        puts '      0    1    2    3    4    5    6    7'.green
        puts '      A    B    C    D    E    F    G    H'
         
    end

    def alternate_board_color(color)
        return @bg_color_1 if color == @bg_color_2
        return @bg_color_2 if color == @bg_color_1
    end

    
end









