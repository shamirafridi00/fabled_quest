class Quest
  attr_accessor :name, :description, :rewards, :completed

  def initialize(name, description, rewards)
    @name = name
    @description = description
    @rewards = rewards
    @completed = false
  end

  # Method to accept a quest
  def accept
    puts "You have accepted the quest: #{name}"
  end

  # Method to complete a quest
  def complete
    unless completed
      puts "Quest Completed: #{name}"
      @completed = true
      apply_rewards
    end
  end

  # Method to apply quest rewards
  def apply_rewards(player)
    puts "Quest Rewards:"
    rewards.each do |reward|
      case reward
      when :experience
        player.add_experience(100) # Example: Add 100 experience points
      when :health_potion
        player.add_to_inventory("Health Potion") # Example: Add a Health Potion to the player's inventory
      when :magic_sword
        player.add_to_inventory("Magic Sword")
      when :armor
        player.add_to_inventory("Armor")
      when :gold
        player.add_to_inventory("Gold")
      # for adding more cases for other rewards as needed
      else
        puts "Unrecognized reward: #{reward}"
      end
    end
  end

  # Method to track quest progress
  def status
    if completed
      puts "Quest Status: #{name} - Completed"
    else
      puts "Quest Status: #{name} - In Progress"
    end
  end
end
