import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

Color mainColor = Color(0xff774a63);
Color secondColor = Color(0xffd6a5c0);
Color backgroundColor = Color(0xfffcf1f2);

List<ImageProvider> images = [
  AssetImage('assets/image2.png'),
  AssetImage('assets/image1.png'),
  AssetImage('assets/image3.png'),
  AssetImage('assets/image1.png'),
  AssetImage('assets/image2.png'),
];

List<ImageProvider> avatars = [
  AssetImage('assets/avatar1.png'),
  AssetImage('assets/avatar2.png'),
  AssetImage('assets/avatar3.png'),
  AssetImage('assets/avatar1.png'),
  AssetImage('assets/avatar2.png'),
];

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageView(
        children: <Widget>[
          SocialScreen(),
          FeedScreen(),
        ],
      ),
    );
  }
}

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ListView(
        children: <Widget>[
          CustomFeedHeader(),
          Storys(),
          PostFeed(),
        ],
      ),
    );
  }
}

class PostFeed extends StatelessWidget {
  const PostFeed({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: avatars.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: 400,
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: images[index],
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: secondColor.withOpacity(0.25),
                ),
              ],
            ),
            child: Container(
              height: 90,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: avatars[index],
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Jessica Parker',
                        style: TextStyle(
                          fontSize: 20,
                          color: mainColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '1 hour ago',
                        style: TextStyle(
                          fontSize: 15,
                          color: secondColor,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.more_vert,
                    color: mainColor,
                    size: 30,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Storys extends StatelessWidget {
  const Storys({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.only(left: 25),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: avatars.length + 1,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return index == 0
              ? Container(
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: secondColor.withOpacity(0.25),
                        )
                      ]),
                  child: Icon(Icons.add, size: 35, color: secondColor),
                )
              : Container(
                  height: 80,
                  width: 80,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepOrange.shade200,
                        Colors.blue.shade300
                      ],
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundImage: avatars[index - 1],
                  ),
                );
        },
      ),
    );
  }
}

class CustomFeedHeader extends StatelessWidget {
  const CustomFeedHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 50, 50, 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hello,',
                style: TextStyle(color: secondColor, fontSize: 20),
              ),
              Text(
                'Anastasia',
                style: TextStyle(color: mainColor, fontSize: 30),
              ),
            ],
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: secondColor.withOpacity(0.5), blurRadius: 20),
              ],
            ),
            child: Icon(Icons.search, color: secondColor),
          ),
        ],
      ),
    );
  }
}

class SocialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: backgroundColor,
      body: ListView(
        children: <Widget>[
          CustomSocialHeader(),
          SocialInfo(),
          SocialFeed(),
        ],
      ),
    );
  }
}

class SocialFeed extends StatelessWidget {
  const SocialFeed({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(75),
        ),
      ),
      child: StaggeredGridView.countBuilder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              child: Image(image: images[index], fit: BoxFit.cover),
            ),
          );
        },
        staggeredTileBuilder: (index) {
          return StaggeredTile.count(1, index.isEven ? 2 : 1);
        },
      ),
    );
  }
}

class SocialInfo extends StatelessWidget {
  const SocialInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(height: 100, color: Colors.white),
        Container(
          padding: EdgeInsets.only(top: 25),
          height: 100,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(75),
              bottomRight: Radius.circular(75),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Photos',
                    style: TextStyle(color: secondColor, fontSize: 16),
                  ),
                  Text(
                    '567',
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Followers',
                    style: TextStyle(color: secondColor, fontSize: 16),
                  ),
                  Text(
                    '12.457',
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Follows',
                    style: TextStyle(color: secondColor, fontSize: 16),
                  ),
                  Text(
                    '123',
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomSocialHeader extends StatelessWidget {
  const CustomSocialHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(75))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.arrow_back, color: mainColor),
              Icon(Icons.more_vert, color: mainColor),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'My Profile',
              style: TextStyle(fontSize: 30, color: mainColor),
            ),
          ),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/avatar1.png'),
              ),
              boxShadow: [
                BoxShadow(
                  color: secondColor,
                  blurRadius: 40,
                  offset: Offset(0, 10),
                ),
              ],
            ),
          ),
          Container(),
          Text(
            'Anastasia Mari',
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w700, color: mainColor),
          ),
          Text(
            '@ui.sia',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, color: secondColor),
          ),
        ],
      ),
    );
  }
}
