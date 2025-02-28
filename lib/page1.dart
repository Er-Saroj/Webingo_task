// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kolkata/2nd.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _selectedDay = 25;

  final List<Map<String, String>> _weekDays = [
    {'day': 'Sun', 'date': '22'},
    {'day': 'Mon', 'date': '23'},
    {'day': 'Tue', 'date': '24'},
    {'day': 'Wed', 'date': '25'},
    {'day': 'Thu', 'date': '26'},
    {'day': 'Fri', 'date': '27'},
    {'day': 'Sat', 'date': '28'},
  ];

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(size),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDailyChallenge(size),
                      SizedBox(height: size.height * 0.02),
                      _buildWeekCalendar(size),
                      SizedBox(height: size.height * 0.02),
                      _buildPlanSection(size),
                    ],
                  ),
                ),
              ),
            ),
            _buildBottomNav(size),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(Size size) {
    return Container(
      padding: EdgeInsets.all(size.width * 0.04),
      child: Row(
        children: [
          Hero(
            tag: 'profile',
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: size.width * 0.06,
                backgroundImage: NetworkImage(
                    'https://mastdp.com/img/cute-dp-for-girls/cute-girls-pictures-downloads.webp'),
              ),
            ),
          ),
          SizedBox(width: size.width * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hello, Sandra',
                  style: TextStyle(
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Today 25 Nov.',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: size.width * 0.035,
                  ),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: size.width * 0.052,
            backgroundColor: Colors.grey.shade300,
            child: CircleAvatar(
              radius: size.width * 0.05,
              backgroundColor: Colors.white,
              child: IconButton(
                icon: Icon(Icons.search, size: size.width * 0.06),
                onPressed: () {
                  // showSearch(context: context, delegate: CustomSearchDelegate());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyChallenge(Size size) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Second_page()));
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(size.width * 0.05),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 176, 167, 228),
          borderRadius: BorderRadius.circular(size.width * 0.05),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daily\nchallenge',
              style: TextStyle(
                fontSize: size.width * 0.07,
                fontWeight: FontWeight.bold,
                height: 1.1,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              'Do your plan before 9:00 AM',
              style: TextStyle(fontSize: size.width * 0.035),
            ),
            SizedBox(height: size.height * 0.02),
            _buildParticipants(size),
          ],
        ),
      ),
    );
  }

  Widget _buildParticipants(Size size) {
    return Row(
      children: [
        for (int i = 0; i < 3; i++)
          Transform.translate(
            offset: Offset(-i * (size.width * 0.02), 0),
            child: CircleAvatar(
              radius: size.width * 0.04,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: size.width * 0.037,
                backgroundImage: NetworkImage(
                    'https://mastdp.com/img/cute-dp-for-girls/cute-girls-pictures-downloads.webp'),
              ),
            ),
          ),
        // CircleAvatar(

        //   backgroundColor: Colors.deepPurple,
        //   radius: size.width * 0.04,
        //   child: Text(
        //     '+4',
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: size.width * 0.035,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget _buildWeekCalendar(Size size) {
    return Container(
      height: size.height * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _weekDays.length,
        itemBuilder: (context, index) {
          final day = _weekDays[index];
          final isSelected = int.parse(day['date']!) == _selectedDay;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDay = int.parse(day['date']!);
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03,
                vertical: size.height * 0.01,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                    color: isSelected ? Colors.black : Colors.grey.shade600),
                color: isSelected ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(size.width * 0.08),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: isSelected ? Colors.white : Colors.black,
                    radius: 3,
                  ),
                  Text(
                    day['day']!,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black54,
                      fontSize: size.width * 0.035,
                    ),
                  ),
                  Text(
                    day['date']!,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPlanSection(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your plan',
          style: TextStyle(
            fontSize: size.width * 0.06,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: size.height * 0.02),
        SizedBox(
          height: 233,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: _buildActivityCard(
                  size,
                  title: 'Yoga Group',
                  date: '25 Nov.',
                  time: '14:00-15:00',
                  room: 'A5 room',
                  level: 'Medium',
                  color: Color.fromARGB(255, 253, 203, 111),
                ),
              ),
              SizedBox(width: size.width * 0.015),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBalanceCard(size),
                    SizedBox(height: size.height * 0.01),
                    _buildSocialCard(size),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNav(Size size) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        // margin: EdgeInsets.all(size.width * 0.04),
        // padding: EdgeInsets.symmetric(
        //    horizontal: size.width * 0.01,
        //   //  vertical: size.height * 0.01,
        // ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(size.width * 0.09),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(Icons.home, 0, size),
            _buildNavItem(Icons.grid_view, 1, size),
            _buildNavItem(Icons.bar_chart, 2, size),
            _buildNavItem(Icons.person_outline, 3, size),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index, Size size) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.all(size.width * 0.05),
          decoration: BoxDecoration(
            color: _selectedIndex == index ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(size.width * 0.08),
          ),
          child: Icon(
            icon,
            color: _selectedIndex == index
                ? Colors.black
                : Colors.white.withOpacity(0.5),
            size: size.width * 0.06,
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceCard(Size size) {
    return Container(
      height: 150,

      //  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 45),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 155, 215, 232),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20.0, bottom: 20, left: 15, right: 75),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03,
                vertical: size.height * 0.002,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(size.width * 0.03),
              ),
              child: Text(
                textAlign: TextAlign.start,
                "Light",
                style: TextStyle(fontSize: size.width * 0.030),
              ),
            ),
            Text(
              'Balance',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text('28 Nov.',
                style: TextStyle(
                  fontSize: size.width * 0.035,
                )),
            Text('18:00-19:30',
                style: TextStyle(
                  fontSize: size.width * 0.035,
                )),
            Text('A2 room',
                style: TextStyle(
                  fontSize: size.width * 0.035,
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialCard(Size size) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 248, 175, 250),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
              backgroundColor: Colors.black12,
              radius: 17,
              child: CircleAvatar(
                  radius: 13,
                  backgroundColor: Colors.white,
                  child: Icon(
                    FontAwesomeIcons.instagram,
                    size: 16,
                    color: Color.fromARGB(255, 240, 173, 208),
                  ))),
          CircleAvatar(
              backgroundColor: Colors.black12,
              radius: 17,
              child: CircleAvatar(
                  radius: 13,
                  backgroundColor: Colors.white,
                  child: Icon(FontAwesomeIcons.youtube,
                      size: 15, color: Color.fromARGB(255, 240, 173, 208)))),
          CircleAvatar(
              backgroundColor: Colors.black12,
              radius: 17,
              child: CircleAvatar(
                  radius: 13,
                  backgroundColor: Colors.white,
                  child: Icon(
                    FontAwesomeIcons.twitter,
                    size: 15,
                    color: Color.fromARGB(255, 240, 173, 208),
                  ))),
        ],
      ),
    );
  }
}

// Additional helper widgets...
Widget _buildActivityCard(
  Size size, {
  required String title,
  required String date,
  required String time,
  required String room,
  required String level,
  required Color color,
}) {
  return Container(
    padding: EdgeInsets.all(size.width * 0.04),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(size.width * 0.05),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.02,
            vertical: size.height * 0.002,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(size.width * 0.03),
          ),
          child: Text(
            level,
            style: TextStyle(fontSize: size.width * 0.030),
          ),
        ),
        SizedBox(height: size.height * 0.02),
        Text(
          title,
          style: TextStyle(
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Text(date, style: TextStyle(fontSize: size.width * 0.035)),
        Text(time, style: TextStyle(fontSize: size.width * 0.035)),
        Text(room, style: TextStyle(fontSize: size.width * 0.035)),
        SizedBox(height: size.height * 0.05),
        Row(
          children: [
            CircleAvatar(
              radius: size.width * 0.04,
              backgroundImage: NetworkImage(
                  'https://mastdp.com/img/cute-dp-for-girls/cute-girls-pictures-downloads.webp'),
            ),
            SizedBox(width: size.width * 0.02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trainer',
                  style: TextStyle(fontSize: size.width * 0.025),
                ),
                Text(
                  'Tiffany Way',
                  style: TextStyle(
                    fontSize: size.width * 0.035,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
