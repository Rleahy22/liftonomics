require 'spec_helper'

describe Workout do

  let(:user) { FactoryGirl.create(:user) }
  before { @workout = user.workouts.build(name: "Split") }

  subject { @workout }

  it { should be_valid }

  it {should respond_to(:name) }
  it {should respond_to(:user_id) }
  it {should respond_to(:one_month_gain) }
  it {should respond_to(:three_month_gain) }

  describe "when user_id is not present" do
    before { @workout.user_id = nil }
    it { should_not be_valid }
  end

  describe "when name is not present" do
    before { @workout.name = '' }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @workout.name = "x" * 31 }
    it { should_not be_valid }
  end

  describe "week associations" do
    before { @workout.save }
    let!(:week) { FactoryGirl.create(:week, workout: @workout, week_number: 1) }

    it "should have associated weeks" do
      expect(@workout.weeks).to eq([week])
    end

    it "should destroy associated weeks" do
      weeks = @workout.weeks.to_a
      @workout.destroy
      expect(weeks).not_to be_empty
      weeks.each do |week|
        expect(Week.where(id: week.id)).to be_empty
      end
    end
  end
end
