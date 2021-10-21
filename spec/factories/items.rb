FactoryBot.define do
  factory :item do
    item_name        {Faker::Name.initials(number: 5)}
    title            {Faker::Name.initials(number: 50)}
    delivery_fee_id  {2}
    category_id      {5}
    status_id        {2}
    area_id          {2}
    period_id        {2}
    place            {Faker::Number.number(digits: 4)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/sample1.png'), filename: 'sample1.png')
    end
  end
end
