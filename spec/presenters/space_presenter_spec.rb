RSpec.describe Presenter::Space do

  let(:output) { StringIO.new }
  let(:space) { FactoryBot.build(:space) }
  let(:player) { FactoryBot.build(:smart_player) }

  describe "available space" do
    it "draw space" do
      Presenter::Space.draw(output: output, space: space)
      expect(output.string).to include '     '
    end
  end

  describe "taken space" do
    it "draw space" do
      space.choose(player: player)
      Presenter::Space.draw(output: output, space: space)
      expect(output.string).to include '  ' + space.marker + '  '
    end
  end

end
