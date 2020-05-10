# frozen_string_literal: true

class User < ApplicationRecord
  has_many :todos

  def self.find_or_create(auth)
    where(uid: auth.uid).first_or_initialize.tap do |user|
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.image = auth.info.image
      user.save!
    end
  end
end
