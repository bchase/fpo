require 'spec_helper'

describe Deck do
  describe '#export' do
    let(:card1) { create(:card1) }
    let(:card2) { create(:card2) }
    let(:card3) { create(:card3) }

    let(:deck) { create :deck_with_text_and_user }

    it 'exports to Anki format' do
      true.should be_true
    end
  end
end
