class Word
  include Mongoid::Document
  field :name
  field :word_length, type: Integer, as: "l"
  embeds_many :entries, class_name: "WordEntry"

  before_save do |d|
    d.word_length = d.name.length
  end

  index({:name => 1}, {:unique => true, drop_dups: true})
  index({"entries.word_forms.text" => 1}, {unique: true, drop_dups: true})
end