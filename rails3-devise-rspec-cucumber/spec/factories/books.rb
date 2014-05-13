# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    title "Farewell My Concubine"
    review "This is actually a movie"
    user_id 1
  end

  factory :book2, class: Book do
    title "Curse of the Golden Flower"
    review "Another good film"
    user_id 1
  end
end


