require 'spec_helper'

describe Day do

  let(:user) { FactoryGirl.create(:user) }
  let(:workout) { FactoryGirl.create(:workout, user: user) }
  let(:week) { FactoryGirl.create(:week, workout: workout) }
  before { @day = week.days.build(day_number: 1,
                                  date_completed: nil) }

  subject { @day }

  it { should be_valid }

  it { should respond_to(:day_number) }
  it { should respond_to(:date_completed) }
  it { should respond_to(:week_id) }
end
