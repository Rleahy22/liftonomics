require 'spec_helper'

describe Day do

  let(:user) { FactoryGirl.create(:user) }
  let(:workout) { FactoryGirl.create(:workout, user: user) }
  let(:week) { FactoryGirl.create(:week, workout: workout) }
  before { @day = week.days.build(name: "Monday",
                                  day_number: 1,
                                  date: "01/01/2014") }

  subject { @day }

  it { should be_valid }

  it { should respond_to(:name) }
  it { should respond_to(:day_number) }
  it { should respond_to(:date) }
  it { should respond_to(:week_id) }
end
