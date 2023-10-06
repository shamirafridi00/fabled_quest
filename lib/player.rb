class Player

  attr_accessor :name, :health, :attack_power, :inventory

  def initialize
    @name = name
    @health = 100
    @attack_power = 10
    @inventory = []
  end

  # Method to display the player status
  def display_status
    puts "#{@name}'s Status"
    puts "Health: #{@health}"
    puts "Attack Power: #{@attack_power}"
    puts "Inventory: #{@inventory.join(', ')}"
  end

  # Method to perform an attack
  def attack(target)
    damange = rand(1..@attack_power)
    target.take_damage(damange)
    puts "#{@name} attacks #{target.name} for #{damange} damage!"
  end

  # Method to take damage
  def take_damage(damage)
    @health -= damage
    @health = 0 if @health < 0  # this if statement is to prevent negative health if health goes below zero it sets to 0 again
    puts "#{@name} takes #{damage} damage!"
  end


  def add_experience(experience_points)
    @experience += experience_points
    puts "#{name} gains #{experience_points} experience points!"
  end


  # Method to add an item to the inventory
  def add_to_inventory(item)
    @inventory << item
    puts "#{@name} obtains #{item.name}"
  end
end
