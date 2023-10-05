import 'package:flutter/material.dart';
import 'package:smvm/Donation.dart';
import 'package:smvm/Education.dart';
import 'package:smvm/MentalHealth.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/donate': (context) => Donation(), // Define the DonatePage route
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMVM NGO'),
        backgroundColor:
            Colors.cyan[600], // Change this color to your preferred cyan shade
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Colors.cyan, // Cyan background color
              padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Welcome to SMVM NGO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Help us make a difference!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Donation()));
                      // Handle donation button press
                    },
                    child: const Text('Donate'),
                  ),
                ],
              ),
            ),
            Container(
              height: 100.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CurvedIconButton(
                    icon: Icons.home,
                    text: 'All',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
                      // Navigate to 'All' page
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CurvedIconButton(
                    icon: Icons.school,
                    text: 'E',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Education(),
                        ),
                      );
                      // Navigate to 'Education' page
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CurvedIconButton(
                    icon: Icons.favorite,
                    text: 'M',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MentalHealth(),
                        ),
                      );
                      // Navigate to 'Mental Health' page
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CurvedIconButton(
                    icon: Icons.vrpano,
                    text: 'AR',
                    onPressed: () {
                      // Navigate to 'AR/VR' page
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            CurvedSection(),
          ],
        ),
      ),
    );
  }
}

class CurvedIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? onPressed;

  CurvedIconButton(
      {required this.icon, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color:
                Colors.cyan, // Change this color to your preferred cyan shade
            borderRadius: BorderRadius.circular(50.0),
          ),
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(width: 8.0),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurvedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[50], // Background color for the curved section
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          CurvedCardWithImage(
            image: 'assets/images/ic_logo.jpeg', // Replace with your image path
            text: 'Supporting Education',
          ),
          CurvedCardWithImage(
            image: 'assets/images/ic_logo.jpeg', // Replace with your image path
            text: 'Awarness campaign',
          ),
          CurvedCardWithImage(
            image: 'assets/images/ic_logo.jpeg', // Replace with your image path
            text: 'Healthcare Outreach',
          ),
          CurvedCardWithImage(
            image: 'assets/images/ic_logo.jpeg', // Replace with your image path
            text: 'Community Building',
          ),
        ],
      ),
    );
  }
}

class CurvedCardWithImage extends StatelessWidget {
  final String image;
  final String text;

  CurvedCardWithImage({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 4.0,
      margin: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
            child: Image.asset(
              image,
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
