// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:kolkata/page3.dart';

class Second_page extends StatefulWidget {
  const Second_page({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Second_page> {
  int _currentIndex = 0;
  TextEditingController _controller = TextEditingController();
  bool _isEditing = false; // Track if user has started typing
  bool _isFavorite = false;

  final List<Map<String, String>> items = [
    {
      'image':
          'https://www.gingerhotels.com/resourcefiles/dining-snippet-image/ginger-udaipur-facade.jpg',
      'image2':
          'https://www.godsavethepoints.com/wp-content/uploads/2019/07/fairmont_tony_bennett_suite-3.jpeg',
      'description': 'A beautiful stay in Udaipur.',
    },
    {
      'image':
          'https://media-cdn.tripadvisor.com/media/photo-s/0e/50/c6/82/hotel-exterior-night.jpg',
      'image2':
          'https://media-cdn.tripadvisor.com/media/photo-s/08/df/5e/d6/vivanta-by-taj-whitefield.jpg',
      'description': 'Luxury and comfort in one place.',
    },
    {
      'image':
          'https://www.gingerhotels.com/resourcefiles/dining-snippet-image/ginger-udaipur-facade.jpg',
      'image2':
          'https://www.shutterstock.com/shutterstock/photos/88273972/display_1500/stock-photo-illuminated-hotel-sign-taken-at-night-88273972.jpg',
      'description': 'A beautiful stay in Udaipur.',
    },
  ];
  @override
  void initState() {
    super.initState();
    _controller.text = ''; // Set empty initially
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildDiscoverPage(),
          _buildPlaceholderPage('Favorites'),
          _buildPlaceholderPage('Bookings'),
          _buildPlaceholderPage('Messages'),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildDiscoverPage() {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Positioned(bottom: 0, left: 0, right: 0, child: Text("bottom")),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Background Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(31),
                    child: Image.network(
                      'https://media-cdn.tripadvisor.com/media/photo-s/0e/50/c6/82/hotel-exterior-night.jpg',
                      fit: BoxFit.cover,
                      height: 240,
                      width: double.infinity,
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      // Header
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 14,
                                  color: Colors.white
                                ),
                                const Text(' Norway',
                                    style: TextStyle(fontSize: 12,color: Colors.white
                                    )),
                              ],
                            ),
                            Icon(Icons.person_pin,
                                color: Colors.white, size: 25),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),
                      // Welcome Text
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Hey, Martin! Tell us where you\nwant to go',
                          style: TextStyle(
                            color: Colors.white,
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: TextField(
                          controller: _controller,
                          onTap: () {
                            if (!_isEditing) {
                              setState(() {
                                _controller
                                    .clear(); // Clear text when tapped for first time
                                _isEditing = true; // Set editing to true
                              });
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.5),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.search, color: Colors.white),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        _isEditing
                                            ? ''
                                            : 'Search places', // Hide text when editing
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      Text(
                                        _isEditing
                                            ? ''
                                            : 'Date range • Number of guests', // Hide text when editing
                                        style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ],
              ),

              const Padding(
                padding: EdgeInsets.only(left: 16, top: 12, bottom: 8),
                child: Text(
                  textAlign: TextAlign.left,
                  'The most relevant',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),

              SizedBox(
                height: 305,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return _buildPropertyCard(
                      index,
                    );
                  },
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 16, top: 8),
                child: Text(
                  textAlign: TextAlign.left,
                  'Discover new places',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),

              const SizedBox(height: 12),
              // Discover new places cards
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 150,
                      margin: const EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: NetworkImage(items[index]['image']!),
                          // NetworkImage(
                          //     'https://www.gingerhotels.com/resourcefiles/dining-snippet-image/ginger-udaipur-facade.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyCard(int index) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CinemaSeatScreen()));
      },
      child: Container(
        width: 310,
        margin: EdgeInsets.only(
          left: index == 0 ? 16 : 8,
        ),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Property Image
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(21),
                    child: Image.network(
                      items[index]['image2']!,
                      // 'https://www.godsavethepoints.com/wp-content/uploads/2019/07/fairmont_tony_bennett_suite-3.jpeg',
                      height: 210,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 16,
                    top: 16,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isFavorite = !_isFavorite; // Toggle state
                        });
                      },
                      child: CircleAvatar(
                          backgroundColor:
                              _isFavorite ? Colors.white : Colors.black38,
                          child: Icon(
                            _isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: _isFavorite ? Colors.red : Colors.white,
                          )),
                    ),
                  ),
                ],
              ),

              // Property Details
              Padding(
                padding: const EdgeInsets.all(11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Tiny home in Rœlingen',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Row(
                          children: const [
                            Icon(Icons.star, size: 16, color: Colors.black),
                            Text(' 4.96 (217)',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '4 guests • 2 bedrooms • 2 beds • 1 bathroom',
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 98, 98), fontSize: 11),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 14),
                        children: [
                          TextSpan(
                            text: '€117 ',
                            style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: '€91 night •',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: ' €273 total',
                            style: TextStyle(
                              fontSize: 12,
                              // decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholderPage(String title) {
    return Center(
      child: Text(title, style: const TextStyle(fontSize: 24)),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: 'Messages',
            ),
          ],
        ),
      ),
    );
  }
}
