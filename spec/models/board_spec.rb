require 'spec_helper'

RSpec.describe Model::Board, type: :model do

  let(:board) { FactoryBot.build(:board) }
  let(:player) { FactoryBot.build(:smart_player) }
  let(:another_player) { FactoryBot.build(:smart_player) }

  describe '#new' do
    it "should initialize 3x3 matrix" do
      expect(board.spaces.size).to be 9
    end
    it "should initialize space matrix" do
      expect(board.spaces.first).to be_an(Model::Space)
    end
    it "should initialize 3 columns matrix" do
      expect(board.columns.size).to be 3
    end
    it "should initialize 3 rows matrix" do
      expect(board.rows.size).to be 3
    end
    it "should initialize not tied " do
      expect(board.tied?).to be_falsey
    end
    it "should initialize with 9 spaces available " do
      expect(board.available_spaces.size).to be 9
    end
    it "should initialize without been conquered " do
      expect(board.conquered_by?(player: player)).to be_falsey
    end
  end

  describe 'with one taked space' do
    it "must contain 8 spaces available " do
      action = Model::Action.new(performer: player, space: board.spaces.first)
      action.apply
      expect(board.available_spaces.size).to be 8
    end
    it "should stay without been conquered " do
      action = Model::Action.new(performer: player, space: board.spaces.first)
      action.apply
      expect(board.conquered_by?(player: player)).to be_falsey
    end
  end

  describe '9 spaces ocupied' do
    it "should initialize not tied " do
      # 4.times do
      #   [player, another_player].each do |p|
      #     action = Model::Action.new(performer: p, space: board.spaces.sample)
      #     action.apply
      #   end
      # end
      # expect(board.tied?).to be_truthy
    end

  end

end
