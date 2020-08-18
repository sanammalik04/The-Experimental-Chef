# This file should contain all the record creation needed to seed the japanesebase with its default values.
# The japanese can then be loaded with the rails db:seed command (or created alongside the japanesebase with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'net/http'
require 'open-uri'
require 'json'

User.destroy_all
Recipe.destroy_all
Tag.destroy_all
UserRecipe.destroy_all


italian = Tag.new(name: "Italian",cuisine?: true)
pakistani = Tag.new(name: "Pakistani", cuisine?: true)
mexican = Tag.new(name: "Mexican", cuisine?: true)
korean = Tag.new(name: "Korean", cuisine?: true)
gf = Tag.new(name: "Gluten-Free", dietary?: true)
vg = Tag.new(name: "Vegetarian", dietary?: true )
kosher = Tag.new(name: "Kosher", dietary?: true )
halal = Tag.new(name: "Halal", dietary?: true )
df = Tag.new(name: "Dairy-Free", dietary?: true)


butter_chicken = Recipe.create(
    is_starter?: true,
    chef_name: "Layla",
    name: "Butter Chicken",
    description: "Quick 20-minute butter chicken is creamy and packed full of flavor. It’s simplified and cooked all in one pan and goes great with a side of rice or naan!",
    serving_size: 4,
    calorie_count: 491,
    ingredients: "1 tablespoon oil
                    1 tablespoon butter
                    1 medium onion diced
                    1 teaspoon fresh ginger finely minced or grated (or use paste)
                    2-3 cloves garlic finely minced or crushed
                    1 ½ pounds about 2-3 boneless, skinless chicken breasts, cut into ¾-inch chunks
                    4 tablespoons tomato paste or 8 oz can of tomato sauce
                    1 tablespoon garam masala
                    1 teaspoon chili powder or paprika, adjust to taste
                    1 teaspoon Fenugreek I use powder, but seeds or mustard seeds can be used too, optional*
                    1 teaspoon cumin
                    1 tsp salt
                    1/4 tsp black pepper
                    1 cup heavy cream sub for half & half or yogurt for low fat
                    Hot cooked rice and naan for serving",
                    image_url: "https://i2.wp.com/gimmedelicious.com/wp-content/uploads/2020/01/Butter-chicken.jpg",
                    instructions: "Heat a large skillet or medium saucepan over medium-high heat. Add the oil, butter, and onions and cook onions down until lightly golden, about 3-4 minutes. Add ginger and garlic and let cook for 30 seconds, stirring so it doesn’t burn.
                    Add the chicken, tomato paste, and spices. Cook for 5-6 minutes or until everything is cooked through.
                    Add the heavy cream and simmer for 8-10 minutes stirring occasionally. Serve over Basmati rice or with naan."
)

butter_chicken.tags << [pakistani, halal]

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
            image_url:"https://static01.nyt.com/images/2017/04/05/dining/05COOKING-NIGMEATBALLS2/05COOKING-NIGMEATBALLS2-articleLarge.jpg",
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

        

        # Japanese recipes
        response1 = RestClient.get("https://api.spoonacular.com/recipes/complexSearch?apiKey=268fdcae8c61449b81b0956a696f6b04&addRecipeInformation=true&fillIngredients=true&cuisine=Japanese")
        japanese = JSON.load(response1)
        
        Recipe.create(
            is_starter?: true,
            name: japanese["results"][0]["title"],
            description: japanese["results"][0]["summary"],
            serving_size: japanese["results"][0]["servings"],
            image_url: japanese["results"][0]["image"],
            instructions: 
                japanese["results"][0]["analyzedInstructions"][0]["steps"].map do |step|
                    "Step #{step["number"]}: #{step["step"]}"
                end.join("\n"),
            ingredients: 
                japanese["results"][0]["extendedIngredients"].map do |ingredient|
                    ingredient["originalString"]
                end.join("\n"),
            tags: 
                all_tags = japanese["results"][0]["cuisines"].map do |cuisine|
                    tag = Tag.find_or_create_by(name: cuisine, cuisine?: true)
                end 
        )

        japanese["results"][5..8].each do |recipe|
            diet_tags = []
            if recipe["vegetarian"] == true
                 diet_tags << vg
            end
            if recipe["glutenFree"] == true
                diet_tags << gf
            end
            if recipe["dairyFree"] == true
                diet_tags << df
            end

            cuisine_tags = recipe["cuisines"].map do |cuisine|
                tag = Tag.find_or_create_by(name: cuisine, cuisine?: true)
            end 

            Recipe.create!(
            is_starter?: true,
            name: recipe["title"],
            description: recipe["summary"],
            serving_size: recipe["servings"],
            image_url: recipe["image"],
            instructions: 
                recipe["analyzedInstructions"][0]["steps"].map do |step|
                    "Step #{step["number"]}: #{step["step"]}"
                end.join("\n"),
            ingredients: 
                recipe["extendedIngredients"].map do |ingredient|
                    ingredient["originalString"]
                end.join("\n"),
            tags: 
                cuisine_tags + diet_tags
        )
        end

        # Italian Recipes

        response2 = RestClient.get("https://api.spoonacular.com/recipes/complexSearch?apiKey=268fdcae8c61449b81b0956a696f6b04&addRecipeInformation=true&fillIngredients=true&cuisine=Italian")
        it = JSON.load(response2)

        it["results"][0..4].each do |recipe|
            diet_tags1 = []
            if recipe["vegetarian"] == true
                 diet_tags1 << vg
            end
            if recipe["glutenFree"] == true
                diet_tags1 << gf
            end
            if recipe["dairyFree"] == true
                diet_tags1 << df
            end

            cuisine_tags1 = recipe["cuisines"].map do |cuisine|
                tag = Tag.find_or_create_by(name: cuisine, cuisine?: true)
            end 

            Recipe.create!(
            is_starter?: true,
            name: recipe["title"],
            description: recipe["summary"],
            serving_size: recipe["servings"],
            image_url: recipe["image"],
            instructions: 
                recipe["analyzedInstructions"][0]["steps"].map do |step|
                    "Step #{step["number"]}: #{step["step"]}"
                end.join("\n"),
            ingredients: 
                recipe["extendedIngredients"].map do |ingredient|
                    ingredient["originalString"]
                end.join("\n"),
            tags: 
                cuisine_tags1 + diet_tags1
        )
        end

        # Korean recipes

        response3 = RestClient.get("https://api.spoonacular.com/recipes/complexSearch?apiKey=268fdcae8c61449b81b0956a696f6b04&addRecipeInformation=true&fillIngredients=true&cuisine=Korean")
        kr = JSON.load(response3)

        kr["results"][7..11].each do |recipe|
            diet_tags1 = []
            if recipe["vegetarian"] == true
                 diet_tags1 << vg
            end
            if recipe["glutenFree"] == true
                diet_tags1 << gf
            end
            if recipe["dairyFree"] == true
                diet_tags1 << df
            end

            cuisine_tags1 = recipe["cuisines"].map do |cuisine|
                tag = Tag.find_or_create_by(name: cuisine, cuisine?: true)
            end 

            Recipe.create!(
            is_starter?: true,
            name: recipe["title"],
            description: recipe["summary"],
            serving_size: recipe["servings"],
            image_url: recipe["image"],
            instructions: 
                recipe["analyzedInstructions"][0]["steps"].map do |step|
                    "Step #{step["number"]}: #{step["step"]}"
                end.join("\n"),
            ingredients: 
                recipe["extendedIngredients"].map do |ingredient|
                    ingredient["originalString"]
                end.join("\n"),
            tags: 
                cuisine_tags1 + diet_tags1
        )
        end

        kr["results"][0..2].each do |recipe|
            diet_tags1 = []
            if recipe["vegetarian"] == true
                 diet_tags1 << vg
            end
            if recipe["glutenFree"] == true
                diet_tags1 << gf
            end
            if recipe["dairyFree"] == true
                diet_tags1 << df
            end

            cuisine_tags1 = recipe["cuisines"].map do |cuisine|
                tag = Tag.find_or_create_by(name: cuisine, cuisine?: true)
            end 

            Recipe.create!(
            is_starter?: true,
            name: recipe["title"],
            description: recipe["summary"],
            serving_size: recipe["servings"],
            image_url: recipe["image"],
            instructions: 
                recipe["analyzedInstructions"][0]["steps"].map do |step|
                    "Step #{step["number"]}: #{step["step"]}"
                end.join("\n"),
            ingredients: 
                recipe["extendedIngredients"].map do |ingredient|
                    ingredient["originalString"]
                end.join("\n"),
            tags: 
                cuisine_tags1 + diet_tags1
        )
        end

        # Indian Recipes

        response4 = RestClient.get("https://api.spoonacular.com/recipes/complexSearch?apiKey=268fdcae8c61449b81b0956a696f6b04&addRecipeInformation=true&fillIngredients=true&cuisine=Indian")
        ind = JSON.load(response4)

        ind["results"][0..4].each do |recipe|
            diet_tags1 = []
            if recipe["vegetarian"] == true
                 diet_tags1 << vg
            end
            if recipe["glutenFree"] == true
                diet_tags1 << gf
            end
            if recipe["dairyFree"] == true
                diet_tags1 << df
            end

            cuisine_tags1 = recipe["cuisines"].map do |cuisine|
                tag = Tag.find_or_create_by(name: cuisine, cuisine?: true)
            end 

            Recipe.create!(
            is_starter?: true,
            name: recipe["title"],
            description: recipe["summary"],
            serving_size: recipe["servings"],
            image_url: recipe["image"],
            instructions: 
                recipe["analyzedInstructions"][0]["steps"].map do |step|
                    "Step #{step["number"]}: #{step["step"]}"
                end.join("\n"),
            ingredients: 
                recipe["extendedIngredients"].map do |ingredient|
                    ingredient["originalString"]
                end.join("\n"),
            tags: 
                cuisine_tags1 + diet_tags1
        )
        end

        # Mediterranean recipes

        response5 = RestClient.get("https://api.spoonacular.com/recipes/complexSearch?apiKey=268fdcae8c61449b81b0956a696f6b04&addRecipeInformation=true&fillIngredients=true&cuisine=Mediterranean")
        med = JSON.load(response5)

        med["results"][0..2].each do |recipe|
            diet_tags1 = []
            if recipe["vegetarian"] == true
                 diet_tags1 << vg
            end
            if recipe["glutenFree"] == true
                diet_tags1 << gf
            end
            if recipe["dairyFree"] == true
                diet_tags1 << df
            end

            cuisine_tags1 = recipe["cuisines"].map do |cuisine|
                tag = Tag.find_or_create_by(name: cuisine, cuisine?: true)
            end 

            Recipe.create!(
            is_starter?: true,
            name: recipe["title"],
            description: recipe["summary"],
            serving_size: recipe["servings"],
            image_url: recipe["image"],
            instructions: 
                recipe["analyzedInstructions"][0]["steps"].map do |step|
                    "Step #{step["number"]}: #{step["step"]}"
                end.join("\n"),
            ingredients: 
                recipe["extendedIngredients"].map do |ingredient|
                    ingredient["originalString"]
                end.join("\n"),
            tags: 
                cuisine_tags1 + diet_tags1
        )
        end


        sanam = User.create(name: "Sanam", user_name: "Sanam04", password_digest: BCrypt::Password.create('password'))
        sania = User.create(name: "Sania", user_name: "Saniaz97", password_digest: BCrypt::Password.create('password'))
        christina = User.create(name: "Christina", user_name: "chsohn15", password_digest: BCrypt::Password.create('password'))
        sanam.recipes << [modified_recipe]
        positive_reviews = [
            "It's amazing!",
             "Great ingredients!",
             "A bit bland",
            "Awesome taste!",
            "Wonderful",
            "Will definitely make again",
            "A hit with my family!!",
            "Flavorful!",
            "Delicious!",
            "Fabulous!",
            "Stupendous!",
            "A taste of heaven"
            ]
        negative_reviews = [
            "Took a long time to make, but worth it",
            "Not my taste",
            "Too spicy",
            "Could have been better with some more salt",
            "Didn't look like the picture",
            "Difficult to make",
            "Couldn't find the ingredients",
            "Too mild",
            "Too bland",
            "Takeout would have been better",
            "Not for beginners"
        ]
        20.times do 
            UserRecipe.create(
                user: User.all.sample,
                recipe: Recipe.all.sample,
                review: positive_reviews.sample,
                rating: Faker::Number.within(range: 6..10)
            )
        end

            20.times do 
                UserRecipe.create(
                    user: User.all.sample,
                    recipe: Recipe.all.sample,
                    review: negative_reviews.sample,
                    rating: Faker::Number.within(range: 1..5)
                )
            end

        



