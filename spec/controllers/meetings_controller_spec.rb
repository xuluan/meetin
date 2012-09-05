require 'spec_helper'

describe MeetingsController do

  let(:meeting) {FactoryGirl.create(:meeting)}

  before (:each) do
    sign_in meeting.manager
  end

  describe "GET new" do
    it "assigns a new meeting as meeting" do
      get :new
      assigns(:meeting).should be_a_new(Meeting)
    end

    it "assigns a new meeting as meeting with template" do
      get :new, id: meeting.id
      assigns(:meeting).should be_a_new(Meeting)
      assigns(:meeting_template).should eq(meeting)
    end    
  end

  describe "GET index" do
    it "assigns all meetings as meetings" do
      get :index
      assigns(:meetings).should eq([meeting])
    end
  end

  describe "GET show" do
    it "assigns the requested meeting as meeting" do
      get :show, {:id => meeting.to_param}
      assigns(:meeting).should eq(meeting)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Meeting" do
        attrs = FactoryGirl.attributes_for(:meeting2)
        expect {
          post :create, {:meeting => attrs}
        }.to change(Meeting, :count).by(1)
      end

      it "assigns a newly created meeting as meeting" do
        attrs = FactoryGirl.attributes_for(:meeting2)
        post :create, {:meeting => attrs}
        assigns(:meeting).should be_a(Meeting)
        assigns(:meeting).should be_persisted
      end

      it "redirects to the created meeting" do
        attrs = FactoryGirl.attributes_for(:meeting2)
        post :create, {:meeting => attrs}
        response.should redirect_to(Meeting.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved meeting as meeting" do
        # Trigger the behavior that occurs when invalid params are submitted
        Meeting.any_instance.stub(:save).and_return(false)
        post :create, {:meeting => {}}
        assigns(:meeting).should be_a_new(Meeting)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Meeting.any_instance.stub(:save).and_return(false)
        post :create, {:meeting => {}}
        response.should render_template("new")
      end
    end
  end

end
