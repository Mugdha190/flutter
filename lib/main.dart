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
                      // Add your filter logic here
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Image.asset(
                        'assets/images/Filter.png',
                        width: 30,
                        height: 30,
                        // color: Colors.green,
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
            Expanded(
              child: TabBarView(
                children: [
                  // Content for Tab 1
                  buildFoodGrid([
                    {"image": "food_image.png", "name": "Classic Greek Salad"},
                    {"image": "food_image.png", "name": "Crunchy Nut Coleslaw"},
                    // {"image": "food_image.png", "name": "Special Dish"},
                  ]),
                  // Content for Tab 2
                  Center(
                    child: Text("Indian"),
                  ),
                  Center(
                    child: Text("Italian"),
                  ),
                  Center(
                    child: Text("Asian"),
                  ),
                  Center(
                    child: Text("Chinese"),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.blue),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat, color: Colors.blue),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.blue),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications, color: Colors.blue),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.blue),
              label: 'Favorite',
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(top: 65.0),
          child: FloatingActionButton(
            onPressed: () {},
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/Avatar.png'),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      ),
    );
  }

  Widget buildFoodGrid(List<Map<String, String>> items) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return buildFoodItem(items[index]["image"], items[index]["name"]);
      },
    );
  }

  Widget buildFoodItem(String? imagePath, String? foodName) {
    imagePath ??= "default_image.png"; 
    foodName ??= "Unknown Food"; 

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/food_image.png',
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              foodName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "5 mins",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 120.0), 
              Icon(Icons.access_time, color: Colors.grey, size: 16.0), 
            ],
          ),
        ),
        ],
      ),
    );
  }
}