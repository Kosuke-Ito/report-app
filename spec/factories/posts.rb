FactoryBot.define do
  factory :post do
    title { 'テストを書く' }
    content { 'RSpec&Capybara&Factorybotを準備する' }
    user
  end
end