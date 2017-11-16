FactoryBot.define do
  factory :match, class: Model::Match do
    players { create_list(:smart_player, 2) } 
    initialize_with { new(attributes) }
  end
end
