class Monster
  attr_accessor :name, :health, :attack_power

  def initialize(name, health, attack_power)
    @name = name
    @health = health
    @attack_power = attack_power
  end

  # Method to perform a monster attack

  def attack(player)
    damage = rand(1..@attack_power)
    player.take_damage(damage)
    puts "#{@name} attacks #{player.name} for #{damage} damage!"
  end
end
