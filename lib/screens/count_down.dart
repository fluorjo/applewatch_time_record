
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../template/svg/icon/icon.dart';
import '../../../../template/svg/icons/svg_icons.dart';
import 'package:get/get.dart';

class CountController extends GetxController {
  CountController(this.duration);

  Duration duration = const Duration();
  Timer? timer;
  bool countDown = true;
  late Duration countdownDuration;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    countdownDuration = duration;
    reset();
    print('oninit');
  }

  void reset() {
    duration = countdownDuration;
    countDown = true;
    update();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
    update();
  }

  void addTime() {
    final addSeconds = countDown ? -1 : 1;
    final seconds = duration.inSeconds + addSeconds;
    if (seconds < 0) {
      countDown = false;
      // timer?.cancel();
    } else {
      duration = Duration(seconds: seconds);
    }
    update();
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    timer?.cancel();
    update();
  }
}

class CountDownTimer extends StatelessWidget {
  CountDownTimer(
      {Key? key,
      required this.duration,
      required this.tag,
      required this.closeEvent,
      required this.clearEvent})
      : super(key: key) {
    controller = Get.put(CountController(duration), tag: 'Timer_$tag');
  }

  final Duration duration;
  final String tag;
  final Function closeEvent;
  final Function clearEvent;

  ///컨트롤러
  late CountController? controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CountController>(
        init: controller,
        tag: 'Timer_$tag',
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [buildTime(controller), buildButtons(controller)],
          );
        });
  }

  Widget buildTime(controller) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    // final hours = twoDigits(duration.inHours);

    final minutes = twoDigits(controller.duration.inMinutes.remainder(60));
    final seconds = twoDigits(controller.duration.inSeconds.remainder(60));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Visibility(
          visible: !controller.countDown,
          child: Text("+",
              style: TextStyle.actionSheetNumber
                  .copyWith(color: Colors.badgeSky))),
      Text(
        minutes,
        style: TextStyle.actionSheetNumber.copyWith(
            color: !controller.countDown
                ? Colors.badgeSky
                : Colors.textTitle),
      ),
      Text(':',
          style: TextStyle.actionSheetNumber.copyWith(
              color: !controller.countDown
                  ? Colors.badgeSky
                  : Colors.textTitle)),
      Text(
        seconds,
        style: TextStyle.actionSheetNumber.copyWith(
            color: !controller.countDown
                ? Colors.badgeSky
                : Colors.textTitle),
      ),
    ]);
  }

  Widget buildButtons(controller) {
    final isRunning =
        controller.timer == null ? false : controller.timer!.isActive;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            controller.stopTimer();
            closeEvent();
          },
          child: CircleAvatar(
            radius: 18.w,
            backgroundColor: Colors.badgeSky,
            child: CircleAvatar(
              radius: 17.w,
              backgroundColor: Colors.defaultWhite,
              child: SvgIcon(
                SvgIcons.close,
                color: Colors.badgeSky,
                width: 19.w,
                height: 19.w,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        GestureDetector(
          onTap: () {
            print('완료');
            clearEvent();
          },
          child: CircleAvatar(
            radius: 18.w,
            backgroundColor: Colors.badgeSky,
            child: CircleAvatar(
              radius: 17.w,
              backgroundColor: Colors.defaultWhite,
              child: SvgIcon(
                SvgIcons.check,
                color: Colors.badgeSky,
                width: 19.w,
                height: 19.w,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        isRunning
            ? GestureDetector(
                onTap: () {
                  print('일시정지');
                  controller.stopTimer(resets: false);
                },
                child: CircleAvatar(
                  radius: 18.w,
                  backgroundColor: Colors.badgeSky,
                  child: CircleAvatar(
                    radius: 17.w,
                    backgroundColor: Colors.defaultWhite,
                    child: SvgIcon(
                      SvgIcons.pause,
                      color: Colors.badgeSky,
                      width: 16.w,
                      height: 16.h,
                    ),
                  ),
                ),
              )
            : GestureDetector(
                onTap: () {
                  print('시작');
                  controller.startTimer();
                },
                child: CircleAvatar(
                  radius: 18.w,
                  backgroundColor: Colors.badgeSky,
                  child: CircleAvatar(
                    radius: 17.w,
                    backgroundColor: Colors.defaultWhite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 2.w),
                        SvgIcon(
                          SvgIcons.play,
                          color: Colors.badgeSky,
                          width: 16.w,
                          height: 16.w,
                        ),
                      ],
                    ),
                  ),
                ),
              )
      ],
    );
  }
}