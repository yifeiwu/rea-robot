require './bot'

prompt = "Robot awaits input, type END to exit"
puts prompt
@bot = Bot.new
while c=gets.chomp.downcase

  case c
  when /place (.+)/ #first placement
    x,y,f=($1.split(","))
    @bot.place(x.to_i,y.to_i,f.to_s)
  when 'move'
    @bot.move
  when 'left'
    @bot.left
  when 'right'
    @bot.right
  when 'report'
    unless @bot.report.nil?
      x, y, f = @bot.report
  	  puts "#{x},#{y},#{f}"
  	end
  when 'end'
  	exit
  end
end
