RSpec.describe Presenter::Space do

  let(:output) { StringIO.new }
  let(:smart_player) { FactoryBot.build(:smart_player) }
  let(:human_player) { FactoryBot.build(:human_player) }
  let(:dummy_player) { FactoryBot.build(:dummy_player) }

  describe "draw player class name" do
    context "smart_player" do
      it "draw player" do
        Presenter::Player.draw(output: output, player: smart_player)
        expect(output.string).to include 'Model::Player::SmartPlayer' + ' ' + smart_player.marker
      end
    end
    context "dummy_player" do
      it "draw player" do
        Presenter::Player.draw(output: output, player: dummy_player)
        expect(output.string).to include 'Model::Player::DummyPlayer' + ' ' + dummy_player.marker
      end
    end
    context "human_player" do
      it "draw player" do
        Presenter::Player.draw(output: output, player: human_player)
        expect(output.string).to include 'Model::Player::HumanPlayer' + ' ' + human_player.marker
      end
    end
  end

end
