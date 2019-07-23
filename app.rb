require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
puts "=========================================================================="
puts "
███████╗██╗ ██████╗ ██╗  ██╗████████╗     ██████╗██╗     ██╗   ██╗██████╗ 
██╔════╝██║██╔════╝ ██║  ██║╚══██╔══╝    ██╔════╝██║     ██║   ██║██╔══██╗
█████╗  ██║██║  ███╗███████║   ██║       ██║     ██║     ██║   ██║██████╔╝
██╔══╝  ██║██║   ██║██╔══██║   ██║       ██║     ██║     ██║   ██║██╔══██╗
██║     ██║╚██████╔╝██║  ██║   ██║       ╚██████╗███████╗╚██████╔╝██████╔╝
╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝        ╚═════╝╚══════╝ ╚═════╝ ╚═════╝ 
"
puts "==========================================================================\n\n"

puts "                       WELCOME TO THE FIGHT CLUB!\n\n"
puts "    The first rule of Fight Club is: You do not talk about Fight Club.\n\n"

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "==========================================================================\n\n"

puts "Please welcome #{player1.name} and #{player2.name}!\n\n"

  
while player1.life_points.positive? && player2.life_points.positive? do
  puts "--------------------------------------------------------------------------\n\n"
  puts "The health points of each player:\n\n"
 
  player1.show_state  
  player2.show_state  

  puts "--------------------------------------------------------------------------\n\n"

  puts "Let's Fight!!\n\n"

  puts "--------------------------------------------------------------------------\n\n"

  player1.attacks(player2)#Jose attacks Josiane
  if player1.life_points.positive? && player2.life_points.positive?
    player2.attacks(player1)#Jose attacks Josiane
  end
end
