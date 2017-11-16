require 'spec_helper'

RSpec.describe Model::Action, type: :model do

  let(:action) { FactoryBot.build(:action) }

  describe '#new' do
    it "should set performer as space owner" do
      expect(action.apply).to be action.performer
    end

  end

end
