# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    physical_location "MyString"
    place "MyString"
    mood "MyString"
    took_place_at "2013-09-11 21:14:17"
    positive_activity "MyString"
  end
end
