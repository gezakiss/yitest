require 'spec_helper'

describe Api::V1::EmailsController do
  let(:valid_attributes) { { :email => "demo@demo.com" } }

  describe "POST create" do
    it "creates a new Email" do
      expect {
        post :create, {:email => valid_attributes,:format => :json}
      }.to change(Email, :count).by(1)
    end

  end
end
