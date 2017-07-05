class Crypt

  include ActiveModel::Model

  attr_accessor :text

  validates :text, presence: true

end