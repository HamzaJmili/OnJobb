import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onjobb/presentation/job_details_screen/job_details_screen.dart';

import '../../core/utils/size_utils.dart';
import '../../models/Job.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';

class YourJobClientWidget extends StatelessWidget {
  final Job job;
  
  const YourJobClientWidget({required this.job});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        

        onTapOnJob();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(job.imageUrl),
                  radius: 24,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          job.title,
                          style: AppStyle.txtPlusJakartaSansBold18.copyWith(
                            letterSpacing: getHorizontalSize(
                              0.08,
                            ),
                          ),
                        ),
                        Text(
                          formatDate(job.publishedAt
                              .toDate()), // Convert the Timestamp to a formatted date
                          style: AppStyle.txtPlusJakartaSansMedium12Gray600
                              .copyWith(
                            letterSpacing: getHorizontalSize(
                              0.06,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      job.fullName,
                      style: AppStyle.txtPlusJakartaSansSemiBold12Bluegray400
                          .copyWith(
                        letterSpacing: getHorizontalSize(
                          0.06,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'Min : \$${job.minSalary.toStringAsFixed(2)}',
                          style: AppStyle.txtPlusJakartaSansMedium12Gray600
                              .copyWith(
                            letterSpacing: getHorizontalSize(
                              0.06,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          'Max : \$${job.maxSalary.toStringAsFixed(2)}',
                          style: AppStyle.txtPlusJakartaSansMedium12Gray600
                              .copyWith(
                            letterSpacing: getHorizontalSize(
                              0.06,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      job.jobDescription,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

 String formatDate(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inDays < 3) {
    if (difference.inHours < 1) {
      if (difference.inMinutes < 1) {
        return 'Just now';
      } else {
        return '${difference.inMinutes} minutes ago';
      }
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inDays} days ago';
    }
  } else {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
}

 

  onTapOnJob() {
     Get.offAll(
    () => JobDetailsScreen(),
    arguments: job,
  );
    // Get.toNamed(
    //   AppRoutes.jobDetailsScreen,
    //   arguments: job,
    // );
  }
}
