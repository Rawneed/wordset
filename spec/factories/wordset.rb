FactoryGirl.define do
  factory :wordset do
    before(:create) do |wordset, evaluator|
      create_list(:entry, 1, wordset: wordset)
      create_list(:seq, 1, wordset: wordset)
    end

  end

  factory :word_list do
  end
end