class Bot
  attr_reader :position
  def initialize
  	#@faces stores the names of the direction
  	@faces = %w(north east south west) 
    #Translate directions into unit vectors
	@x_hat = [0, 1, 0, -1] 
	@y_hat = [1, 0, -1, 0]
	@position =[nil,nil,nil]
  end

  def place(x,y,f)
  	begin
      if valid_position?(x,y,f)
        @x = x
        @y = y
        @f_index = @faces.index(f)
        set_position
      end
    rescue ArgumentError => e
      puts "Wrong # of args"
    end
  end

  def left
  	if valid_position?(*@position)
  	  @f_index=(@f_index-1)%4
  	  set_position
  	end
  end
  
  def right
  	if valid_position?(*@position)
  	  @f_index=(@f_index+1)%4
  	  set_position
  	end
  end
	
  def move
	#movement in x is move_units*x_component of facing direction
    if valid_position?(*@position) #if placed
      dx = @x_hat[@f_index]
	  dy = @y_hat[@f_index]

	  test_x = @x+dx
	  test_y = @y+dy
		
	  if valid_position?(test_x,test_y,@faces[@f_index]) #if move valid
	    @x = test_x
		@y = test_y
        set_position
      end
    end
  end

  def report 
    if valid_position?(*@position) 
      @position
    end
  end  

  private

  def set_position
  	@position = [@x, @y, @faces[@f_index]]
  end

  def valid_position?(x,y,f_index)
  	#args are within bounds and bot has already been placed
  	if (0..4) ===x && (0..4)===y && @faces.index(f_index) && !x.nil?
  	  true
  	end
  end

end
