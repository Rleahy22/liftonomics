require 'spec_helper'

describe Week do

  let(:user) { FactoryGirl.create(:user) }  
  let(:workout) { FactoryGirl.create(:workout, user: user) }

  before { @week = workout.weeks.build() }

  subject { @week }

  it { should be_valid }
  it { should respond_to(:workout_id) }
  it { should respond_to(:week_number) }
end
