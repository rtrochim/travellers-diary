module AuthHelper
  def mock_sign_in
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
    @user = User.from_omniauth(OmniAuth.config.mock_auth[:google_oauth2])
    sign_in @user
  end
end