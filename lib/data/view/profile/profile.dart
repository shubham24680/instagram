import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram/core/utils/colors.dart';
import 'package:instagram/core/widgets/text.dart';

class ProfileScreen extends StatelessWidget {
  final String bio = 'Flutter Developer 🚀 | Dream. Build. Inspire.';

  const ProfileScreen({super.key});

  Widget _status(String label, int count) {
    return Column(
      children: [
        CustomText(
          text: count.toString(),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        CustomText(text: label),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: CustomText(
          text: "Shubham Patel",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Profile Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Profile Picture
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                  ),
                  _status('Posts', 42),
                  _status('Followers', 1200),
                  _status('Following', 180),
                ],
              ),
            ),

            // Name & Bio
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Shubham Patel",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(text: "Flutter Developer"),
                ],
              ),
            ),

            SizedBox(height: 10),

            // Edit Profile / Follow Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: black,
                  foregroundColor: white,
                  minimumSize: Size.fromHeight(40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: CustomText(
                  text: "Edit Profile",
                  color: white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),

            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
              ),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey.shade200,
                  child: Icon(Icons.image, size: 40),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
