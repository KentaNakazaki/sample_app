require 'rails_helper'

RSpec.describe "StaticPagesController", type: :request do
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  describe "GET /home" do
    it "returns http success" do
      get root_url
      expect(response).to have_http_status(:success)
      assert_select "title", "Home | #{base_title}"
    end
  end

  describe "GET /help" do
    it "returns http success" do
      get static_pages_help_url
      expect(response).to have_http_status(:success)
      assert_select "title", "Help | #{base_title}"
    end
  end

  describe "GET /about" do
    it "returns http success" do
      get static_pages_about_url
      expect(response).to have_http_status(:success)
      assert_select "title", "About | #{base_title}"
    end
  end

  describe "GET /contact" do
    it "returns http success" do
      get static_pages_contact_url
      expect(response).to have_http_status(:success)
      assert_select "title", "Contact | #{base_title}"
    end
  end

end