import 'package:flutter/material.dart';
import '../models/planet.dart';

class DetailsScreen extends StatelessWidget {
  final Planet planet;

  const DetailsScreen({
    super.key,
    required this.planet,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202020),

      appBar: AppBar(
        backgroundColor: const Color(0xff202020),
        foregroundColor: Colors.white,
        title: Text(
          planet.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Planet Image
              Center(
                child: Image.asset(
                  planet.image,
                  height: 220,
                  width: 220,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 20),

              // Planet Name
              Text(
                planet.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              // Title
              Text(
                planet.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // About
              Text(
                planet.about,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 25),

              // Information
              _infoRow(
                "Distance from Sun",
                "${planet.distanceFromSun} km",
              ),

              _infoRow(
                "Length of Day",
                "${planet.lengthOfDay} hours",
              ),

              _infoRow(
                "Orbital Period",
                "${planet.orbitalPeriod} Earth years",
              ),

              _infoRow(
                "Radius",
                "${planet.radius} km",
              ),

              _infoRow(
                "Mass",
                "${planet.mass} kg",
              ),

              _infoRow(
                "Gravity",
                "${planet.gravity} m/s²",
              ),

              _infoRow(
                "Surface Area",
                "${planet.surfaceArea} km²",
              ),

              const SizedBox(height: 25),

              // 3D Model Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // 3D Model هنضيفه هنا بعدين
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfff83d3d),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    "Explore 3D Model",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ),

          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}