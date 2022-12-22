require "Set"

class MontyHallImitation
  def initialize
  end

  def won?(choice_changed)
    vehicle_location = rand(0...DOOR_NUM)
    player_choice = rand(0...DOOR_NUM)
    host_choice = 
      Set.new(SPACE)
        .delete(vehicle_location)
        .delete(player_choice)
        .to_a
        .sample
    last_door = 
      Set.new(SPACE)
        .delete(host_choice)
        .delete(player_choice)
        .to_a
        .sample 
    final_choice = choice_changed ? last_door : player_choice

    vehicle_location == final_choice
  end

  def events_ratio(iter_num, choice_changed)
    (1..iter_num).reduce { |acc, i|
      won?(choice_changed) ? acc.next : acc
    } / iter_num.to_f
  end

  private
  
  DOOR_NUM = 3
  SPACE = (0...DOOR_NUM).to_a.freeze
end