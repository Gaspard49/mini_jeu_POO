# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

loop do
system 'clear'
puts '=========================================================================='
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
puts "==========================================================================\n\n"

puts 'Enter your first name:'
print '>'
user_input = gets.chomp

user = HumanPlayer.new(user_input)
player1 = Player.new('Josiane')
player2 = Player.new('José')

enemies_array = [player1, player2]
system 'clear'
while user.life_points > 0 && (player1.life_points + player2.life_points) > 0
  user.show_state

  puts "What do you want to do?\n\n"
  puts 'a - search for a better weapon'
  puts "s - search for a health pack\n\n"
  puts 'Attack a player:'
  print '0 - '
  player1.show_state
  print '1 - '
  player2.show_state

  loop do
    puts "\n\nType your choice:"
    print '>'
    user_choice = gets.chomp

    system 'clear'

    if user_choice == 'a'
      user.search_weapon
      break
    elsif user_choice == 's'
      user.search_health_pack
      break
    elsif user_choice == '0'
      user.attacks(player1)
      break
    elsif user_choice == '1'
      user.attacks(player2)
      break
    else
      p 'Wrong input!'
    end
  end

  puts "\n\nPress Enter to continue"
  gets
  system 'clear'

  if (player1.life_points + player2.life_points).positive?
    puts 'The others players are attacking you!'
  end

  enemies_array.each do |enemy|
    next unless enemy.life_points.positive?

    enemy.attacks(user)
    puts 'Press Enter to continue'
    gets
    system 'clear'
  end
end

if user.life_points.positive?
  puts '##########################################################################'
  puts "
  ██╗   ██╗ ██████╗ ██╗   ██╗    ██╗    ██╗ ██████╗ ███╗   ██╗
  ╚██╗ ██╔╝██╔═══██╗██║   ██║    ██║    ██║██╔═══██╗████╗  ██║
   ╚████╔╝ ██║   ██║██║   ██║    ██║ █╗ ██║██║   ██║██╔██╗ ██║
    ╚██╔╝  ██║   ██║██║   ██║    ██║███╗██║██║   ██║██║╚██╗██║
     ██║   ╚██████╔╝╚██████╔╝    ╚███╔███╔╝╚██████╔╝██║ ╚████║
     ╚═╝    ╚═════╝  ╚═════╝      ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═══╝                                                           "

  puts '##########################################################################'
else
  puts '##########################################################################'
  puts "
  -|-
   |
   .-'~~~`-.
 .'         `.
 |  R  I  P  |
 |           |"
  print " | #{user.name}   |"
  print "
  |           |
  |           |
 ^^^^^^^^^^^^^^^^^^^^^^"
  puts '##########################################################################'
end
puts "\n\nWould you like to restart? (y/n)"
  restart = gets.chomp
  break if restart != 'y'
end