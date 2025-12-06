import 'package:flutter/material.dart';
import 'package:lokee/theme/createPostScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 70.0),
          child: FloatingActionButton(
          
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreatePostScreen(),),
              );
            },
            backgroundColor: Colors.purple,
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'Italic',
          ),
        ),
      ),
     body: SingleChildScrollView(
        child: Column(
          
          children: [

            // ------------------ HEADER -------------------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 5),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF8E2DE2),
                    Color(0xFF4A00E0),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
              ),

              child: Column(
                children: [
                  // Avatar with glow
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Colors.purple.shade200,
                          Colors.white,
                        ],
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 48,
                      backgroundImage: AssetImage("lib/images/M1.png"),
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    "Phinehas Nehemiah",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "@phinex",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      "Creative mobile app designer & Flutter developer. Music lover 🎧 | Tech enthusiast ⚡",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ------------------ STATS ROW -------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _StatTile(number: "245", label: "Friends"),
                  _StatTile(number: "1.2k", label: "Followers"),
                  _StatTile(number: "398", label: "Following"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Edit button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 14),
              ),
              child: const Text(
                "Edit Profile",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),

            const SizedBox(height: 30),

            // ------------------ ABOUT CARD -------------------
            _profileCard(
              title: "About",
              icon: Icons.info_outline,
              content:
                  "Passionate about creating beautiful interfaces. Exploring AI and building meaningful experiences.",
            ),

            // ------------------ INTERESTS CARD -------------------
            _profileCard(
              title: "Interests",
              icon: Icons.favorite_border,
              content: "Music, UI Design, Crypto, Photography, Travel",
            ),

            // ------------------ PHOTOS CARD -------------------
            _profileCard(
              title: "Photos",
              icon: Icons.photo_outlined,
              content: "Uploaded photos will appear here.",
            ),

            // ------------------ ACTIVITY CARD -------------------
            _profileCard(
              title: "Recent Activity",
              icon: Icons.history,
              content: "You haven’t posted any activity yet.",
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------
// STAT TILE WIDGET
// -----------------------------------
class _StatTile extends StatelessWidget {
  final String number;
  final String label;

  const _StatTile({
    super.key,
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}

// -----------------------------------
// PROFILE CARD WIDGET
// -----------------------------------
Widget _profileCard({
  required String title,
  required IconData icon,
  required String content,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: const Color(0xFFF5F0FF),
      borderRadius: BorderRadius.circular(22),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.purple.shade700),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          content,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black54,
          ),
        ),
      ],
    ),
  );
}
