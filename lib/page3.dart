import 'package:flutter/material.dart';



class CinemaSeatScreen extends StatefulWidget {
  @override
  _CinemaSeatScreenState createState() => _CinemaSeatScreenState();
}

class _CinemaSeatScreenState extends State<CinemaSeatScreen> {
  List<List<int>> seats = [
    [0, 2, 0, 0, 0, 1],
    [0, 0, 0, 0, 0, 0],
    [0, 1, 0, 0, 2, 0],
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 1],
    [0, 1, 0, 0, 2, 0],
    [0, 0, 0, 0, 0, 0],
  ];

  void toggleSeat(int row, int col) {
    if (seats[row][col] == 1) return; // Skip reserved seats

    setState(() {
      seats[row][col] = (seats[row][col] == 2) ? 0 : 2; // Toggle selection
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAE7DA),
      body: Column(
        children: [
          const HeaderSection(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_back),
                      Text(
                        "  Choose Searts",
                        style: TextStyle(
                            fontSize: 29, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  for (int row = 0; row < seats.length; row++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int col = 0; col < seats[row].length; col++)
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: GestureDetector(
                              onTap: () => toggleSeat(row, col),
                              child: SeatWidget(status: seats[row][col]),
                            ),
                          ),
                      ],
                    ),
                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SeatLegend(color: Colors.purple, label: 'Selected'),
                      SeatLegend(color: Colors.black, label: 'Reserved'),
                      SeatLegend(color: Colors.grey, label: 'Available'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const BottomBookingDetails(),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFDDF048), Color(0xFFEAE7DA)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
          ),
          const SizedBox(width: 10),
          const Text(
            'Samantha',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class SeatWidget extends StatelessWidget {
  final int status; // 0: Available, 1: Reserved, 2: Selected

  const SeatWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color seatColor;
    switch (status) {
      case 1:
        seatColor = Colors.black;
        break;
      case 2:
        seatColor = Colors.purple;
        break;
      default:
        seatColor = Colors.grey[400]!;
    }
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: seatColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

class SeatLegend extends StatelessWidget {
  final Color color;
  final String label;

  const SeatLegend({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 5),
          Text(label),
        ],
      ),
    );
  }
}

class BottomBookingDetails extends StatelessWidget {
  const BottomBookingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 15),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.location_on, color: Colors.white),
              Text(' Cinema Max',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('08.04'
            ,                     style: TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w500)),
                        Text('Date',
                        style: TextStyle(color: Colors.white70)),
                        
                  ],
                ),
                Container(
                  
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21.0,vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('21:55'
                    ,                     style: TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w500)),
                            Text('Hour',
                            style: TextStyle(color: Colors.white70)),
                            
                      ],
                    ),
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('2,3'
            ,                     style: TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w500)),
                        Text('Seats',
                        style: TextStyle(color: Colors.white70)),
                        
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('2,5'
            ,                     style: TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w500)),
                        Text('Row',
                        style: TextStyle(color: Colors.white70)),
                        
                  ],
                ),
              ],
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Price",style: TextStyle(color: Colors.white),),
                  const Text('\$35.50',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                width: 150,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 181, 134, 190),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text('Buy', style: TextStyle(color: Colors.deepPurple,fontSize: 16)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
