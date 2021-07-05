require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user_a) { FactoryBot.create(:user, name: 'yumayo', password: 'aaasss') }
  let(:post_a){ FactoryBot.build(:post, user: user_a, title: title, content: 'テストテストテスト')}

  describe 'validation' do
    context "値が正常に入力されている場合" do
      let(:title) {'タイトル１'}
      it "作成確認" do
        expect(post_a).to be_valid
      end
    end

    context "タイトルに値が入力されていない場合" do
      let(:title) {''}
      it "エラー" do
        expect(post_a).to be_invalid
      end
    end

    context "タイトルに値が５１文字以上の場合" do
      let(:title) {'123456789012345678901234567890123456789012345678901'}
      it 'エラー' do
        expect(post_a).to be_invalid
      end
    end

  end
end