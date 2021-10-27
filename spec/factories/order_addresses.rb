FactoryBot.define do
  factory :order_address do
  
        post_number { '123-4567' }
        area_id { 2 }
        city { '東京都' }
        house_num { '30' }
        building_name { '東京ハイツ' }
        phone_number {'0901234567'}
        token {"tok_abcdefghijk00000000000000000"}
      end
    end
 