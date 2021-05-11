require 'rails_helper'
include AuthHelper

RSpec.describe "Notes", type: :request do

  describe "GET /notes/index" do

    context "when user is logged in" do

      let(:user) { Fabricate(:user) }
      login_user(:user)

      it "should present list of users notes" do
        get :index
        expect(response).to render_template("index")
      end

    end

    context "when user is not logged in" do

    end

  end
end
