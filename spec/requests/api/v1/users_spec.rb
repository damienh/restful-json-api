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
      it "it creates a user" do

      end

      context "with invalud attributes" do
        it "fails to create the user" do

        end
      end
    end

    describe "DELETE api/v1/users/:id" do
      it "deletes the requested user" do

      end

      context "with invalid users/:id" do
        it "responds with a 404 record cannot be found" do

        end
      end

      context "with invalid token" do
        it "it states HTTP Token: Access denied." do

        end
      end
    end
  end
