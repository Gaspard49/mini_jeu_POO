# frozen_string_literal: true

require_relative 'player'

class Game < HumanPlayer #My Game
  attr_accessor :human_player, :enemies

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @enemies = []
    i = 1
    4.times do
      @enemies << Player.new("Bot#{i}")
      i += 1
    end
  end

  def kill_player
    @enemies.each do |enemy|
      @enemies.delete(enemy) if enemy.life_points <= 0
    end
  end

  def is_still_ongoing?
    true if @enemies.any? == true && @human_player.life_points.positive?
  end

  def show_players
    @human_player.show_state
    puts "There is #{@enemies.length} enemies left"
  end

  def menu
    puts "What do you want to do?\n\n"
    puts 'a - search for a better weapon'
    puts "s - search for a health pack\n\n"
    puts 'Attack a player:'
    i = 1
    @enemies.each do |enemy|
      print "#{i} -"
      enemy.show_state
      i += 1
    end
  end

  def menu_choice(user_choice)
    if user_choice == 'a'
      @human_player.search_weapon

    elsif user_choice == 's'
      @human_player.search_health_pack

    else
      user_choice = user_choice.to_i
      if user_choice >= 1 && user_choice <= @enemies.length
        @human_player.attacks(@enemies[user_choice - 1])
      else
        puts "\n\nWrong input! You passed your turn..."
      end
    end
    kill_player
  end

  def enemies_attack
    unless @enemies.empty?
      puts "\n\nThe others players are attacking you!"
      puts "\n\nPress Enter to continue"
      gets
      system 'clear'
    end

    enemies.each do |enemy|
      enemy.attacks(@human_player)
      puts "\n\nPress Enter to continue"
      gets
      system 'clear'
    end
  end

  def end
    if @human_player.life_points.positive? && @enemies.empty?
      puts '##########################################################################'
      puts "
      ██╗   ██╗ ██████╗ ██╗   ██╗    ██╗    ██╗ ██████╗ ███╗   ██╗
      ╚██╗ ██╔╝██╔═══██╗██║   ██║    ██║    ██║██╔═══██╗████╗  ██║
       ╚████╔╝ ██║   ██║██║   ██║    ██║ █╗ ██║██║   ██║██╔██╗ ██║
        ╚██╔╝  ██║   ██║██║   ██║    ██║███╗██║██║   ██║██║╚██╗██║
         ██║   ╚██████╔╝╚██████╔╝    ╚███╔███╔╝╚██████╔╝██║ ╚████║
         ╚═╝    ╚═════╝  ╚═════╝      ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═══╝                                                           "

      puts '##########################################################################'
    elsif @human_player.life_points == 0
      puts '##########################################################################'
      puts "
          -|-
           |
       .-'~~~`-.
     .'         `.
     |  R  I  P  |
     |           |"
      print "     | #{@human_player.name}   |"
      puts   "
     |           |
     |           |
     ^^^^^^^^^^^^^^^^^^^^^^"
      puts '##########################################################################'
    end
  end
end
