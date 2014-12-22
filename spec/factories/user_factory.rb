FactoryGirl.define do
  factory :user do
    first_name "paul"
    last_name "haddad"
    email "user@artsy.com"
    password "rubyonrails"
    password_confirmation "rubyonrails"
    confirmed_at "#{Time.now}"
  end
end
