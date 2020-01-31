require_relative "phone_number_validator"

Bundler.require

class UserDetails
  include ActiveModel::Validations

  attr_reader :name, :email, :phone_number

  validates :name, presence: true
  validates :email, presence: true, format: { with: /A[^@s] @[^@s] z/, allow_blank: true }
  validates :phone_number, phone_number: { allow_blank: true }

  def initialize(name = nil, email = nil, phone_number = nil)
    @name = name
    @email = email
    @phone_number = phone_number
  end

  def to_row
    [name, email, phone_number]
  end
end
