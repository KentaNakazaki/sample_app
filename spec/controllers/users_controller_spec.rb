require 'rails_helper'

RSpec.describe "Sign up", type: :request do
  describe "GET /signup" do
    it "return http success" do
      get signup_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /signup" do
    subject { post signup_path, params: params } 
    context "invalid parameters" do
      let(:params) do
        { user: { name:  "",
                  email: "user@invalid",
                  password:              "foo",
                  password_confirmation: "bar" }
        }
      end
      example "不正なパラメータの時、Userは保存されない" do
        expect { subject }.not_to change { User.count }
      end
    end

    context "valid parameters" do
      let(:params) do
        { user: { name:  "hogehoge",
          email: "hogehoge@example.com",
          password:              "hogehoge",
          password_confirmation: "hogehoge" }
        }
      end
      example "正しいパラメータの時Userは保存され、ユーザー画面に遷移する" do
        expect { subject }.to change { User.count }.by(1)
        expect(response).to redirect_to User.last
      end
    end
    
  end
end
