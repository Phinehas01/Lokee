import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Chats",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          bottom: const TabBar(
            
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black54,
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            indicatorColor: Colors.black87,
            indicatorWeight: 3,
            tabs: [
              Tab(text: "Active"),
              Tab(text: "Recommended"),
            ],
          ),
        ),
        
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBarView(
          
            children: [
          
              // Active page — uses chatTile defined below
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  
                  chatTile(
                    name: "Jade",
                    subtitle: "Music",
                    messageType: ChatMessageType.music,
                    image: "lib/images/M1.png",
                    isActive: true,
                  ),
                  chatTile(
                    name: "Emma",
                    subtitle: "Hey! How’s it going?",
                    image: "lib/images/adobe1.png",
                  ),
                  chatTile(
                    name: "Alex",
                    subtitle: "Yesterday",
                    image: "lib/images/Mary2.png",
                  ),
                  chatTile(
                    name: "Matthew",
                    subtitle: "Sounds good! 👍",
                    image: "lib/images/Mary2.png",
                  ),
                  chatTile(
                    name: "Matthew",
                    subtitle: "Sounds good! 👍",
                    image: "lib/images/Mary2.png",
                  ),
                  chatTile(
                    name: "Matthew",
                    subtitle: "Sounds good! 👍",
                    image: "lib/images/Mary4.png",
                  ),
                ],
              ),
          
              // Recommended page (empty for now)
              const Center(
                child: Text(
                  "No recommendations yet",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black45,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// -- Add these below the ChatScreen class in the same file --

enum ChatMessageType { music, text }

Widget chatTile({
  required String name,
  required String subtitle,
  required String image,
  bool isActive = false,
  ChatMessageType messageType = ChatMessageType.text,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    decoration: BoxDecoration(
      color: const Color(0xFFF7F5FF), // soft purple background
      borderRadius: BorderRadius.circular(22),
    ),
    child: Row(
      children: [
        // Avatar + active dot
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage(image),
            ),
            if (isActive)
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
          ],
        ),

        const SizedBox(width: 14),

        // Name + Subtitle
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  if (isActive)
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Text(
                        "Active",
                        style: TextStyle(
                          color: Colors.green[600],
                          fontSize: 14,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              if (messageType == ChatMessageType.music)
                Row(
                  children: [
                    const Icon(Icons.music_note, size: 18, color: Colors.black54),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    )
                  ],
                )
              else
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
            ],
          ),
        ),

        const Icon(Icons.arrow_forward_ios_rounded, size: 20, color: Colors.black38),
      ],
    ),
  );
}
