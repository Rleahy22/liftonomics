require 'spec_helper'

describe "WorkoutPages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "workout creation" do
    before { visit new_user_workout_path(user.id) }

    describe "with invalid information" do
      it "should not create a workout" do
        expect { click_button("Create Workout") }.not_to change(Workout, :count)
      end
    end

    describe "with valid information" do
      before { fill_in 'Workout Name', with: "March Workout" }
      it "should create a workout" do
        expect { click_button("Create Workout") }.to change(Workout, :count).by(1)
      end
    end
  end
end
