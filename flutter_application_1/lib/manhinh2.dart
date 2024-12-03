import 'package:flutter/material.dart';

void main() {
  runApp(GuideApp());
}

class GuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(), // Màn hình chính là HomeScreen
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}


class GuideListScreen extends StatelessWidget {
  final List<Guide> guides = [
    Guide(
      name: 'Cristiano Ronaldo',
      location: 'Danang, Vietnam',
      imagePath: 'assets/7.jpg',
      rating: 4,
      reviewCount: 777,
    ),
    Guide(
      name: 'Cristiano Ronaldo',
      location: 'Hanoi, Vietnam',
      imagePath: 'assets/Siuuuu.jpg',
      rating: 5,
      reviewCount: 77,
    ),
    Guide(
      name: 'Cristiano Ronaldo',
      location: 'Danang, Vietnam',
      imagePath: 'assets/17.jpg',
      rating: 4.5,
      reviewCount: 777,
    ),
    Guide(
      name: 'Cristiano Ronaldo',
      location: 'Ho Chi Minh, Vietnam',
      imagePath: 'assets/27.jpg',
      rating: 3.5,
      reviewCount: 777,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildGuideHeader(),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildGuideGrid(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuideHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Guides in Danang',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'SEE MORE',
            style: TextStyle(color: Colors.teal, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildGuideGrid(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 3 / 4,
      ),
      itemCount: guides.length,
      itemBuilder: (context, index) {
        final guide = guides[index];
        return GuideCard(guide: guide);
      },
    );
  }
  }
class Guide {
  final String name;
  final String location;
  final String imagePath;
  final double rating;
  final int reviewCount;

  Guide({
    required this.name,
    required this.location,
    required this.imagePath,
    required this.rating,
    required this.reviewCount,
  });
}

class GuideCard extends StatelessWidget {
  final Guide guide;

  const GuideCard({Key? key, required this.guide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GuideDetailScreen(guide: guide)),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  guide.imagePath,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8),
              Text(
                guide.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.location_on, size: 14, color: Colors.teal),
                  SizedBox(width: 4),
                  Text(
                    guide.location,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Row(
                    children: List.generate(
                      guide.rating.round(),
                      (index) => Icon(Icons.star, size: 16, color: Colors.amber),
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '${guide.reviewCount} Reviews',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GuideDetailScreen extends StatelessWidget {
  final Guide guide;

  const GuideDetailScreen({Key? key, required this.guide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(guide.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                guide.imagePath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              guide.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              guide.location,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Row(
              children: List.generate(
                guide.rating.round(),
                (index) => Icon(Icons.star, size: 20, color: Colors.amber),
              ),
            ),
            SizedBox(height: 8),
            Text('${guide.reviewCount} Reviews'),
            // Thêm thông tin chi tiết khác nếu cần
          ],
        ),
      ),
    );
  }
}
