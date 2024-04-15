import 'package:blog_club/data/data.dart';
import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/widgets/post.dart';
import 'package:blog_club/widgets/profileImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              AppBar(
                backgroundColor:
                    themeData.colorScheme.background.withOpacity(0),
                title: const Text('Profile'),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz_rounded)),
                  const SizedBox(width: 16)
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 16, 40, 66),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(32),
                      // margin: EdgeInsets.fromLTRB(40, 16, right, bottom),
                      width: 295,
                      height: 284,
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: themeData.colorScheme.onBackground
                                .withOpacity(0.1),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              UnSeenSquareProfile(
                                story: AppDatabase.stories[0],
                              ),
                              const SizedBox(width: 24),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '@joviedan',
                                      style: themeData.textTheme.labelMedium!
                                          .copyWith(fontSize: 14),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Jovi Daniel',
                                      style: themeData.textTheme.headlineSmall,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'UX Designer',
                                      style: themeData.textTheme.labelLarge!
                                          .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 8),
                            child: Text(
                              'About me',
                              style:
                                  themeData.textTheme.headlineSmall!.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Text(
                            'Madison Blackstone is a director of user experience design, with experience managing global teams.',
                            style: themeData.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    //Positioned.fill(//az khat biron nmizane
                    Positioned(
                      left: 52,
                      right: 52,
                      top: 280,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [
                            BoxShadow(
                              color: themeData.colorScheme.onBackground
                                  .withOpacity(0.5),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 250,
                      left: 32,
                      right: 32,
                      child: Container(
                        // width: 231,
                        height: 68,
                        decoration: BoxDecoration(
                          color: themeData.colorScheme.secondary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                // width: 77,
                                decoration: BoxDecoration(
                                  color: const Color(0xff2151CD),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '52',
                                      style: TextStyle(
                                        color: themeData.colorScheme.onPrimary,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Post',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              themeData.colorScheme.onPrimary),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 7),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '250',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: themeData.colorScheme.onPrimary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Following',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: themeData.colorScheme.onPrimary),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4.5K',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: themeData.colorScheme.onPrimary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Followers',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: themeData.colorScheme.onPrimary),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                // padding: EdgeInsets.fromLTRB(40, 32, 40, 0),
                decoration: BoxDecoration(
                  color: themeData.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 16, 40, 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'My Posts',
                              style: themeData.textTheme.titleLarge,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Assets.img.icons.grid.svg(
                              color: themeData.colorScheme.primary,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Assets.img.icons.table.svg(
                              color: themeData.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final PostData post = posts[index];
                        return Post(top: index == 0 ? 24 : 19, post: post);
                      },
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
}
