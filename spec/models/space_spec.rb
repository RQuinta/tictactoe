describe 'Space' do

    context 'when request is invalid' do
      it 'fails with invalid Grant Type' do
        space = build(:space)
        expect(space.taken?).to eq(false)
      end

  end
end
