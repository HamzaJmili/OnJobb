import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/utils/size_utils.dart';
import '../../models/Freelancer.dart';
import '../../theme/app_style.dart';
import '../profileFreelancer_page/profileFreelancer_page.dart';
import '../profile_page/profile_page.dart';

class FreelancerCardWidget extends StatelessWidget {
  final Freelancer freelancer;

  const FreelancerCardWidget({required this.freelancer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapOnFreelancer();
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
                  backgroundImage: NetworkImage(freelancer.photoUrl),
                  radius: 24,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${freelancer.firstname} ${freelancer.lastname}',
                      style: AppStyle.txtPlusJakartaSansBold18.copyWith(
                        letterSpacing: getHorizontalSize(
                          0.08,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      freelancer.location,
                      style: AppStyle.txtPlusJakartaSansSemiBold12Bluegray400
                          .copyWith(
                        letterSpacing: getHorizontalSize(
                          0.06,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      freelancer.bio,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Specializations: ${freelancer.speciallization.join(", ")}',
                      style: AppStyle.txtPlusJakartaSansSemiBold12Bluegray400
                          .copyWith(
                        letterSpacing: getHorizontalSize(
                          0.06,
                        ),
                      ),
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

  onTapOnFreelancer() {
    Get.to(
      () => ProfileFreelancerPage(),arguments: freelancer ,
    );
  }
}
