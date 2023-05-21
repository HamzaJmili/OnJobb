import 'package:flutter/material.dart';
import '../../models/Job.dart';
import '../../models/proposal.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../core/app_export.dart';
import '../profileFreelancer_page/profileFreelancer_page.dart';
import 'controller/proposals_controller.dart';

class ProposalsScreen extends StatelessWidget {
  final ProposalsScreenController controller =
      Get.put(ProposalsScreenController());

  final Job job = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.getProposals(job.id);
    controller.setList(job.id);

    print("proposalslist length is ${controller.proposalsList.length}");

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA70002,
        appBar: CustomAppBar(
          height: getVerticalSize(50),
          leadingWidth: 48,
          leading: AppbarImage(
            height: getSize(24),
            width: getSize(24),
            svgPath: ImageConstant.imgArrowleft,
            margin: getMargin(left: 24, top: 13, bottom: 13),
            onTap: onTapArrowleft1,
          ),
          centerTitle: true,
          title: AppbarTitle(text: "lbl_job_details".tr),
          actions: [
            AppbarImage(
              height: getSize(24),
              width: getSize(24),
              svgPath: ImageConstant.imgBookmark,
              margin: getMargin(left: 16, top: 13, right: 16, bottom: 13),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: getMargin(right: 17, left: 17, top: 10, bottom: 0),
                padding: getPadding(left: 10, top: 24, right: 10, bottom: 24),
                decoration: AppDecoration.outlineIndigo50.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      margin: const EdgeInsets.all(0),
                      color: ColorConstant.gray100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusStyle.roundedBorder39,
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(job.imageUrl),
                        radius: 24,
                      ),
                    ),
                    Padding(
                      padding: getPadding(top: 16),
                      child: Text(
                        " ${job.title}",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPlusJakartaSansBold14Bluegray900
                            .copyWith(
                          letterSpacing: getHorizontalSize(0.07),
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(top: 7),
                      child: Text(
                        "  ${job.fullName}",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPlusJakartaSansMedium12.copyWith(
                          letterSpacing: getHorizontalSize(0.06),
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(left: 1, top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            height: getVerticalSize(28),
                            width: getHorizontalSize(69),
                            text: " ${job.type}",
                            variant: ButtonVariant.FillGray100,
                            shape: ButtonShape.RoundedBorder8,
                            fontStyle:
                                ButtonFontStyle.InterRegular12Bluegray400,
                          ),
                          CustomButton(
                            height: getVerticalSize(28),
                            width: getHorizontalSize(104),
                            text: " ${formatDate(job.publishedAt.toDate())}",
                            margin: getMargin(left: 9),
                            variant: ButtonVariant.FillGray100,
                            shape: ButtonShape.RoundedBorder8,
                            fontStyle:
                                ButtonFontStyle.InterRegular12Bluegray400,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: getPadding(left: 20),
                child: Text(
                  "lbl_job_description".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPlusJakartaSansBold16Bluegray900.copyWith(
                    letterSpacing: getHorizontalSize(0.08),
                  ),
                ),
              ),
              Container(
                width: getHorizontalSize(319),
                margin: getMargin(left: 15.5, top: 13, right: 15.5),
                child: Text(
                  job.jobDescription,
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPlusJakartaSansMedium14Gray600.copyWith(
                    letterSpacing: getHorizontalSize(0.07),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: getPadding(left: 20),
                child: Text(
                  "Proposals",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPlusJakartaSansBold16Bluegray900.copyWith(
                    letterSpacing: getHorizontalSize(0.08),
                  ),
                ),
              ),
              Obx(() {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.proposalsList.length,
                  itemBuilder: (context, index) {
                    Proposal proposal = controller.proposalsList[index];

                    return Container(
                      padding: EdgeInsets.all(16),
                      margin:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(proposal.freelancer.photoUrl),
                            radius: 24,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      proposal.freelancer.firstname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                   const SizedBox(width: 12),
                                    IconButton(
                                      icon:const Icon(Icons.visibility),
                                      onPressed: () {
                                          Get.to(
      () => ProfileFreelancerPage(),arguments: proposal.freelancer ,
    );
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(
                                  proposal.freelancer.location,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Price: ${proposal.salary}',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Cover Letter: ${proposal.coverLetter}',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  void onTapArrowleft1() {
    Get.back();
  }

  String formatDate(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays < 3) {
      if (difference.inHours < 24) {
        return '${difference.inHours}h ago';
      } else {
        return '${difference.inDays} days ago';
      }
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }
}
