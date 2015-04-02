class Seq
  include Mongoid::Document
  include Mongoid::Timestamps
  include AnagramHelpers

  belongs_to :lang
  belongs_to :word
  field :text, as: "t"

  validates :text, :format => { with: /\A[a-zA-Z][a-zA-Z\d\/\-' .]*\z/ } #'

  field :alpha, as: "a"
  field :word_length, type: Integer, as: "l"
  index({text: 1, language_id: 1})
  index({word_length: 1})
  index({alpha: 1})

  before_save do |d|
    d.word_length = d.text.length
  end
end