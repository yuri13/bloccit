FactoryGirl.define do
  factory :label do
    sequence(:name){ RandomData.random_word }
  end
end
