require 'rails_helper'

RSpec.describe PostsController, type: :request do
  let!(:user_a) { FactoryBot.create(:user, name: 'yumayo', password: 'password') }

  describe 'POST #create' do
    before do
      post login_path,  params: {name: 'yumayo', password: 'password'}
    end

    it "ポストが作成される" do
      post posts_path, params: {post: {title: 'test', content: 'aaaaaaa', user: user_a, date_type: '', status: ''}}
      expect(response.status).to eq 200
    end
  end
end