FactoryBot.define do
  factory :human_player, class: Model::Player::HumanPlayer do
    marker { Faker::Lorem.characters(1) }
    shell {
      TicTacToe.any_instance.stub(:get_coordinates).and_return(FactoryBot.build(:action))
      TicTacToe.new
    }
    skip_create
    initialize_with { new(attributes) }
  end
end
