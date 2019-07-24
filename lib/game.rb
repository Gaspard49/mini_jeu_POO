# frozen_string_literal: true

require_relative 'player'

class Game < HumanPlayer #My Game
  attr_accessor :human_player, :players_left, :enemies_in_sight

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @enemies_in_sight = []
    i = 1
    4.times do
      @enemies_in_sight << Player.new("Bot#{rand(10..50)}")
      i += 1
    end
    @players_left = @enemies_in_sight.length
  end

  def kill_player
    @enemies_in_sight.each do |enemy|
      @enemies_in_sight.delete(enemy) if enemy.life_points <= 0
    end
  end

  def is_still_ongoing?
    true if @enemies_in_sight.any? == true && @human_player.life_points.positive?
  end

  def new_players_in_sight
    if players_left <= @enemies_in_sight.length
      puts "All the enemies are already in sight."
    else
      dice = rand(0..6)
      if dice == 1
        puts "No other enemy coming"
      elsif dice >= 2 && dice <= 4
        name = "Bot#{rand(10..50)}"
        @enemies_in_sight << Player.new(name)
        puts "Oh no! #{name} is in sight!"
      else
        name = "Bot#{rand(10..50)}"
        name2 = "Bot#{rand(10..50)}"
        @enemies_in_sight << Player.new(name)
        @enemies_in_sight << Player.new(name2)
        puts "Oh no! #{name} and #{name2} are in sight!"
      end
    end
  end

  def show_players
    @human_player.show_state
    puts "There is #{@enemies_in_sight.length} enemies left"
  end

  def menu
    puts "What do you want to do?\n\n"
    puts 'a - search for a better weapon'
    puts "s - search for a health pack\n\n"
    puts 'Attack a player:'
    i = 1
    @enemies_in_sight.each do |enemy|
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
      if user_choice >= 1 && user_choice <= @enemies_in_sight.length
        @human_player.attacks(@enemies_in_sight[user_choice - 1])
      else
        puts "\n\nWrong input! You passed your turn..."
      end
    end
    kill_player
  end

  def enemies_attack
    unless @enemies_in_sight.empty?
      puts "\n\nThe others players are attacking you!"
      puts "\n\nPress Enter to continue"
      gets
      system 'clear'
    end

    enemies_in_sight.each do |enemy|
      enemy.attacks(@human_player)
      puts "\n\nPress Enter to continue"
      gets
      system 'clear'
    end
  end

  def end
    if @human_player.life_points.positive? && @enemies_in_sight.empty?
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
