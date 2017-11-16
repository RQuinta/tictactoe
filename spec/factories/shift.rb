FactoryBot.define do
  factory :shift, class: Model::Shift do
    players { create_list(:smart_player, 2) } 
    initialize_with { new(attributes) }
  end
end
