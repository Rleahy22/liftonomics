require 'spec_helper'

describe User do

  before do
    @user = User.create(username: "example",
                        email: "example@me.com",
                        password: "password",
                        password_confirmation: "password",
                        height_feet: 6,
                        height_inches: 0,
                        weight: 170)
  end

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:height_feet) }
  it { should respond_to(:height_inches) }

  it { should be_valid }

  describe "when username is not present" do
    before { @user.username = '' }
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
  before { @user.save }
  let(:found_user) { User.find_by(email: @user.email) }

  describe "with valid password" do
    it { should eq found_user.authenticate(@user.password) }
  end

  describe "with invalid password" do
    let(:user_for_invalid_password) { found_user.authenticate("invalid") }

    it { should_not eq user_for_invalid_password }
    specify { expect(user_for_invalid_password).to be_false }
  end
end

  describe "when username is too long" do
    before { @user.username = 'x' * 21 }
    it { should_not be_valid }
  end

  describe "when username is already taken" do
    before do
      @user_with_same_name = @user.dup
      @user_with_same_name.username = @user.username.upcase
      @user_with_same_name.email = "somethingelse@me.com"
    end

    it "should not be valid" do
      expect(@user_with_same_name).to be_invalid
    end
  end

  describe "when email is not present" do
    before { @user.email = "" }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "user should be invalid" do
      addresses = %w[useratgmaildotcom me@mecom @gmail.com user]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).to be_invalid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      @user_with_same_email = @user.dup
      @user_with_same_email.email = @user.email.upcase
      @user_with_same_email.username = "different_user"
    end

    it "should not be valid" do
      expect(@user_with_same_email).to be_invalid
    end
  end

  describe "with a password that is too short" do
    before { @user.password = @user.password_confirmation = "xxx12" }
    it { should_not be_valid }
  end

  describe "when password and password_confirmation don't match" do
    before do
      passwords = ["", "notpassword"]
      passwords.each do |unmatched_password|
        @user.password_confirmation = unmatched_password
        expect(@user).to be_invalid
      end
    end
  end

  describe "when height_feet is too short" do
    before { @user.height_feet = 2 }
    it { should_not be_valid }
  end

  describe "when height_feet is too tall" do
    before { @user.height_feet = 8 }
    it { should_not be_valid }
  end

  describe "when height_inches is too short" do
    before { @user.height_inches = -1 }
    it { should_not be_valid }
  end

  describe "when height_inches is too tall" do
    before { @user.height_inches = 12 }
    it { should_not be_valid }
  end

  describe "when weight is too low" do
    before { @user.weight = 50 }
    it { should_not be_valid }
  end

  describe "when weight is too high" do
    before { @user.weight = 800 }
    it { should_not be_valid }
  end

  describe "workout associations" do
    before { @user.save }
    let!(:workout) do
      FactoryGirl.create(:workout, user: @user)
    end

    it "should have associated workouts" do
      expect(@user.workouts).to eq([workout])
    end

    it "should destroy associated workouts" do
      workouts = @user.workouts.to_a
      @user.destroy
      expect(workouts).not_to be_empty
      workouts.each do |workout|
        expect(Workout.where(id: workout.id)).to be_empty
      end
    end
  end
end
