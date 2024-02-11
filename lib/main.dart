import 'package:flutter/material.dart';



void main() {
  runApp(MaterialApp(
    title: "First APP",
    home: HomePage(),
  ));
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 50,
            child: Image.asset("assets/images/frame2.png", width: 100, height: 100),
          ),
          Positioned(
            top: 350,
            left: 160,
            width: 275,
            height: 164,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "    Get",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Cooking",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 450,
            child: Text(
              "Simple way to find Tasty Recipes",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF129575),
              ),
              child: Text(
                "Start Cooking -> ",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    
    );
  }
}
class FoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Food Page"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Hello Jega,",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "What are you cooking today?",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 10.0, right: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 300,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search.",
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                     
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Image.asset(
                        'assets/images/Filter.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            TabBar(
              tabs: [
                Tab(text: 'All'),
                Tab(text: 'Indian'),
                Tab(text: 'Italian'),
                Tab(text: 'Asian'),
                Tab(text: 'Chinese'),
              ],
            ),
            SizedBox(height: 20.0),
            RecipeSection(title: 'Featured Recipes', recipes: [
              RecipeCard(
                title: 'Classic Greek Salad',
                cookTime: '15 Mins',
                rating: 4.5,
                imageUrl: 'assets/images/food_image.png',
                authorName: 's',
                authorImageUrl: 'assets/images/Avatar.png',
              ),
              RecipeCard(
                title: 'Crunchy Nut Coleslaw',
                cookTime: '10 Mins',
                rating: 3.5,
                imageUrl: 'assets/images/food_image.png',
                authorName: 's',
                authorImageUrl: 'assets/images/Avatar.png',
              ),
            ]),
            RecipeSection(title: 'New Recipes', recipes: [
              RecipeCard(
                title: 'Steak with tomato...',
                cookTime: '20 mins',
                rating: 5.0,
                imageUrl: 'assets/images/food_image.png',
                authorName: 'hello',
                authorImageUrl: 'assets/images/Avatar.png',
              ),
              RecipeCard(
                title: 'Pilaf sweet...',
                cookTime: '30 mins',
                rating: 4.0,
                imageUrl: 'assets/images/food_image.png',
                authorName: 's',
                authorImageUrl: 'assets/images/Avatar.png',
              ),
            ]),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  
                },
              ),
              IconButton(
                icon: Icon(Icons.bookmark_border),
                onPressed: () {
                  
                },
              ),
              SizedBox(width: 48),
              IconButton(
                icon: Icon(Icons.notifications_none),
                onPressed: () {
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FoodMenuPage()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.person_outline),
                onPressed: () {
                 
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
   
class CuisineCategoryChip extends StatelessWidget {
  final String label;

  CuisineCategoryChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}



class RecipeCard extends StatelessWidget {
  final String title;
  final String cookTime;
  final double rating;
  final String imageUrl;
  final String authorName;
  final String authorImageUrl;

  RecipeCard({
    required this.title,
    required this.cookTime,
    required this.rating,
    required this.imageUrl,
    required this.authorName,
    required this.authorImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4),
          Row(
            children: [
              ...List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 20,
                );
              }),
              SizedBox(width: 4),
              Text(
                rating.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(authorImageUrl),
                radius: 12,
              ),
              SizedBox(width: 4),
              Text(
                authorName,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.timer, size: 20),
              SizedBox(width: 4),
              Text(
                cookTime,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class NewRecipesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, 
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          RecipeCard(
            title: 'Steak with tomato...',
            cookTime: '20 mins',
            rating: 5.0,
            imageUrl: 'https://example.com/images/steak.jpg',
            authorName: 'James Milner',
            authorImageUrl: 'https://example.com/images/james.jpg',
          ),
          RecipeCard(
            title: 'Pilaf sweet...',
            cookTime: '30 mins',
            rating: 4.0,
            imageUrl: 'https://example.com/images/pilaf.jpg',
            authorName: 'Laura Ipsum',
            authorImageUrl: 'https://example.com/images/laura.jpg',
          ),
          
        ],
      ),
    );
  }
}
class RecipeSection extends StatelessWidget {
  final String title;
  final List<Widget> recipes;

  RecipeSection({required this.title, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: recipes,
          ),
        ),
      ],
    );
  }
}





class FoodMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Menu"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/burger.jpg',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Spicy chicken burger\n with French fries',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          Text('4.0 (13k Reviews)'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Laura Wilson'),
                          Text('Lagos, Nigeria'),
                        ],
                      ),
                      Spacer(),
                      OutlinedButton(
                        onPressed: () {
                          
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => FollowPage()),
                          );
                        },
                        child: Text('Follow'),
                        style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        TabBar(
                          tabs: [
                            Tab(text: 'Ingredient'),
                            Tab(text: 'Procedure'),
                          ],
                        ),
                        SizedBox(
                          height: 200,
                          child: TabBarView(
                            children: [
                              IngredientsList(),
                              Text("Procedure content goes here"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// class IngredientsList extends StatelessWidget {
  
//   @override
//   Widget build(BuildContext context) {
    
//     final ingredients = [
//       {'name': 'Tomatoes', 'quantity': '500g'},
//       {'name': 'Cabbage', 'quantity': '300g'},
//       {'name': 'Taco', 'quantity': '300g'},
//       {'name': 'Slice Bread', 'quantity': '300g'},
     
//     ];

//     return ListView.builder(
//       itemCount: ingredients.length,
//       itemBuilder: (context, index) {
//         final ingredient = ingredients[index];
//         return ListTile(
//           leading: Icon(Icons.food_bank), // Replace with actual image
//           title: Text(ingredient['name']!),
//           trailing: Text(ingredient['quantity']!),
//         );
//       },
//     );
//   }
// }

class IngredientsList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
   
    final ingredients = [
      {'name': 'Tomatoes', 'quantity': '500g', 'image': 'assets/images/tomato.png'}, 
      {'name': 'Cabbage', 'quantity': '300g', 'image': 'assets/images/cabage.png'}, 
      {'name': 'Taco', 'quantity': '300g', 'image': 'assets/images/taco.png'},
      
    ];

    return ListView.builder(
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        final ingredient = ingredients[index];
        return ListTile(
          leading: Image.asset(
            ingredient['image']!,
            width: 50, 
            height: 50, 
            fit: BoxFit.cover,
          ),
          title: Text(ingredient['name']!),
          subtitle: Text(ingredient['quantity']!),
        );
      },
    );
  }
}


class FollowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spicy Chicken Burger'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/burgers.jpg',
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Spicy Chicken Burger with French Fries',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            Text(' 4.40 (13k Reviews)'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.schedule, color: Colors.grey),
                            Text(' 20 min'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    title: Text('Laura Wilson'),
                    subtitle: Text('Lagos, Nigeria'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Follow button logic
                      },
                      child: Text('Follow'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        TabBar(
                          tabs: [
                            Tab(text: 'Procedure'),
                            Tab(text: 'Ingredient'),
                          ],
                        ),
                        Container(
                          height: 400, 
                          child: TabBarView(
                            children: [
                              ProcedureList(), 
                              IngredientList(), 
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProcedureList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    List<String> steps = [
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
      'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...',
      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris...',
      
    ];

    return ListView.builder(
      itemCount: steps.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text('Step ${index + 1}'),
          title: Text(steps[index]),
        );
      },
    );
  }
}

class IngredientList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    List<Map<String, dynamic>> ingredients = [
      {'name': 'Tomatoes', 'quantity': '500g', 'image': 'assets/images/tomato.png'}, 
      {'name': 'Cabbage', 'quantity': '300g', 'image': 'assets/images/cabage.png'}, 
      {'name': 'Taco', 'quantity': '300g', 'image': 'assets/images/taco.png'},
      
    ];

    return ListView.builder(
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        var ingredient = ingredients[index];
        return ListTile(
          leading: Image.asset(
            ingredient['image'],
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(ingredient['name']),
          trailing: Text(ingredient['quantity']),
        );
      },
    );
  }
}