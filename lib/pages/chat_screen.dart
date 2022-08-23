import 'dart:async';

import 'package:attendance/controllers/chat_controller.dart';
import 'package:attendance/controllers/employee_data_controller.dart';
import 'package:attendance/moduls/message_modul.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../theme/theme.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController controller = ScrollController();
  TextEditingController message = TextEditingController();
  String enteredMessage = '';

  // bool isMe = true;

  Widget getAppBar() {
    return Container(
      color: ofWhiteColor,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: primaryGreenColor_1,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(55),
                  bottomLeft: Radius.circular(55),
                )),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05,
                        left: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_rounded,
                            color: Colors.white, size: 35),
                        onPressed: () => Get.back(),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                          left: MediaQuery.of(context).size.width * 0.1,
                        ),
                        child: const Text(
                          'Company Name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: whiteColor),
                        )),
                  ],
                ),
              ],
            ),
          ),
          memberCircle()
        ],
      ),
    );
  }

  Widget memberCircle() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.06),
      // color: Colors.blue,

      child: Stack(
        children: [
          //1
          Positioned(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.15,
              left: MediaQuery.of(context).size.width * 0.22,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('ME',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: primaryGreenColor_1)),
              )),
          //2
          Positioned(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.15,
              left: MediaQuery.of(context).size.width * 0.35,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('RR',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: primaryGreenColor_1)),
              )),
          //3
          Positioned(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.15,
              left: MediaQuery.of(context).size.width * 0.47,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('ME',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: primaryGreenColor_1)),
              )),
          // Show All Members
          Positioned(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.15,
              left: MediaQuery.of(context).size.width * 0.6,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.arrow_forward, color: primaryGreenColor_1, size: 35,
                  // style: TextStyle(fontSize: 22 ,fontWeight: FontWeight.bold, color: Colors.red)
                ),
              )),
        ],
      ),
    );
  }

  Widget getFooter() {
    return Container(
      color: whiteColor,
      // margin: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.17),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.02,
            ),
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
            decoration: BoxDecoration(
                color: primaryGreenColor_1,
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: TextFormField(
                controller: message,
                onChanged: (newValue) {
                  setState(() {
                    enteredMessage = newValue;
                    newValue = '';
                  });
                },
                onSaved: (value) {
                  setState(() {
                    enteredMessage = value!;
                    value = '';
                  });
                },
                autofocus: false,
                cursorColor: primaryGreenColor_2,
                decoration: InputDecoration(
                  hintText: 'Message',
                  hintStyle: GoogleFonts.montserrat(color: whiteColor),
                  border: InputBorder.none,
                ),
                style: GoogleFonts.montserrat(color: whiteColor),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.15,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: primaryGreenColor_1,
            ),
            child: IconButton(
              color: whiteColor,
              icon: const Icon(Icons.send),
              onPressed: () {
                debugPrint('clicked!!');
                message.clear();
                enteredMessage.isNotEmpty
                    ? Get.find<ChatController>().addMessage(Message(
                        'message id',
                        message: enteredMessage,
                        userId:
                            Get.find<EmployeeController>().employee.employeeId,
                        userName: Get.find<EmployeeController>().employee.name,
                        dateTime: Timestamp.now()))
                    : null;
                Get.find<ChatController>().fetchMessage();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget messageBubble(String userName, String message, bool isMe) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            isMe == true
                ? Container(
                    // height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    margin: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 45),
                    decoration: BoxDecoration(
                        color: ofWhiteColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14),
                            bottomLeft: Radius.circular(14),
                            bottomRight: Radius.circular(0))),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: isMe
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.end,
                          ),
                          Text(
                            message,
                            style: const TextStyle(color: Colors.black),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    // height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    margin: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 45),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(14),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(14),
                        )),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(userName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              textAlign: TextAlign.end
                              // isMe ? TextAlign.start : TextAlign.end,
                              ),
                          Text(
                            message,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              color: Colors.black,
                              // isMe
                              //     ? Theme.of(context)
                              //         .accentTextTheme
                              //         .headline6!
                              //         .color
                              //     : Colors.black
                            ),
                            // textAlign: isMe ? TextAlign.start : TextAlign.end,
                          ),
                        ],
                      ),
                    ),
                  )
          ],
        ),
        Positioned(
          top: isMe ? 20 : 20,
          left: isMe ? MediaQuery.of(context).size.width * 0.9 : 0,
          child: CircleAvatar(
            child: Text(
              isMe ? 'ME' : 'RR',
              style: const TextStyle(color: primaryGreenColor_1),
            ),
            backgroundColor: ofWhiteColor,
          ),
        ),
      ],
      overflow: Overflow.visible,
    );
  }

  Widget buildShimmer(){
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.725,
      child: Column(
        children: [
         SizedBox(height: MediaQuery.of(context).size.height*0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.25),
                highlightColor: Colors.white.withOpacity(0.6),
                period: const Duration(seconds: 2),
                // direction:ShimmerDirection.btt,
                // loop:1,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.withOpacity(0.9)), // BoxDecoration
                ), // Container
                // Shimmer.fromColors
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.25),
                highlightColor: Colors.white.withOpacity(0.6),
                period: const Duration(seconds: 2),
                // direction:ShimmerDirection.btt,
                // loop:1,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.withOpacity(0.9)), // BoxDecoration
                ), // Container
                // Shimmer.fromColors
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.25),
                highlightColor: Colors.white.withOpacity(0.6),
                period: const Duration(seconds: 2),
                // direction:ShimmerDirection.btt,
                // loop:1,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.withOpacity(0.9)), // BoxDecoration
                ), // Container
                // Shimmer.fromColors
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.25),
                highlightColor: Colors.white.withOpacity(0.6),
                period: const Duration(seconds: 2),
                // direction:ShimmerDirection.btt,
                // loop:1,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.withOpacity(0.9)), // BoxDecoration
                ), // Container
                // Shimmer.fromColors
              ),
            ],
          ),

        ],
      ),
    );
  }

  Widget getBody() {
    return

      Container(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.725,
        color: Colors.white,
        child:
        FutureBuilder(
          future: Get.find<ChatController>().fetchMessage(),
          builder: (context, AsyncSnapshot<List<Message>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return buildShimmer();
            }
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return messageBubble(
                        snapshot.data![index].userName,
                        snapshot.data![index].message,
                        snapshot.data![index].userId ==
                            Get
                                .find<EmployeeController>()
                                .employee
                                .employeeId ?
                        true : false

                    );
                  });
            }
            return buildShimmer();
          },
        )

    );
  }

  @override
  void initState() {
    // TODO: implement initState
    Get.find<ChatController>().fetchMessage();
    controller.addListener(() {
      debugPrint(controller.offset.toString());
    });

    Timer(const Duration(seconds: 1), () async {
      Get.find<ChatController>().fetchMessage();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ofWhiteColor,
        body: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [getAppBar(), getBody(), getFooter()],
          ),
        ));
  }
}
