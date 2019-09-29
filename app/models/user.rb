class User < ApplicationRecord
  has_many :columns
  has_secure_password

  validates :name,
    presence: true,
    uniqueness: true,
    length: {maximum: 16},
    format:{
      with: /\A[a-z0-9]+\z/,
      message: 'は英数小文字で入力して下さい。'
    }
  validates :password, length:{minimum: 5}
  VALID_MAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
end