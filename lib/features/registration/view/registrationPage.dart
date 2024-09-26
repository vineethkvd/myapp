import 'package:flutter/material.dart';
import 'package:myapp/core/utils/configs/styles/colors.dart';
import 'package:myapp/core/utils/shared/constant/assetsPathes.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: h,
      width: w,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsPathes.appBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 36 / h * h,
          ),
          appLogo(ctx: context),
          SizedBox(
            height: 8 / h * h,
          ),
          const Text("MANAPPURAM FINANCE LIMITED",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColor.txtColorBrown,
              )),
          SizedBox(
            height: 20 / h * h,
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage(AssetsPathes.loginBackground),
                  fit: BoxFit.fill,
                ),
              ),
              height: 413 / h * h,
              width: 362 / w * w,
              padding: EdgeInsets.symmetric(
                  horizontal: 33 / w * w, vertical: 21 / h * h),
              child: const Column(
                children: [],
              ))
        ],
      ),
    ));
  }

  Widget textFileldTitle({required String title, required IconData icon}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 20,
          color: AppColor.btnColor,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: AppColor.btnColor,
          ),
        ),
        const Spacer()
      ],
    );
  }

  Widget appLogo({required BuildContext ctx}) {
    var h = MediaQuery.of(ctx).size.height;
    var w = MediaQuery.of(ctx).size.width;
    return SizedBox(
      height: 28 / h * h,
      width: 95 / w * w,
      child: Image.asset(
        AssetsPathes.mLogo,
        fit: BoxFit.fill,
      ),
    );
  }
}
