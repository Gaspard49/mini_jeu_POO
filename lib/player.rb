# frozen_string_literal: true

class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    if @life_points .positive?
      puts "#{@name} have #{@life_points} hp left"
    else
      @life_points = 0
      puts "#{@name} is dead!\n\n\n"
    end
  end

  def gets_damage(damage_points)
    if @life_points .positive?
      @life_points -= damage_points
      puts "#{@name} lost #{damage_points} hp"
    end
    show_state
  end

  def attacks(attacked_player)
    puts "\n\n#{@name} turn\n\n"
    puts "#{@name} attack #{attacked_player.name}"
    damage = compute_damage
    puts "#{@name} inflict #{damage} hp damage to #{attacked_player.name}"
    attacked_player.gets_damage(damage)
  end

  def compute_damage
    rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level, :life_points

  def initialize(name)
    @weapon_level = 1 # j'ai rajouté cette ligne
    super(name)
    @life_points = 100 # fait appel au initialize de la classe Player
  end

  def show_state
    if @life_points > 0
      puts "\n\nYou have #{@life_points} hp left and your weapon level is #{weapon_level}.\n\n\n\n"
    else @life_points = 0
      puts "\n\nYou have 0 hp left\n\n"
      puts "You are dead!\n\n\n"
    end
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    dice = rand(1..6)
    puts "\n\nYou found a level #{dice} weapon"
    if dice > @weapon_level
      @weapon_level = dice
      puts 'Yeah! This one is more powerful than your current weapon, you take it!'
    else
      puts "Motherf@*#{$INPUT_LINE_NUMBER}.. This one is less powerful than your current weapon... "
    end
  end

  def search_health_pack
    dice = rand(1..6)
    if dice == 1
      puts "\n\nYou found nothing..."
    elsif dice >= 2 && dice <= 5
      @life_points += 50
      puts "\n\nWell done! you found a pack of +50 hv"
    else
      @life_points += 80
      puts "\n\nWell done! you found a pack of +80 hv"
    end
    @life_points = 100 if @life_points > 100
    puts "Your life is now of #{@life_points}"
  end
end
