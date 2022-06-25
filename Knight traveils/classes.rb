class MovesNodes
    
    POSSIBLE_MOVES = [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[1,-2],[-1,-2],[-1,2]]
    @@trace_record=[] 

    attr_accessor :previous_position, :position

    def initialize(position,previous_position=nil)
        @position = position
        @previous_position = previous_position
        @@trace_record.push(@position)
    end
        
    def self.valid_move(position)
        position[0].between?(1,8) && position[1].between?(1,8)
    end

    def display_previous(node)
        display_previous(node.previous_position) unless previous_position.nil?
    end

    
end

