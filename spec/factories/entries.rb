# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    user { FactoryGirl.create :user }
    physical_location { ['forehead', 'right temple', 'behind right ear'].sample }
    place { ['bathroom', 'mirror', 'desk'].sample }
    mood { ['tired', 'focused', 'annoyed'].sample }
    took_place_at { Time.at(Time.now.to_i - [*0..86400].sample) }
    positive_activity { Faker::Lorem.sentences(1).join('') }
  end
end
