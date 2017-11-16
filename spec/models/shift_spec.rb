require 'spec_helper'

RSpec.describe Model::Space, type: :model do

  let(:shift) { FactoryBot.build(:shift) }

  describe '#new' do
    it "should initialize with current_player" do
      expect(shift.current_player).to be
    end
    it "must initialize with another_player" do
      expect(shift.next_player).to be
    end
    it "should switch current_player and another_player" do
      previous_current_player = shift.current_player
      previous_next_player = shift.next_player
      shift.next
      expect(shift.current_player).to be previous_next_player
      expect(shift.next_player).to be previous_current_player
    end
  end

end
