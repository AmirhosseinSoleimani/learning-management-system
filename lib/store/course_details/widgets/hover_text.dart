import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constant/color.dart';
import './rating_star.dart';

class HoverText extends StatefulWidget {
  const HoverText({
    super.key,
  });

  @override
  State<HoverText> createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  double rating = 0;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = 0;
            });
          },
          child: const Text(
            'info',
            style: TextStyle(fontSize: 28),
          ),
        ),
        if (_selectedIndex == 0)
          Container(
            padding: const EdgeInsets.only(top: 5),
            width: 200,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 3, color: Color(0xff5DBF23)))),
          ),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = 1;
            });
          },
          child: const Text(
            'courses',
            style: TextStyle(fontSize: 28),
          ),
        ),
        if (_selectedIndex == 1)
          Container(
            padding: const EdgeInsets.only(top: 5),
            width: 200,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 3, color: Color(0xff5DBF23)))),
          ),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = 2;
            });
          },
          child: const Text(
            'teacher',
            style: TextStyle(fontSize: 28),
          ),
        ),
        if (_selectedIndex == 2)
          Container(
            padding: const EdgeInsets.only(top: 5),
            width: 200,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 3, color: Color(0xff5DBF23)))),
          ),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = 3;
            });
          },
          child: const Text(
            'comment',
            style: TextStyle(fontSize: 28),
          ),
        ),
        if (_selectedIndex == 3)
          Container(
            padding: const EdgeInsets.only(top: 5),
            width: 200,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 3, color: Color(0xff5DBF23)))),
          ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1.2,
        ),
        (_selectedIndex == 0)
            ? const Info()
            : (_selectedIndex == 1)
            ? const Courses()
            : (_selectedIndex == 2)
            ? const Teachers()
            : (_selectedIndex == 3)
            ? const Comments()
            : Container()
      ],
    );
  }
}

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "info",
            style: TextStyle(fontSize: 32),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit,Lorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elit,Lorem ipsum dolor sit amet, consectetur adipiscing elit,Lorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elit ,Lorem ipsum dolor sit amet, consectetur adipiscing elit,Lorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elit ,Lorem ipsum dolor sit amet, consectetur adipiscing elit,Lorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elit  ',
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: bgColorContainer,
                borderRadius: BorderRadius.circular(15)),
            height: 450,
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'What We gonna learn in this course : ',
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SecondCard(
                    title: 'djfadsbfasdfbnsdbnfmdsbfam,nsdbmfnbsm,dbfa',
                  ),
                  SecondCard(
                    title: 'djfadsbfasdfbnsdbnfmdsbfam,nsdbmfnbsm,dbfa',
                  ),
                  SecondCard(
                    title: 'djfadsbfasdfbnsdbnfmdsbfam,nsdbmfnbsm,dbfa',
                  ),
                  SecondCard(
                    title: 'djfadsbfasdfbnsdbnfmdsbfam,nsdbmfnbsm,dbfa',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 480,
            width: double.infinity,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: const [
                CardSimulator(),
                CardSimulator(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardSimulator extends StatelessWidget {
  const CardSimulator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/avatar/course5.jpg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
              height: 216,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Learn how to design\nlike Pro ',
                  ),
                  // const SizedBox(
                  //   width: 195,
                  // ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(color: Color(0xffC6E9B2)),
                    child: const Text('Design'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: const [
                  Icon(Icons.people),
                  SizedBox(
                    width: 5,
                  ),
                  Text('total Students: 230'),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: SizedBox(
                      width: 90,
                      height: 90,
                      child: ClipOval(
                          child: Image.asset('assets/avatar/av1.jpg'))),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text("MaxiMillians"),
                const Spacer(),
                const Icon(
                  Icons.star,
                  color: Color(0xffFAD564),
                ),
                const Text('5')
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      backgroundColor: const Color(0xff5DBF23)),
                  onPressed: () {},
                  child: const Text('Course Preview'),
                )),
          ],
        ),
      ),
    );
  }
}

class SecondCard extends StatelessWidget {
  const SecondCard({
    required this.title,
    super.key,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/svg/svg1.svg'),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 40)),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

class Courses extends StatelessWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Requirement :', style: TextStyle(fontSize: 32)),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit,Lorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elit,Lorem ipsum dolor sit amet, consectetur adipiscing elit,Lorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elit ,Lorem ipsum dolor sit amet, consectetur adipiscing elit,Lorem ipsum dolor sit amet, consectetur',
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Lessons : ', style: TextStyle(fontSize: 32)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [Icon(Icons.book), Text("52 Article")],
                  ),
                  Row(
                    children: const [Icon(Icons.book), Text("5 Hours")],
                  ),
                  Row(
                    children: const [Icon(Icons.book), Text("6 Videos")],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CourseCard(),
                    Divider(
                      thickness: 1.2,
                    ),
                    CourseCard(),
                    Divider(
                      thickness: 1.2,
                    ),
                    CourseCard(),
                    Divider(
                      thickness: 1.2,
                    ),
                    CourseCard(),
                    Divider(
                      thickness: 1.2,
                    ),
                    CourseCard(),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 480,
            width: double.infinity,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: const [
                CardSimulator(),
                CardSimulator(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.keyboard_arrow_down),
        const SizedBox(
          width: 5,
        ),
        const Text('Coures descriptions'),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.access_time,
                  color: Color(0xff187EB3),
                ),
                SizedBox(
                  width: 5,
                ),
                Text('3 Hours'),
              ],
            ),
            Row(
              children: const [
                Icon(
                  Icons.book_outlined,
                  color: Color(0xff5DBF23),
                ),
                SizedBox(
                  width: 5,
                ),
                Text('3 Lessons'),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class Teachers extends StatelessWidget {
  const Teachers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Teacher presentation",
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Center(
                      child: CircleAvatar(
                        radius: 70,
                        child: SizedBox(
                            child: ClipOval(
                                child: Image.asset(
                                  'assets/avatar/teacher.png',
                                ))),
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    'CTO',
                    style: TextStyle(fontSize: 26),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TeacherCardPresentation(),
                const TeacherCardPresentation(),
                const TeacherCardPresentation(),
                const TeacherCardPresentation(),
                const TeacherCardPresentation(),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 280,
                        height: 140,
                        child: Image.asset('assets/avatar/recTeacher.png'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Teacher presentation Video'),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 480,
            width: double.infinity,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: const [
                CardSimulator(),
                CardSimulator(),
              ],
            ),
          ),
        ]));
  }
}

class TeacherCardPresentation extends StatelessWidget {
  const TeacherCardPresentation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                color: const Color(0xff3F3D56),
                borderRadius: BorderRadius.circular(100)),
          ),
          const SizedBox(
            width: 15,
          ),
          const Text('lorem ipsum')
        ],
      ),
    );
  }
}

class Comments extends StatelessWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Comments : ',
          style: TextStyle(fontSize: 32),
        ),
        const SizedBox(
          height: 20,
        ),
        Card(
          elevation: 3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CommentPart(),
              CommentPart(),
              CommentPart(),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 480,
          width: double.infinity,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: const [
              CardSimulator(),
              CardSimulator(),
            ],
          ),
        ),
      ]),
    );
  }
}

class CommentPart extends StatelessWidget {
  const CommentPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: SizedBox(
                    width: 90,
                    height: 90,
                    child: ClipOval(
                        child: Image.asset('assets/avatar/av1.jpg'))),
              ),
              Column(
                children: const [
                  Text("MaxiMiallian"),
                  RatingStar(),
                ],
              ),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    color: const Color(0xff3F3D56),
                    borderRadius: BorderRadius.circular(100)),
              ),
              const Text("1 weeks ago")
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu non pro anim id est laborum.',
            textAlign: TextAlign.start,
          ),
        ),
        const Divider(
          thickness: 1.2,
        ),
      ],
    );
  }
}
