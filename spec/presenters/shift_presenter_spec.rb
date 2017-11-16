RSpec.describe Presenter::Space do

  let(:output) { StringIO.new }
  let(:shift) { FactoryBot.build(:shift) }

  describe "smart_player" do
    it "draw shift" do
      Presenter::Shift.draw(output: output, shift: shift)
      expect(output.string).to include 'Jogador do turno: '
    end
  end

end
