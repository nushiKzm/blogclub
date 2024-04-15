import 'package:blog_club/data/data.dart';
import 'package:flutter/material.dart';

class UnSeenSquareProfile extends StatelessWidget {
  const UnSeenSquareProfile({
    super.key,
    required this.story,
  });

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      height: 68,
      padding: const EdgeInsets.all(2), //ضخامت بردر
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xff376AED),
            Color(0xff49B0E2),
            Color(0xff9CECFB),
          ],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(5), //ضخامت قسمت سفید
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
        ),
        child: ProfileImage(story: story),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.story});
  final StoryData story;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      //borderRdius Parent - padding Parent (22-4)
      child: Image.asset(
        "assets/img/stories/${story.imageFileName}",
        width: 54,
        height: 54,
      ),
    );
  }
}
