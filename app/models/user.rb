# frozen_string_literal: true

class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :notes

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session['devise.google_data'] && session['devise.google_data']['extra']['raw_info']) && user.email.blank?
        user.email = data['email']
      end
    end
  end
end
