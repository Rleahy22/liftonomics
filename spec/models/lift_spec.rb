require 'spec_helper'

describe Lift do

  before { @lift = Lift.new(name: "Bench Press",
                            upper_lower: "Upper",
                            primary_muscle: "Chest",
                            secondary_muscle: "Triceps",
                            push_pull: "Push",
                            instructions_one: "Lie back on a flat bench. Using a medium width grip (a grip that creates a 90-degree angle in the middle of the movement between the forearms and the upper arms), lift the bar from the rack and hold it straight over you with your arms locked. This will be your starting position.",
                            instructions_two: "From the starting position, breathe in and begin coming down slowly until the bar touches your middle chest.",
                            instructions_three: "After a brief pause, push the bar back to the starting position as you breathe out. Focus on pushing the bar using your chest muscles. Lock your arms and squeeze your chest in the contracted position at the top of the motion, hold for a second and then start coming down slowly again. Tip: Ideally, lowering the weight should take about twice as long as raising it.",
                            instructions_four: "Repeat the movement for the prescribed amount of repetitions.",
                            instructions_five: "When you are done, place the bar back in the rack.") }

  subject { @lift }

  it { should be_valid }

  it { should respond_to(:name) }
  it { should respond_to(:upper_lower) }
  it { should respond_to(:primary_muscle) }
  it { should respond_to(:secondary_muscle) }
  it { should respond_to(:push_pull) }
  it { should respond_to(:instructions_one) }
  it { should respond_to(:instructions_two) }
  it { should respond_to(:instructions_three) }
  it { should respond_to(:instructions_four) }
  it { should respond_to(:instructions_five) }
  it { should respond_to(:instructions_six) }
  it { should respond_to(:instructions_seven) }

end
