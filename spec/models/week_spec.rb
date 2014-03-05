require 'spec_helper'

describe Week do

  let(:user) { FactoryGirl.create(:user) }  
  let(:workout) { FactoryGirl.create(:workout, user: user) }

  before { @week = workout.weeks.build() }

  subject { @week }

  it { should be_valid }
  it { should respond_to(:workout_id) }
  it { should respond_to(:week_number) }

  describe "day associations" do
    let!(:d1) { @week.days.build(day_number: 1) }
    let!(:d2) { @week.days.build(day_number: 2) }

    it "should have associated days" do
      expect(@week.days).to eq([d1, d2])
    end

    it "should destroy associated days" do
      days = @week.days.to_a
      @week.destroy
      expect(days).not_to be_empty
      days.each do |day|
        expect(Day.where(id: day.id)).to be_empty
      end
    end
  end
end
