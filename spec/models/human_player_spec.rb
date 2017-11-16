require 'spec_helper'

RSpec.describe Model::Player::HumanPlayer, type: :model do

  let(:board) { FactoryBot.build(:board) }
  let(:player) { FactoryBot.build(:human_player) }

  describe '#new' do
    it "should own a marker" do
      expect(player.marker).to be
    end
    it "should return an action" do
      expect(player.choose_move(board: board)).to be_an(Model::Action)
    end
  end

end
