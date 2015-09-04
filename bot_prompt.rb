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
  	puts @bot.report
  when 'end'
  	exit
  else 
  	puts "Invalid command"
  end
    puts prompt
end
