import 'package:adhicine/Report/report.dart';
import 'package:adhicine/add_medicines/add_med.dart';
import 'package:adhicine/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();

  List<DateTime> getDates() {
    DateTime now = DateTime.now();
    return List.generate(6, (index) => now.subtract(Duration(days: 2 - index)));
  }

  void moveLeft() {
    setState(() {
      selectedDate = selectedDate.subtract(const Duration(days: 1));
    });
  }

  void moveRight() {
    setState(() {
      selectedDate = selectedDate.add(const Duration(days: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> dates = getDates();
    int selectedIndex = dates.indexWhere((date) =>
        date.day == selectedDate.day &&
        date.month == selectedDate.month &&
        date.year == selectedDate.year);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: const EdgeInsets.only(top: 55.0, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Hi Harry!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.medical_services,
                      color: Color(0xFF3176AF),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => const Profile()),
                      );
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage("assets/adhicine.png"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, top: 5),
            child: Text(
              "5 minutes left",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  DateTime date = dates[index];
                  bool isSelected = date.day == selectedDate.day &&
                      date.month == selectedDate.month &&
                      date.year == selectedDate.year;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDate = date;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? Colors.teal[900] : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isSelected
                                ? DateFormat('EEEE,  ').format(date)
                                : DateFormat('E').format(date),
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          if (isSelected)
                            Text(
                              DateFormat('MMM d').format(date),
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 125, left: 60, right: 60),
            child: Image.asset("assets/BOX.png"),
          ),
          const Center(
            child: Text(
              "Nothing is Here, Add a Medicine",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.home,
                      color: Color(0xFF3176AF),
                    ),
                    onPressed: () {},
                    padding: const EdgeInsets.all(0),
                  ),
                  const Text("Home"),
                ],
              ),
              const SizedBox(width: 20), // Space in the middle
              Column(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.bar_chart,
                      color: Color(0xFF3176AF),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => const Report()),
                      );
                    },
                    padding: const EdgeInsets.all(0),
                  ),
                  const Text("Report")
                ],
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}
