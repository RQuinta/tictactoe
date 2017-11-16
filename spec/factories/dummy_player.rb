FactoryBot.define do
  factory :dummy_player, class: Model::Player::DummyPlayer do
    marker { Faker::Lorem.characters(1) }
    skip_create
    initialize_with { new(attributes) }
  end
end
