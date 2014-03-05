User.create(username:              "example",
            email:                 "example@me.com",
            password:              "password",
            password_confirmation: "password",
            height_feet:           6,
            height_inches:         2,
            weight:                180,
            max_bench:             200,
            max_squat:             300,
            max_deadlift:          400,
            level:                "Intermediate",
            goal:                  "Lose Weight",
            )

lifts = [{name: "Bench Press", upper_lower: "Upper", primary_muscle: "Chest", secondary_muscle: "Triceps", push_pull: "Push", instructions_one: "Lie back on a flat bench. Using a medium width grip (a grip that creates a 90-degree angle in the middle of the movement between the forearms and the upper arms), lift the bar from the rack and hold it straight over you with your arms locked. This will be your starting position.", instructions_two: "From the starting position, breathe in and begin coming down slowly until the bar touches your middle chest.", instructions_three: "After a brief pause, push the bar back to the starting position as you breathe out. Focus on pushing the bar using your chest muscles. Lock your arms and squeeze your chest in the contracted position at the top of the motion, hold for a second and then start coming down slowly again. Tip: Ideally, lowering the weight should take about twice as long as raising it.", instructions_four: "Repeat the movement for the prescribed amount of repetitions.", instructions_five: "When you are done, place the bar back in the rack."},
         {name: "Dumbbell Curls", upper_lower: "Upper", primary_muscle: "Biceps", secondary_muscle: "Forearms", push_pull: "Pull", instructions_one: "Stand up straight with a dumbbell in each hand at arm's length. Keep your elbows close to your torso and rotate the palms of your hands until they are facing forward. This will be your starting position.", instructions_two: "Now, keeping the upper arms stationary, exhale and curl the weights while contracting your biceps. Continue to raise the weights until your biceps are fully contracted and the dumbbells are at shoulder level. Hold the contracted position for a brief pause as you squeeze your biceps.", instructions_three: "Then, inhale and slowly begin to lower the dumbbells back to the starting position.", instructions_four: "Repeat for the recommended amount of repetitions."},
         {name: "Tricep Pushdown", upper_lower: "Upper", primary_muscle: "Triceps", push_pull: "Push", instructions_one: "Attach a straight or angled bar to a high pulley and grab with an overhand grip (palms facing down) at shoulder width.", instructions_two: "Standing upright with the torso straight and a very small inclination forward, bring the upper arms close to your body and perpendicular to the floor. The forearms should be pointing up towards the pulley as they hold the bar. This is your starting position.", instructions_three: "Using the triceps, bring the bar down until it touches the front of your thighs and the arms are fully extended perpendicular to the floor. The upper arms should always remain stationary next to your torso and only the forearms should move. Exhale as you perform this movement.", instructions_four: "After a second hold at the contracted position, bring the bar slowly up to the starting point. Breathe in as you perform this step.", instructions_five: "Repeat for the recommended amount of repetitions."}
        ]

lifts.each do |lift|
  Lift.create(name: lift[:name],
              upper_lower: lift[:upper_lower],
              primary_muscle: lift[:primary_muscle],
              secondary_muscle: lift[:secondary_muscle],
              push_pull: lift[:push_pull],
              instructions_one: lift[:instructions_one],
              instructions_two: lift[:instructions_two],
              instructions_three: lift[:instructions_three],
              instructions_four: lift[:instructions_four],
              instructions_five: lift[:instructions_five],
              instructions_six: lift[:instructions_six],
              instructions_seven: lift[:instructions_seven],
              )
end