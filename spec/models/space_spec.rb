require 'spec_helper'

RSpec.describe Model::Space, type: :model do

  let(:space) { FactoryBot.build(:space) }
  let(:player) { FactoryBot.build(:smart_player) }
  let(:another_player) { FactoryBot.build(:smart_player) }
  let(:diagonal_space) { FactoryBot.build(:space, row: 1, column: 1) }
  let(:border_space) { FactoryBot.build(:space, row: 0, column: 1) }

  describe '#new' do
    it "should initialize without a marker" do
      expect(space.marker).to be_nil
    end
    it "must initialize available" do
      expect(space.available?).to be_truthy
    end
    it "must not initialize taken" do
      expect(space.taken?).to be_falsey
    end
    it "must initialize without marker" do
      expect(space.marker).to be nil
    end
    it "should choose player" do
      expect(space.choose(player: player)).to be player
    end

    context 'row 1, column 1' do
      it "must be diagonal" do
        expect(diagonal_space.diagonal?).to be_truthy
      end
      it "must be secondary_diagonal" do
        expect(diagonal_space.secondary_diagonal?).to be_truthy
      end
    end

    context 'row 0, column 1' do
      it "must be diagonal" do
        expect(border_space.diagonal?).to be_falsey
      end
      it "must be secondary_diagonal" do
        expect(border_space.secondary_diagonal?).to be_falsey
      end
    end

    context 'with player seted' do
      it "must not be available" do
        space.choose(player: player)
        expect(space.available?).to be_falsey
      end
      it "must be taken" do
        space.choose(player: player)
        expect(space.taken?).to be_truthy
      end
      it "must be owned_by" do
        space.choose(player: player)
        expect(space.owned_by?(player: another_player)).to be_falsey
      end
      it "must not be owned_by another_player" do
        space.choose(player: player)
        expect(space.owned_by?(player: player)).to be_truthy
      end
      it "must have the same player mark" do
        space.choose(player: player)
        expect(space.marker).to be player.marker
      end
      it "must be taken" do
        space.choose(player: player)
        expect(space.taken?).to be_truthy
      end
      it "must unchoose player" do
        space.choose(player: player)
        expect(space.unchoose).to be nil
      end
    end

  end

end
