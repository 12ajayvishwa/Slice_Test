import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slice/core/constants/app_export.dart';
import 'package:slice/core/constants/color_constant.dart';
import 'package:slice/core/constants/session_manager.dart';
import 'package:slice/widgets/text_style.dart';
import 'login_activity.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    List<TileModel> tileList = [
      TileModel(
          title: "Account Setting",
          subtitle: "Manage Your KYC, Bank Details etc.",
          leadIcon: Icons.manage_accounts,
          actionIcon: Icons.arrow_forward_ios),
      TileModel(
          title: "Security",
          subtitle: "Manage password & Security",
          leadIcon: Icons.key,
          actionIcon: Icons.arrow_forward_ios),
      TileModel(
          title: "Invite and Earn",
          subtitle: "Invite your friend and earn Reward",
          leadIcon: Icons.diversity_3,
          actionIcon: Icons.arrow_forward_ios),
      TileModel(
          title: "Help & Support",
          subtitle: "Get help with your account",
          leadIcon: Icons.support,
          actionIcon: Icons.arrow_forward_ios),
      TileModel(
          title: "Join Telegram Channel",
          subtitle: "Join us on Telegram",
          leadIcon: Icons.telegram,
          actionIcon: Icons.arrow_forward_ios),
      TileModel(
          title: "About Slice",
          subtitle: "About Term of use privacy policy",
          leadIcon: Icons.data_exploration,
          actionIcon: Icons.arrow_forward_ios),
      TileModel(
          title: "App Feedback",
          subtitle: "Help us for improve your experience",
          leadIcon: Icons.chat,
          actionIcon: Icons.arrow_forward_ios),
      TileModel(
          title: "Logout",
          leadIcon: Icons.logout,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginActivity(),
                ));
          },
          actionIcon: Icons.arrow_forward_ios),
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profile",
            style: AppTextStyles.title2,
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(SessionManager.getUserName().toString().capitalizeFirst!,
                  style: AppTextStyles.bodyText),
              Text(SessionManager.getEmail().toString(),
                  style: AppTextStyles.smallText),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: tileList.length,
                  itemBuilder: (context, index) {
                    return CustomListTile(
                      onTap: tileList[index].onTap,
                      title: tileList[index].title,
                      leadIcon: tileList[index].leadIcon,
                      actionIcon: Icons.arrow_forward_ios,
                      subtitle: tileList[index].subtitle,
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}

class TileModel {
  String? title;
  String? subtitle;
  IconData? leadIcon;
  IconData? actionIcon;
  void Function()? onTap;
  TileModel({
    this.actionIcon,
    this.leadIcon,
    this.title,
    this.subtitle,
    this.onTap,
  });
}

class CustomListTile extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final IconData? leadIcon;
  final IconData? actionIcon;
  final void Function()? onTap;

  const CustomListTile({
    this.actionIcon,
    this.leadIcon,
    this.title,
    this.subtitle,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: AppColors.whiteA700,
      elevation: 3,
      child: ListTile(
          onTap: onTap,
          leading: Icon(leadIcon),
          title: Text(title!),
          subtitle: subtitle == null
              ? null
              : Text(
                  subtitle!,
                  style: AppTextStyles.smallText,
                ),
          trailing: Icon(actionIcon)),
    );
  }
}
