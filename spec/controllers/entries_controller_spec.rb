require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe EntriesController do

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EntriesController. Be sure to keep this updated too.
  def valid_session
    {}
  end
  
  context "when logged in" do 
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    describe "GET index" do
      it "assigns all entries as @entries" do
        entry = FactoryGirl.create(:entry, user: @user)
        get :index, {}, valid_session
        assigns(:entries).should eq([entry])
      end
    end

    describe "GET show" do
      it "assigns the requested entry as @entry" do
        entry = FactoryGirl.create(:entry, user: @user)
        get :show, {:id => entry.id}
        assigns(:entry).should eq(entry)
      end
    end

    describe "GET new" do
      it "assigns a new entry as @entry" do
        get :new, {}, valid_session
        assigns(:entry).should be_a_new(Entry)
      end
    end

    describe "GET edit" do
      it "assigns the requested entry as @entry" do
        entry = FactoryGirl.create(:entry, user: @user)
        get :edit, {:id => entry.to_param}, valid_session
        assigns(:entry).should eq(entry)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Entry" do
          expect {
            post :create, {:entry => FactoryGirl.attributes_for(:entry)}
          }.to change(Entry, :count).by(1)
        end

        it "assigns a newly created entry as @entry" do
          post :create, {:entry => FactoryGirl.attributes_for(:entry)}
          assigns(:entry).should be_a(Entry)
          assigns(:entry).should be_persisted
        end

        it "the created entry belongs to the logged in user" do
          post :create, {:entry => FactoryGirl.attributes_for(:entry)}
          assigns(:entry).user_id.should eq @user.id 
        end

        it "redirects to the created entry" do
          post :create, {:entry => FactoryGirl.attributes_for(:entry)}
          response.should redirect_to(Entry.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved entry as @entry" do
          # Trigger the behavior that occurs when invalid params are submitted
          Entry.any_instance.stub(:save).and_return(false)
          post :create, {:entry => { "physical_location" => "invalid value" }}, valid_session
          assigns(:entry).should be_a_new(Entry)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Entry.any_instance.stub(:save).and_return(false)
          post :create, {:entry => { "physical_location" => "invalid value" }}, valid_session
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested entry" do
          entry = FactoryGirl.create(:entry, user: @user)
          # Assuming there are no other entries in the database, this
          # specifies that the Entry created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Entry.any_instance.should_receive(:update).with({ "physical_location" => "MyString" })
          put :update, {:id => entry.to_param, :entry => { "physical_location" => "MyString" }}, valid_session
        end

        it "assigns the requested entry as @entry" do
          entry = FactoryGirl.create(:entry, user: @user)
          put :update, {:id => entry.to_param, :entry => FactoryGirl.attributes_for(:entry)}
          assigns(:entry).should eq(entry)
        end

        it "redirects to the entry" do
          entry = FactoryGirl.create(:entry, user: @user)
          put :update, {:id => entry.to_param, :entry => FactoryGirl.attributes_for(:entry)}
          response.should redirect_to(entry)
        end
      end

      describe "with invalid params" do
        it "assigns the entry as @entry" do
          entry = FactoryGirl.create(:entry, user: @user)
          # Trigger the behavior that occurs when invalid params are submitted
          Entry.any_instance.stub(:save).and_return(false)
          put :update, {:id => entry.to_param, :entry => { "physical_location" => "invalid value" }}, valid_session
          assigns(:entry).should eq(entry)
        end

        it "re-renders the 'edit' template" do
          entry = FactoryGirl.create(:entry, user: @user)
          # Trigger the behavior that occurs when invalid params are submitted
          Entry.any_instance.stub(:save).and_return(false)
          put :update, {:id => entry.to_param, :entry => { "physical_location" => "invalid value" }}, valid_session
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested entry" do
        entry = FactoryGirl.create(:entry, user: @user)
        expect {
          delete :destroy, {:id => entry.to_param}, valid_session
        }.to change(Entry, :count).by(-1)
      end

      it "redirects to the entries list" do
        entry = FactoryGirl.create(:entry, user: @user)
        delete :destroy, {:id => entry.to_param}, valid_session
        response.should redirect_to(entries_url)
      end
    end
  end

  context "when not logged in" do 
    describe "GET index" do
      it "should deny access" do
        get :index, {}
        response.code.should_not == "200"
      end
    end

    describe "GET show" do
      it "assigns the requested entry as @entry" do
        entry = FactoryGirl.create(:entry)
        get :show, {:id => entry.id}          
        response.code.should_not == "200"
      end
    end
  end
end
