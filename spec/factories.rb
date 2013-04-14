FactoryGirl.define do
  factory :usuario do
    name     "Francisco"
    email    "fjavier@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end