import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'package:whatsapp_app/Helpers/all_image.dart';
import 'package:whatsapp_app/Helpers/app_service.dart';

class StoryPageView extends StatelessWidget {
  final _storyController = StoryController();
  @override
  Widget build(BuildContext context) {
    final controller = StoryController();
    final List<StoryItem> storyItems = [
      StoryItem.text(
          title: "nikhil bhai misss you ", backgroundColor: Colors.red),
      StoryItem.inlineImage(
        url:
            "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
        controller: controller,
        caption: Text(
          "🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂",
          style: TextStyle(
            color: Colors.white,
            backgroundColor: Colors.black54,
            fontSize: 17,
          ),
        ),
      ),
      StoryItem.inlineImage(
        url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
        controller: controller,
        caption: Text(
          " 🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂",
          style: TextStyle(
            color: Colors.white,
            backgroundColor: Colors.black54,
            fontSize: 17,
          ),
        ),
      ),
      StoryItem.text(
          title: "nikhil bhai misss you ", backgroundColor: Colors.red),
      StoryItem.pageImage(
          caption: Text("jzbjzjbsbjkbj"),
          duration: Duration(seconds: 15),
          url: Getimage.nikhil,
          controller: _storyController,
          imageFit: BoxFit.contain),
      StoryItem.inlineImage(url: Getimage.nikhil, controller: _storyController),
      StoryItem.pageVideo(
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
          controller: controller)
    ];
    return Material(
      child: StoryView(
        onComplete: () {
          Appservices.goback(context);
        },
        storyItems: storyItems,
        controller: controller,
        inline: false,
        repeat: true,
      ),
    );
  }
}
