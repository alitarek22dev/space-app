import 'package:flutter/material.dart';
import '../data/planets_data.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPlanet = 3;

  void nextPlanet() {
    setState(() {
      if (currentPlanet < planets.length - 1) {
        currentPlanet++;
      }
    });
  }

  void previousPlanet() {
    setState(() {
      if (currentPlanet > 0) {
        currentPlanet--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final planet = planets[currentPlanet];

    return Scaffold(
      backgroundColor: const Color(0xff202020),

      body: SafeArea(
        child: Center(
          child: Container(
            width: 190,
            height: 400,
            decoration: BoxDecoration(
              color: const Color(0xff090909),
              borderRadius: BorderRadius.circular(28),
            ),

            child: Column(
              children: [

                // Top image
                Container(
                  height: 95,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/frame.png.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),

                  child: const Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        "Explore",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Question
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Which planet\nwould you like to explore?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // Planet image
                Expanded(
                  child: Image.asset(
                    planet.image,
                    width: 125,
                    fit: BoxFit.contain,
                  ),
                ),

                // Planet name + arrows
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      _arrowButton(
                        icon: Icons.arrow_back,
                        onPressed: previousPlanet,
                      ),

                      Text(
                        planet.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      _arrowButton(
                        icon: Icons.arrow_forward,
                        onPressed: nextPlanet,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Explore button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 32,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              planet: planet,
                            ),
                          ),
                        );
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfff83d3d),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),

                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding:
                                const EdgeInsets.only(left: 12),
                            child: Text(
                              "Explore ${planet.name}",
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const Padding(
                            padding:
                                EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _arrowButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 21,
        height: 21,
        decoration: const BoxDecoration(
          color: Color(0xfff83d3d),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 13,
        ),
      ),
    );
  }
}