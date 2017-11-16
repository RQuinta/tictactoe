FactoryBot.define do
  factory :smart_player, aliases: [:performer], class: Model::Player::SmartPlayer do
    marker { Faker::Lorem.characters(1) }
    skip_create
    initialize_with { new(attributes) }
  end
end
