require_relative  'monster'
require_relative  'player'
require_relative  'quest'


class Battle
  def initialize(player, monster)
    @player = player
    @monster = monster
  end

  def start_battle
    puts "Battle begins! You encounter a #{@monster.name}."

    loop do
      player_turn
      break if battle_over?

      monster_turn
      break if battle_over?
    end
  end

  private

  def player_turn
    puts "\nYour turn!"
    puts "1. Attack"
    puts "2. Use Item"
    print "Choose your action (1/2): "
    action = gets.chomp.to_i

    case action
    when 1
      player_attack
    when 2
      use_item
    else
      puts "Invalid choice. Try again."
    end
  end

  def player_attack
    damage = rand(1..10) + @player.attack_power
    @monster.take_damage(damage)
    puts "You attack the #{@monster.name} for #{damage} damage!"
  end

  def use_item
    puts "Items:"
    # List predefined items that the player can use.
    predefined_items = [
      "Health Potion",
      "Mana Potion",
      "Revive Scroll"
      # Add more predefined items as needed
    ]

    # List the player's inventory items.
    inventory_items = @player.inventory

    all_items = predefined_items + inventory_items

    all_items.each_with_index do |item, index|
      puts "#{index + 1}. #{item}"
    end

    print "Choose an item to use (1/#{all_items.length}): "
    choice = gets.chomp.to_i

    if choice >= 1 && choice <= items.length
      item_to_use = items[choice - 1]
      case item_to_use
      when "Health Potion"
        # Implement logic to use a health potion and restore health.
        # Example: player.restore_health(50) # Restore 50 health points
        puts "You use a Health Potion and restore some health."
      when "Mana Potion"
        # Implement logic to use a mana potion and restore mana.
        # Example: player.restore_mana(30) # Restore 30 mana points
        puts "You use a Mana Potion and restore some mana."
      when "Revive Scroll"
        # Implement logic to use a revive scroll and revive a fallen character.
        # Example: player.revive_character(fallen_character)
        puts "You use a Revive Scroll to revive a fallen character."
      # Add more cases for other items as needed
      else
        puts "Unrecognized item: #{item_to_use}"
      end
    else
      puts "Invalid choice. Try again."
    end
  end

  def monster_turn
    puts "\n#{@monster.name}'s turn!"
    damage = rand(1..5) + @monster.attack_power
    @player.take_damage(damage)
    puts "#{@monster.name} attacks you for #{damage} damage!"
  end

  def battle_over?
    if @player.health <= 0
      puts "You were defeated. Game Over!"
      return true
    elsif @monster.health <= 0
      puts "You defeated the #{@monster.name}"
      return true
    end

    false
  end
end
