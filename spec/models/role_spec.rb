require 'spec_helper'

describe Role do

  it "is a valid role" do
    role = FactoryGirl.build(:role)
    role.should be_valid
  end    


  it { should  validate_presence_of(:name)}

  xit { should  validate_presence_of(:meeting_id)}

  it { should  belong_to(:meeting)}

  it { should  belong_to(:assign)}

  it { should  have_many(:choices)}

end
