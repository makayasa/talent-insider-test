import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton/app/components/default_text.dart';
import 'package:skeleton/config/color_constants.dart';
import 'package:skeleton/config/constant.dart';

import '../controllers/list_course_controller.dart';

class ListCourseView extends GetView<ListCourseController> {
  const ListCourseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getCourses();
        },
      ),
      appBar: AppBar(
        title: const Text('ListCourseView'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          padding: kDefaultScaffoldPadding.copyWith(top: 15, bottom: 15),
          itemCount: controller.listCourses.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                controller.toDetailCourse(
                  controller.listCourses[index]['_id'],
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: kDefaultBorderRadius10,
                  border: Border.all(
                    color: kPrimaryColor,
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      child: Image.asset(
                        'assets/logo.png',
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefText(
                            controller.listCourses[index]['title'],
                            color: kBgWhite,
                          ).semilarge,
                          DefText(
                            '${controller.listCourses[index]['author']} | ${controller.listCourses[index]['category']}',
                            color: kBgWhite,
                          ).normal,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
