require 'rails_helper'

RSpec.describe "Users", type: :request do

  before(:each) do
    stub_api_requests
  end

  describe "GET /sign_in" do

    context "when user is logged in" do

      before(:each) do
        mock_sign_in
      end

      it "should redirect to root path" do

        get new_user_session_path
        follow_redirect!
        expect(response.body).to include "Travel notes"
      end

    end

    context "when user is NOT logged in" do

      it "should present login page" do
        get new_user_session_path
        expect(response.body).to include "Sign in with Google"
      end

    end
  end

  describe "GET /sign_out" do

    context "when user is logged in" do

      before(:each) do
        mock_sign_in
      end

      it "should log a user out" do
        get destroy_user_session_path
        follow_redirect!
        follow_redirect!
        expect(response.body).to include "You need to log in before continuing."
      end

    end

    context "when user is NOT logged in" do

      it "should redirect to login page" do
        get destroy_user_session_path
        follow_redirect!
        follow_redirect!
        expect(response.body).to include "You need to log in before continuing."
      end

    end
  end
end
