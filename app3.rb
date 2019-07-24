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

  my_game = Game.new(user_input)

  system 'clear'

  while my_game.is_still_ongoing?
    my_game.show_players
    my_game.new_players_in_sight
    my_game.menu

    puts "\n\nType your choice:"
    print '>'
    user_choice = gets.chomp

    system 'clear'

    my_game.menu_choice(user_choice)

    puts "\n\nPress Enter to continue"
    gets
    system 'clear'

    my_game.enemies_attack

    my_game.end
    end

  puts "\n\nWould you like to restart? (y/n)"
  restart = gets.chomp
  break if restart != 'y'
end
