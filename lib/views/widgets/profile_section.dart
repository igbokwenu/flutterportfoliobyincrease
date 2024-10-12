import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutterportfoliobyincrease/utils/constants/constants.dart';
import 'package:flutterportfoliobyincrease/utils/reusable_functions.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: CachedNetworkImageProvider(
              increaseImageUrl,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Increase Divine-Wisdom',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Full-stack Software Engineer & AI Dude',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          const Text(
            'Experienced in building scalable applications for Android, iOS and Web - and implementing cutting-edge practical AI solutions.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Tooltip(
                message: 'Mail To: increaseodwisdom@gmail.com',
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: const TextStyle(color: Colors.white),
                child: ElevatedButton.icon(
                  label: const Text('Send Mail'),
                  icon: const Icon(Icons.mail_outlined),
                  onPressed: () {
                    MyReusableFunctions.launchMail();
                  },
                ),
              ),
              Tooltip(
                message: 'View this sites source code',
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: const TextStyle(color: Colors.white),
                child: ElevatedButton.icon(
                  label: const Text('Source Code'),
                  icon: const Icon(FontAwesomeIcons.github),
                  onPressed: () {
                    MyReusableFunctions.launchAnyUrl(
                        "https://github.com/igbokwenu/increasecodes");
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
