import 'package:flutter/material.dart';

class FeedsLayout extends StatelessWidget {
  const FeedsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [

        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 0),   // ← removes padding
          leading: CircleAvatar(
            backgroundImage: AssetImage('lib/images/Mary (2).jpg'),
          ),
          title: Text('John Doe'),
          subtitle: Text('This is a sample feed item.'),
        ),
        Divider(),

        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          leading: CircleAvatar(
            backgroundImage: AssetImage('lib/images/adobe1.png'),
          ),
          title: Text('Jane Smith'),
          subtitle: Text('Another example of a feed item.'),
        ),
        Divider(),

        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          leading: CircleAvatar(
            backgroundImage: AssetImage('lib/images/M1.png'),
          ),
          title: Text('Phinex'),
          subtitle: Text('Another example of a feed item.'),
        ),
         Divider(),

        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          leading: CircleAvatar(
            backgroundImage: AssetImage('lib/images/M1.png'),
          ),
          title: Text('Phinex'),
          subtitle: Text('Another example of a feed item.'),
        ),
         Divider(),

        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          leading: CircleAvatar(
            backgroundImage: AssetImage('lib/images/M1.png'),
          ),
          title: Text('Phinex'),
          subtitle: Text('Another example of a feed item.'),
        ),
         Divider(),

        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          leading: CircleAvatar(
            backgroundImage: AssetImage('lib/images/M1.png'),
          ),
          title: Text('Phinex'),
          subtitle: Text('Another example of a feed item.'),
        ),
         Divider(),

        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          leading: CircleAvatar(
            backgroundImage: AssetImage('lib/images/M1.png'),
          ),
          title: Text('Phinex'),
          subtitle: Text('Another example of a feed item.'),
        ),
         Divider(),

        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          leading: CircleAvatar(
            backgroundImage: AssetImage('lib/images/M1.png'),
          ),
          title: Text('Phinex'),
          subtitle: Text('Another example of a feed item.'),
        ),
         Divider(),

        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          leading: CircleAvatar(
            backgroundImage: AssetImage('lib/images/M1.png'),
          ),
          title: Text('Phinex'),
          subtitle: Text('Another example of a feed item.'),
        ),
      ],
    );
  }
}
