import 'package:blog_club/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.surface,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                // pinned: true,
                floating: true,
                title: Text('Article'),
                actions: [
                  IconButton(
                    icon: Icon(CupertinoIcons.ellipsis),
                    //Icons.more_horiz_rounded
                    onPressed: () {},
                  ),
                  const SizedBox(width: 24)
                  //default=12 so 12+24+padding of button=40
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 24, 40, 0),
                      child: Text(
                        'Four Things Every Woman Needs To Know',
                        style: themeData.textTheme.headlineMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 32, 24, 24),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Assets.img.stories.story2.image(
                                width: 38, height: 38, fit: BoxFit.cover),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Richard Gervain',
                                  style: themeData.textTheme.labelMedium!
                                      .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  '2m ago',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff7B8BB2)),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showSnackBar(context, 'Share button is clicked');
                            },
                            icon: Icon(
                              CupertinoIcons.paperplane,
                              color: themeData.colorScheme.primary,
                            ),
                          ),
                          SizedBox(width: 12),
                          IconButton(
                            onPressed: () {
                              showSnackBar(
                                  context, 'Bookmark button is clicked');
                            },
                            icon: Icon(
                              CupertinoIcons.bookmark,
                              color: themeData.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      ),
                      child: Assets.img.article.singlePost.image(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 32, 40, 16),
                      child: Text(
                        'A man’s sexuality is never your mind responsibility.',
                        style: themeData.textTheme.headlineSmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.  ',
                        style: themeData.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              // or : double.infinity
              height: 116,
              decoration: BoxDecoration(
                // color: Colors.blue,
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    themeData.colorScheme.surface,
                    themeData.colorScheme.surface.withOpacity(0),
                    // Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 111,
        height: 48,
        decoration: BoxDecoration(
          color: themeData.colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: themeData.colorScheme.primary.withOpacity(0.5),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            showSnackBar(context, 'like button is clicked');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.thumbs.svg(),
              SizedBox(width: 12),
              Text(
                '2.1K',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: themeData.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.fixed,
    ),
  );
}
// my floatActionButton :
//  Padding(
//         padding: const EdgeInsets.only(right: 30, bottom: 9),
//         child: SizedBox(
//           width: 111,
//           height: 48,
//           child: FloatingActionButton(
//             elevation: 12,
//             backgroundColor: themeData.colorScheme.primary,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             onPressed: () {},
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Assets.img.icons.thumbs.svg(),
//                 const SizedBox(width: 8),
//                 Text(
//                   '2.1k',
//                   style: TextStyle(
//                       fontSize: 16, color: themeData.colorScheme.onPrimary),
//              ),
//            ],
//          ),
//       ),
//     ),
//   )