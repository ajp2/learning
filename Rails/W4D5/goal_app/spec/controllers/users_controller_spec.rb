require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders the sign up page" do
      get :new

      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "renders the user's show page" do
      u1 = FactoryBot.create(:user)
      get :show, params: {id: u1.id}

      expect(response).to render_template("show")
    end
  end

  describe "GET #index" do
    it "renders user index page" do
      get :index

      expect(response).to render_template("index")
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of username and password" do
        post :create, params: { user: { username: "test" } }

        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects to the user show page" do
        post :create, params: { user: { username: "test", password: "testing" } }

        expect(response).to redirect_to(user_url(User.last))
      end
    end
  end
end
