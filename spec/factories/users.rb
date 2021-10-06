FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'a1' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    first_name              {'山田'}
    first_name_huri          {'ヤマダ'}
    last_name                {'太郎'}
    last_name_huri           {'タロウ'}
    birthday                 {Faker::Date.between(from: '2014-09-23', to: '2014-09-25')}
  end
end

