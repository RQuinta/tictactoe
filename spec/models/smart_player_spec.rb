require 'spec_helper'

RSpec.describe Model::Player::SmartPlayer, type: :model do

  let(:board) { FactoryBot.build(:board) }
  let(:player) { FactoryBot.build(:smart_player) }
  let(:dummy_player) { FactoryBot.build(:dummy_player) }
  let(:another_player) { FactoryBot.build(:smart_player) }
  let(:match) { FactoryBot.build(:match) }
  let(:another_match) { FactoryBot.build(:match, players: [player, dummy_player]) }

  describe '#new' do
    it "should own a marker" do
      expect(player.marker).to be
    end
    it "should return an action" do
      expect(player.choose_move(board: board, another_player: another_player)).to be_an(Model::Action)
    end
    it "should return an action with available space" do
      action = player.choose_move(board: board, another_player: another_player)
      expect(action.space.available?).to be_truthy
    end
    it "should tie against another smart_player" do
      match.take_turn until match.a_winner? || match.tied?
      expect(match.tied?).to be_truthy
    end
    it "should win against dummy_player" do
      another_match.take_turn until another_match.a_winner? || another_match.tied?
      expect(another_match.winner).to be player
    end
  end

end
