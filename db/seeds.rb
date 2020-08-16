# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Recipe.destroy_all
Tag.destroy_all

italian = Tag.new(name: "Italian",cuisine?: true)
pakistani = Tag.new(name: "Pakistani", cuisine?: true)
mexican = Tag.new(name: "Mexican", cuisine?: true)
korean = Tag.new(name: "Korean", cuisine?: true)
gf = Tag.new(name: "Gluten-Free", dietary?: true)
vg = Tag.new(name: "Vegetarian", dietary?: true )
kosher = Tag.new(name: "Kosher", dietary?: true )
halal = Tag.new(name: "Halal", dietary?: true )

User.create(name: "Sanam", user_name: "Sanam04", password: "password")
starter_recipe = Recipe.create(
            is_starter?: true,
            chef_name: "Nigella Lawson",
            name: "Spaghetti with Meatballs",
            description: "Carbohydrate avoidance be damned: pasta with meatballs is the perfect culinary counter to the cruel world. Just looking at a slippery, tomato-sauced tangle of spaghetti topped with juicy toothsome meatballs makes you feel better; eating it is the instant antidote to whatever ails you. The recipe here makes more sauce, perhaps, than you'd normally want to use to dress a pound of pasta, but when I sit down to eat with the children I want to make sure I'm not going to have to get up and make them anything else to eat before they go to bed.",
            serving_size: 4,
            calorie_count: 250,
            ingredients: "FOR THE MEATBALLS:
            8 ounces ground pork
            8 ounces ground beef
            1 large egg, lightly beaten
            2 tablespoons freshly grated Parmesan cheese
            1 garlic clove, peeled and minced
            1 teaspoon dried oregano
            3 tablespoons bread crumbs or semolina
            1 teaspoon salt
             Freshly ground black pepper
            FOR THE SAUCE:
            1 onion, peeled and halved
            2 garlic cloves, peeled
            1 teaspoon dried oregano
            1 tablespoon unsalted butter",
            image_url: "https://static01.nyt.com/images/2017/04/05/dining/05COOKING-NIGMEATBALLS2/05COOKING-NIGMEATBALLS2-articleLarge.jpg",
            instructions: "Step 1: Prepare meatballs: In a large bowl, combine pork, beef, egg, Parmesan, garlic, oregano, bread crumbs, salt and pepper to taste. Mix thoroughly but lightly, handling mixture as little as possible.
            Step 2: Line a baking sheet with plastic wrap. Shape rounded teaspoonfuls of meat mixture into balls 1 inch in diameter, and place on plastic. Refrigerate while making sauce.
            Step 3: Prepare sauce: Combine onion, garlic and oregano in a food processor, and puree until smooth. Combine butter and oil in a wide, deep pan, and place over low heat until butter melts. Add onion-garlic mixture. Simmer, stirring occasionally, about 10 minutes; do not brown. Add passata and 2 cups water to pan. Season with sugar, and salt and pepper to taste.
            Step 4: Simmer for 10 minutes, then add milk and bring sauce back to a simmer. Gently drop in meatballs one by one so that they do not break (make sure the meatballs are submerged); do not stir pan. Cover pan partially with a lid, and simmer for 20 minutes.
            Step 5: Adjust seasonings to taste. Place hot pasta in a large serving bowl. Pour most of sauce (reserving meatballs) on pasta, and toss to combine. Top pasta with meatballs, and serve.")

    starter_recipe.tags << [italian, kosher]

    modified_recipe = Recipe.create(starter_recipe: starter_recipe,
        is_starter?: false,
        chef_name: "Sanam",
        name: "Pakistani Spaghetti with Meatballs",
        ingredients: "FOR THE MEATBALLS:
            8 ounces ground pork
            8 ounces ground beef
            1 teaspoon salt
             Freshly ground black pepper
            FOR THE SAUCE:
            1 onion, peeled and halved
            2 garlic cloves, peeled
            1 teaspoon dried oregano
            1 tablespoon unsalted butter",
        description: "My take on spaghetti and meatballs, Pakistani version. It's spicy but delicious",
        serving_size: 4,
        calorie_count: 300,
        image_url: "https://i1.wp.com/www.cookedbyjulie.com/wp-content/uploads/2017/01/spicymeatballscbj.jpg?resize=1024%2C682&ssl=1",
        instructions: "Step 1: Prepare meatballs: In a large bowl, combine fround chicken, egg, Parmesan, garlic, oregano, red pepper flakes, coriander, bread crumbs, salt and red pepper to taste. Mix thoroughly but lightly, handling mixture as little as possible.
        Step 2: Line a baking sheet with plastic wrap. Shape rounded teaspoonfuls of meat mixture into balls 1 inch in diameter, and place on plastic. Refrigerate while making sauce.
        Step 3: Prepare sauce: Combine onion, garlic and oregano in a food processor, and puree until smooth. Combine butter and oil in a wide, deep pan, and place over low heat until butter melts. Add onion-garlic mixture, cumin, turmeric, red pepper flakes in the sauce. Simmer, stirring occasionally, about 10 minutes; do not brown. Add passata and 2 cups water to pan. Season with sugar, and salt and pepper to taste.
        Step 4: Simmer for 10 minutes, then bring sauce back to a simmer. Gently drop in meatballs one by one so that they do not break (make sure the meatballs are submerged); do not stir pan. Cover pan partially with a lid, and simmer for 20 minutes.
        Step 5: Adjust seasonings to taste. Place hot pasta in a large serving bowl. Pour most of sauce (reserving meatballs) on pasta, and toss to combine. Top pasta with meatballs, and serve.")

        modified_recipe.tags << [pakistani, halal]