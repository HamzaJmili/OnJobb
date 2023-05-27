import 'package:onjobb/presentation/saved_page/proposals_screen.dart';

import '../../models/Job.dart';
import '../home_page/controller/home_controller.dart';
import '../job_details_screen/job_details_screen.dart';
import '../saved_page/widgets/saved_item_widget.dart';
import 'controller/saved_controller.dart';
import 'models/saved_item_model.dart';
import 'models/saved_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/app_bar/appbar_image.dart';
import 'package:onjobb/widgets/app_bar/appbar_title.dart';
import 'package:onjobb/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class SavedPage extends StatelessWidget {
  SavedController controller = Get.put(SavedController());

  @override
  Widget build(BuildContext context) {
    // controller.getJobs();
    // controller.getSavedJobs();
    return Obx(() {
      if (controller.userisFreelancer.value == true) {
        // Show the freelancer my jobs page if the user is a freelancer
        return SafeArea(child: Obx(() {
          if (controller.freelancer.value == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            

             return Scaffold(
  backgroundColor: ColorConstant.whiteA70002,
  appBar: CustomAppBar(
    height: getVerticalSize(50),
    leadingWidth: 48,
    leading: AppbarImage(
      height: getSize(24),
      width: getSize(24),
      svgPath: ImageConstant.imgArrowleft,
      margin: getMargin(left: 24, top: 13, bottom: 13),
      onTap: () {
        onTapArrowleft5();
      },
    ),
    centerTitle: true,
    title: AppbarTitle(text: "lbl_saved".tr),
  ),
  body: SingleChildScrollView(
    child: Padding(
      padding: getPadding(left: 24, top: 30, right: 24),
      child: Obx(() {
        if (controller.savedJobsList.isEmpty) {
          return const Center(child: Text('You have 0 saved jobs'));
        } else {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: getVerticalSize(12));
            },
            itemCount: controller.savedJobsList.length,
            itemBuilder: (context, index) {
              return SavedItemWidget(
                controller.savedJobsList[index],
                onTapSaveJobDetails: () {
                  onTapSaveJobDetailsFreelancer(controller.savedJobsList[index]);
                },
                isFreelancer: true,
              );
            },
          );
        }
      }),
    ),
  ),
);

          }
        }));
      } else {
        // Show the client my jobs page if the user is a Client
        print(" the joblist of list is :   ${controller.jobsList.length} ");
        return SafeArea(child: Obx(() {
          if (controller.client.value == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Scaffold(
                backgroundColor: ColorConstant.whiteA70002,
                appBar: CustomAppBar(
                    height: getVerticalSize(50),
                    leadingWidth: 48,
                    leading: AppbarImage(
                        height: getSize(24),
                        width: getSize(24),
                        svgPath: ImageConstant.imgArrowleft,
                        margin: getMargin(left: 24, top: 13, bottom: 13),
                        onTap: () {
                          onTapArrowleft5();
                        }),
                    centerTitle: true,
                    title: AppbarTitle(text: "Posted Jobs")),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: getPadding(left: 24, top: 30, right: 24),
                    child: Obx(() {
                      if (controller.jobsList.isEmpty) {
                        return const Center(
                          child: Text(
                            "You haven't posted any jobs yet",
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      } else {
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: getVerticalSize(12));
                          },
                          itemCount: controller.jobsList.length,
                          itemBuilder: (context, index) {
                            print(controller.jobsList[index].title);
                            return SavedItemWidget(
                              controller.jobsList[index],
                              onTapSaveJobDetails: () {
                                onTapSaveJobDetailsClient(
                                    controller.jobsList[index]);
                              }
                          ,isFreelancer : false  );
                          },
                        );
                      }
                    }),
                  ),
                ));
          }
        }));
      }
    });
  }

  onTapSaveJobDetailsClient(Job job) {
    // Get.toNamed(AppRoutes.savedDetailJobScreen);
    Get.to(
      () => ProposalsScreen(),
      arguments: job,
    );
  }

  onTapSaveJobDetailsFreelancer(Job job) {
    // Get.toNamed(AppRoutes.savedDetailJobScreen);
    Get.to(() => JobDetailsScreen(),
        arguments: {'job' : job, 'freelancerId': controller.freelancer.value?.uid ?? ''} );
  }

  onTapArrowleft5() {
    Get.back();
  }
}
