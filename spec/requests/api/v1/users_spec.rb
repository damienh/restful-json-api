require 'rails_helper'

describe "Users API" do
    describe "GET api/v1/users/:id" do
      let(:user) { FactoryGirl.create(:user) }

      it "returns requested user" do

        get "api/v1/users/#{user.id}", {}, { "Accept" => "application/json" }

        expect(response.status).to eq 200
        body = JSON.parse(response.body)
        expect(body['username']).to eq(user.username)
      end
    end

    describe "POST api/v1/users" do
      let(:request_headers) {
       { 'Accept' => 'application/json',
         'Content-Type' => "application/json" }
       }
      it "it creates a user" do

        user_params = {
          "user" => {
            "username" => "damien",
            "email" => "damien@me.com",
            "password" => "gammonnthat123"
          }
        }.to_json

        post "/api/v1/users", user_params, request_headers

        expect(response.status).to eq 201
        expect(User.last.username).to eq "damien"
      end

      context "with invalud attributes" do
        it "fails to create the user" do

          user_params = {
          "user" => {
            "username" => "",
            "email" => "damien@me.com",
            "password" => "36363263267"
          }
        }.to_json

        post "/api/v1/users", user_params, request_headers

        expect(response.status).to eq 442
        end
      end
    end

    describe "DELETE api/v1/users/:id" do
      let(:auth_headers) {
       { 'Accept' => "application/json",
         'Authorization' => 'Token token="foobar"'}
       }
      let(:user) { FactoryGirl.create(:user) }

      it "deletes the requested user" do

        delete "/api/v1/users/#{user.id}", {}, auth_headers

        expect(response.status).to eq 204
      end

      context "with invalid users/:id" do

        it "responds with a 404 record cannot be found" do
          delete "/api/v1/users/dfs", {}, auth_headers

          expect(response.status).to eq 404
        end
      end

      context "with invalid token" do
        let(:auth_headers) {
         { 'Accept' => "application/json",
           'Authorization' => 'Token token="de6821x"'}
         }
        it "it states HTTP Token: Access denied." do
          delete "/api/v1/users/#{user.id}", {}, auth_headers

          expect(response.status).to eq 401
        end
      end
    end
  end
