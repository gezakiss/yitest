require 'spec_helper'

describe OrdersController do

  let(:valid_attributes) { { :email => "demo@demo.com", :name => "Demo Joe", :address => "Demo street" } }

  let(:valid_session) { {} }

  describe "GET new" do
    it "assigns a new order as @order" do
      get :new, {}, valid_session
      assigns(:order).should be_a_new(Order)
    end
  end


  describe "POST create" do
      it "creates a new Order" do
        expect {
          post :create, {:order => valid_attributes}, valid_session
        }.to change(Order, :count).by(1)
      end

      it "assigns a newly created order as @order" do
        post :create, {:order => valid_attributes}, valid_session
        assigns(:order).should be_a(Order)
        assigns(:order).should be_persisted
      end

  end

end
