import 'package:blog_club/crousel/carousel_slider.dart';
import 'package:blog_club/data/data.dart';
import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/widgets/post.dart';
import 'package:blog_club/widgets/profileImage.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blog_club/gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final stories = AppDatabase.stories;
    final categories = AppDatabase.categories;
    final posts = AppDatabase.posts;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 25, 40, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, Janathan!',
                      style: themeData.textTheme.titleMedium,
                    ),
                    Assets.img.icons.notification.image(width: 32, height: 32),
                    // Assets.img.icons.flutter.svg(width: 32, height: 32),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 7, 0, 20),
                child: Text(
                  'Explore today’s',
                  style: themeData.textTheme.headlineMedium,
                ),
              ),
              _StoryList(stories: stories),
              const SizedBox(height: 32),
              _CategoryList(categories: categories),
              _PostList(themeData: themeData, posts: posts),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _PostList extends StatelessWidget {
  const _PostList({
    super.key,
    required this.themeData,
    required this.posts,
  });

  final ThemeData themeData;
  final List<PostData> posts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(40, 25, 28, 8), //32+right of more button
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest News',
                style: themeData.textTheme.titleLarge,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'More',
                  style: TextStyle(
                    color: Color(0xff376AED),
                  ),
                ),
              )
            ],
          ),
        ),
        ListView.builder(
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.vertical, //default
          // itemExtent: 141,
          shrinkWrap: true,
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final PostData post = posts[index];
            return Post(top: index == 0 ? 24 : 19, post: post);
          },
        ),
      ],
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    super.key,
    required this.categories,
  });
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    //the diffrence between carousel and Listview is every item in carousel can have animation
    return CarouselSlider.builder(
      itemCount: categories.length,
      itemBuilder: (context, index, realIndex) {
        //if enableInfiniteScroll is false;index=realindex
        return _CategoryItem(
          left: realIndex == 0 ? 40 : 9,
          right: realIndex == categories.length - 1 ? 40 : 9,
          category: categories[realIndex],
        );
      },
      options: CarouselOptions(
        scrollPhysics: const BouncingScrollPhysics(),
        // scrollDirection: Axis.horizontal, //default
        viewportFraction: 0.8, //every item get 80 percent of page
        aspectRatio: 1.2, // nesbat arz be tool(in persian)
        initialPage: 0, // start from item which has number 0
        disableCenter: true,
        enableInfiniteScroll:
            false, //if it is true;you cant understand start of items
        padEnds: false, //space between first item from left
        //if you set viewportFraction to 0.5 ,it is very much so it is not useful in this case
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final Category category;
  final double left;
  final double right;
  const _CategoryItem({
    super.key,
    required this.category,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(
        children: [
          Positioned.fill(
            right: 41.28,
            left: 41.28,
            bottom: 24,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0Xaa0D253C),
                    blurRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(28),
              ),
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    Color(0xff0D253C),
                    Colors.transparent
                  ], //ff is opacity
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Image.asset(
                  'assets/img/posts/large/${category.imageFileName}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 33, //25+8
            bottom: 39, //31+8
            child: Text(
              category.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    super.key,
    required this.stories,
  });

  final List<StoryData> stories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width,
      height: 92,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          itemCount: stories.length,
          itemBuilder: (context, index) {
            final story = stories[index];
            return _Story(story: story);
          }),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    super.key,
    required this.story,
  });

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 2, 4, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed
                  ? _seenSquare(story)
                  : UnSeenSquareProfile(story: story),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/img/icons/${story.iconFileName}',
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            story.name,
            style: Theme.of(context).textTheme.labelMedium,
          )
        ],
      ),
    );
  }
}

Widget _seenSquare(StoryData story) {
  return SizedBox(
    // to sure about be equal squres
    height: 68,
    width: 68,
    child: DottedBorder(
      borderType: BorderType.RRect,
      strokeWidth: 2,
      color: const Color(0Xff7B8BB2),
      dashPattern: [8, 3],
      radius:
          const Radius.circular(24), //[width every dott,space between dotts]
      padding: const EdgeInsets.all(7),
      child: ProfileImage(
        story: story,
      ),
    ),
  );
}
