require 'spec_helper'

RSpec.describe Model::Player::DummyPlayer, type: :model do

  let(:board) { FactoryBot.build(:board) }
  let(:player) { FactoryBot.build(:dummy_player) }

  describe '#new' do
    it "should own a marker" do
      expect(player.marker).to be
    end
    it "should return an action" do
      expect(player.choose_move(board: board)).to be_an(Model::Action)
    end
    it "should return an action with available space" do
      action = player.choose_move(board: board)
      expect(action.space.available?).to be_truthy
    end
  end

end
