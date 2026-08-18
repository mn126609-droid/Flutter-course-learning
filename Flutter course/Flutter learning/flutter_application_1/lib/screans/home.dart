// Home file
import 'package:flutter/material.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isMan = true;
  double height = 170;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.black,
          ),
          child: Text(
            'Home Page',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: .center,
          spacing: 16,
          children: [
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() => isMan = true);
                    },
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: isMan ? Colors.redAccent : Colors.white24,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      alignment: Alignment.center,
                      child: Icon(Icons.male, color: Colors.white, size: 100),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isMan = false;
                      });
                    },
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: (isMan) ? Colors.white24 : Colors.red,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      alignment: Alignment(0, 0),
                      child: Icon(Icons.female, color: Colors.white, size: 100),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Card(
                color: Colors.white24,
                child: Column(
                  children: [
                    Text(
                      '${height.toInt()} cm',
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    Slider(
                      value: height,
                      min: 140,
                      max: 200,
                      onChanged: (newheight) {
                        setState(() {
                          height = newheight;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white70,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Profile()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculate',
          ),
        ],
      ),
    );
  }
}
