require 'spec_helper'

describe Deck do
  describe '#export' do
    let(:text) { create :text }
    let(:deck) { create :deck, text: text }

    let(:line1) { text.hanzi_line(1) }
    # 想說卻還沒說的 還很多
    let(:line2) { text.hanzi_line(2) }
    # 攢着是因為想寫成歌

    # Entry
    let(:meishuode)   { create :meishuode }
    let(:mei)         { create :mei }
    let(:mo)          { create :mo }
    let(:mei_entries) { [meishuode, mei, mo] }

    before(:all) do
      card1 = deck.cards.build \
        front: line1,
        back:  nil,
        line_num: 1

      # card2 = deck.cards.build \
      #   front: line1,
      #   back:  nil,
      #   line_num: 1

      # card3 = deck.cards.build \
      #   front: line2,
      #   back:  "Card #3 Note",
      #   line_num: 2

      exp_1_1 = card1.expressions.build \
        char_num: 1,
        entries:  mei_entries
      # exp_2_1 = card2.expressions.build \
      #   char_num: 1
      # exp_2_2 = card2.expressions.build \
      #   char_num: 1
      # exp_3_1 = card3.expressions.build \
      #   char_num: 1
    end

let(:anki_export_str) {
<<-anki
想說卻還沒說的 還很多\t#{meishuode.trad}<br>#{meishuode.simp}<br>#{meishuode.pron}<br>#{meishuode.glosses}<br><br>#{mei.trad}<br>#{mei.simp}<br>#{mei.pron}<br>#{mei.glosses}<br><br>#{mo.trad}<br>#{mo.simp}<br>#{mo.pron}<br>#{mo.glosses}
anki
}

    it 'exports to Anki format' do
      deck.export(:anki).should eq(anki_export_str)
    end
    # Deck
    #   Text
    #   Card 
    #     Expression
    #       Entry
  end
end














# let(:card1) { create(:card1) }
# let(:card2) { create(:card2) }
# let(:card3) { create(:card3) }

# let(:deck) { create :deck_with_text_and_user }
