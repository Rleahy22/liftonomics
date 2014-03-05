require 'spec_helper'

describe "WorkoutPages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let(:workout) { FactoryGirl.create(:workout, user: user) }
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

  describe "workout#show" do
    before do
      for x in 1..4
        Week.create(workout_id: workout.id, week_number: x)
      end
      visit user_workout_path(user, workout)
    end

    it { should have_content(workout.name) }
    it { should have_link("Edit Workout") }

    describe "workout.weeks" do

      it { should have_content("Week 1") }
      it { should have_content("Week 4") }
    end
  end

  describe "edit" do
    before { visit edit_user_workout_path(user, workout)}

    describe "page" do
      it { should have_button("Save Changes") }
    end

    describe "with invalid info" do
      before do
        fill_in "Workout Name", with: ''
        click_button "Save Changes"
      end

      it { should have_content "Name cannot be blank" }
    end

    describe "with valid info" do
      before do
        fill_in "Workout Name", with: "New Name"
        click_button "Save Changes"
      end

      it { should have_content("New Name") }
    end

    describe "clicking delete" do
      it "should delete the workout" do
        expect { click_link("Delete Workout") }.to change(Workout, :count).by(-1)
      end
    end
  end
end
