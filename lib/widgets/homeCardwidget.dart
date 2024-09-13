import 'dart:async';

import 'package:demo/constants/app_color.dart';
import 'package:demo/features/detailScreen/detailScreen.dart';
import 'package:demo/widgets/clockTimerwidget.dart';
import 'package:flutter/material.dart';
import 'package:demo/features/Home/model/homemodel.dart';

class HomeCardWidget extends StatefulWidget {
  final List<UserListModel> userList;

  const HomeCardWidget({Key? key, required this.userList}) : super(key: key);

  @override
  _HomeCardWidgetState createState() => _HomeCardWidgetState();
}

class _HomeCardWidgetState extends State<HomeCardWidget> {
  int _hoveredIndex = -1;
  Map<int, bool> _markRead = {}; // to store the boolean value according to the size of userList



  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              final isRead = _markRead[index] ?? false;
              return MouseRegion(
                onEnter: (_) => _onHover(index),
                onExit: (_) => _onHover(-1),
                child: GestureDetector(
                  onTap: () {
                    _markAsRead(index);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(
                        userId: widget.userList[index].userid,
                        id: widget.userList[index].id,
                        title: widget.userList[index].title,
                        body: widget.userList[index].body)));
                  },
                  child: Card(
                    color: isRead ? AppColors.primaryColor2 : (_hoveredIndex == index ? Colors.orange : AppColors.secondaryColor),
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.userList[index].title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                widget.userList[index].body,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          if (isRead)
                            Positioned(
                              right: 10,
                              bottom: 10,
                              child: Icon(
                                Icons.check,
                                color: Colors.blue,
                                size: 24,
                              ),
                            ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: ClockTimerWidget()
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            childCount: widget.userList.length,
          ),
        ),
      ],
    );
  }

  void _onHover(int index) {
    // in this function it can take the index value from the userList when move curser enter the card it can take its index value and store this value into the _hoveredIndex
    setState(() {
      _hoveredIndex = index;
    });
  }

  void _markAsRead(int index) {
    // in this function it take take the value of index which user press -- default value is flase in _markRead map but when user tab it take index only that index value is true
    setState(() {
      _markRead[index] = true;
    });
  }
}
