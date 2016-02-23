FactoryGirl.define do
  factory :transaction do
    credit_card_number "MyString"
    result "MyString"
    invoice nil
  end
end
