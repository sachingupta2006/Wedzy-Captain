import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';

import '../../Utils/Common/themedata.dart';
// import 'package:wedzy/Utils/themedata.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({super.key});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  final _messageController = TextEditingController();
  int chatItems = 5;
  List<String> messages = [
    "Lorem ipsum",
    "Jorem ipsum dolor sit \namet,consectetur\nadipiscing elit.",
    "Lorem ipsum",
    "Forem ipsum dolor sit amet,\nconsectetur adipiscing elit. \nNunc vulputate libero et velit \ninterdum, ac aliquet odio mattis."
  ];

  _chatItemsAdd() {
    setState(() {
      chatItems + 1;
      messages.add(_messageController.text);
    });
  }

  @override
  void initState() {
    super.initState();
    // calendarController.view = _view;
  }

  @override
  Widget build(BuildContext context) {
    // final Widget calendar = _getAppointmentEditorCalendar(
    //   calendarController,
    //   MeetingDataSource(_getDataSource()),
    //   _onCalendarTapped,
    //   _onViewChanged,
    // );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          flexibleSpace: Container(
            height: 100,
            decoration: const BoxDecoration(
                // color: Colors.amber,
                ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFFEF2B7B),
            ),
            iconSize: 22.spMin,
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Row(
              children: [
                // ListTile(
                //   contentPadding: EdgeInsets.zero,
                //   leading:
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/images/chatimage.png"),
                ),
                // title:
                sizedBoxWidth(6.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 2), // Adjust the left padding value as needed
                        child: Text(
                          'Virat & Anushka',
                          style: TextStyle(
                            color: Color(0xFF373737),
                            fontSize: 15.sp,
                            fontFamily: 'AvenirNextCyr',
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    // subtitle:
                    Text(
                      'online',
                      style: TextStyle(
                        color: Color(0xFF707070),
                        fontSize: 15.sp,
                        fontFamily: 'AvenirNextCyr',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                sizedBoxWidth(52.w),
                SvgPicture.asset("assets/svg/video.svg"),
                sizedBoxWidth(30.w),

                SvgPicture.asset("assets/svg/audio.svg")
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
              // shrinkWrap: true,
              //  reverse: true,
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                if (index < 2) {
                  return LeftChatMessage(index, messages);
                  // LeftChatMessage(index, messages);
                } else {
                  return RightChatMessage(index, messages);

                }
              },
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 81,
              height: 29,
              decoration: ShapeDecoration(
                color: const Color(0x9BFFE3F0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: const Center(child: Text("Today")),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              // width: 360,
              height: 96,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 18.h, left: 17.w, right: 17.w, bottom: 35.h),
                child: TextFormField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'Type Here...',
                    hintStyle: TextStyle(
                      color: Color(0xFF373737),
                      fontSize: 12.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(top: 14.h),
                      child: InkWell(
                        onTap: () => _chatItemsAdd(),
                        child: Text(
                          "Send",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 1, top: 1),
                      child: Transform.scale(
                        scale: 0.5,
                        child: SvgPicture.asset(
                          "assets/svg/smile.svg",
                          width: 17,
                          height: 17,
                        ),
                      ),
                    ),
                    filled: true,
                    fillColor: Color(0xFFFEF3F8),
                    contentPadding: EdgeInsets.all(10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide: const BorderSide(
                        color: Color(0xFFFEF3F8),
                        //  Color(0xFFEE3764),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide: const BorderSide(
                        color: Color(0xFFFEF3F8),
                        //  Color(0xFFEE3764),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget LeftChatMessage(index, msg) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 8,
      children: [
        Container(
          constraints: const BoxConstraints(
              // maxWidth: 100,
              ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: Color(0xFFFCD9E2),
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            msg[index],
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget RightChatMessage(index, msg) {
    return Wrap(
      alignment: WrapAlignment.end,
      spacing: 8,
      children: [
        Container(
          constraints: const BoxConstraints(
              // maxWidth: 100,
              ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            color: Color(0xFFFCD9E2),
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            msg[index],
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
