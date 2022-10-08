import 'package:flutter/material.dart';
import '../widgets/lesson_item.dart';
import '../../../data.dart';
import '../widgets/video_player.dart';


class LessonItemPage extends StatefulWidget {
  const LessonItemPage({Key? key}) : super(key: key);
  static const routeName = '/lesson_item_page';

  @override
  State<LessonItemPage> createState() => _LessonItemPageState();
}

class _LessonItemPageState extends State<LessonItemPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[300]
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: size/20),
                width: size,
                height: size,
                child: Column(
                  children: [
                    Container(
                      height: size/10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 20.0,
                              color: Colors.black54,
                            ),
                          ),
                          TextButton(
                            onPressed: (){},
                            child: Text(
                                ''
                            ),
                          ),
                          const Icon(
                            Icons.info_outline,
                            size: 20.0,
                            color: Colors.black54,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: size/1.2,
                      child: VideoPlayerPage(
                        data: lessons[0],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius:
                      BorderRadius.only(topRight: Radius.circular(size/8.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(size/30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.all(size/25),
                              child: const Text('List Lessons:',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: getLessons(),
                          ),
                        ],
                      ),
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget getLessons() {
    return ListView.builder(
      itemCount: lessons.length,
      itemBuilder: (context, index) => LessonItem(data: lessons[index]),
    );
  }
}
