FactoryBot.define do
  factory :task do
    name { 'テストを書く' }
    description { 'systemテスト' }
    user
  end
end
