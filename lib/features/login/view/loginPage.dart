import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/helpers/routes/app_route_path.dart';
import 'package:myapp/core/utils/configs/styles/colors.dart';
import 'package:myapp/core/utils/shared/component/widgets/customToast.dart';
import 'package:myapp/core/utils/shared/constant/assetsPathes.dart';
import 'package:myapp/features/login/controller/LoginController.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final loginController = Provider.of<LoginController>(context);
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
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColor.btnColor,
                            ),
                          ),
                          SizedBox(
                            height: 23 / h * h,
                          ),
                          textFileldTitle(
                              title: "User Name", icon: Icons.person),
                          SizedBox(
                            height: 5 / h * h,
                          ),
                          SizedBox(
                            height: 40 / h * h,
                            width: double.infinity,
                            child: _customTextField(
                              labelTxt: "User Name",
                              hintTxt: "Enter user name",
                              controller: loginController.email,
                              keyboardType: TextInputType.name,
                              labelTxtStyle: const TextStyle(
                                fontSize: 12,
                                fontFamily: "poppinsRegular",
                                color: Colors.black,
                              ),
                              hintTxtStyle: const TextStyle(
                                fontSize: 12,
                                fontFamily: "poppinsRegular",
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 18 / h * h,
                          ),
                          textFileldTitle(
                              title: "Password", icon: Icons.lock_outline),
                          SizedBox(
                            height: 5 / h * h,
                          ),
                          SizedBox(
                            height: 40 / h * h,
                            width: double.infinity,
                            child: _customTextField(
                              labelTxt: "Password",
                              hintTxt: "Enter password",
                              controller: loginController.password,
                              keyboardType: TextInputType.name,
                              labelTxtStyle: const TextStyle(
                                fontSize: 12,
                                color: AppColor.txtColor,
                              ),
                              hintTxtStyle: const TextStyle(
                                fontSize: 12,
                                color: AppColor.txtColor,
                              ),
                              obscureText: loginController.passwordVisible,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  loginController.passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: loginController.toggle,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50 / h * h,
                          ),
                          _customBtn(
                              width: double.infinity,
                              height: 35 / h * h,
                              text: "Login",
                              onPressed: () {
                                if (loginController.email.text.isEmpty) {
                                  CustomToast.showCustomErrorToast(
                                      message: "Email should not be empty");
                                } else if (loginController
                                    .password.text.isEmpty) {
                                  CustomToast.showCustomErrorToast(
                                      message: "Password should not be empty");
                                } else {
                                  loginController.userLoginApi().then(
                                    (value) {
                                      if (loginController.loginModel.token !=
                                          null) {
                                        context.go(RoutesPath.dashBoardPage);
                                      }
                                    },
                                  );
                                }
                              }),
                          SizedBox(
                            height: 20 / h * h,
                          ),
                          _customBtn(
                              width: double.infinity,
                              height: 35 / h * h,
                              text: "Exit",
                              onPressed: () {}),
                          SizedBox(
                            height: 10 / h * h,
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              Material(
                                borderRadius: BorderRadius.circular(30),
                                elevation: 0,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(30),
                                  onTap: () {
                                    context.go(RoutesPath.register);
                                  },
                                  splashColor: Colors.black.withOpacity(0.3),
                                  child: const Text("Dont have account?",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.skyBlue,
                                      )),
                                ),
                              )
                            ],
                          ),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 257 / h * h,
                width: 419 / w * w,
                child: Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SvgPicture.asset(
                      AssetsPathes.appBackground,
                      fit: BoxFit.fill,
                    )),
              ),
            ],
          )),
    );
  }

  Widget _customTextField({
    required String labelTxt,
    required String hintTxt,
    required TextEditingController? controller,
    required TextInputType? keyboardType,
    required TextStyle? labelTxtStyle,
    required TextStyle? hintTxtStyle,
    String? Function(String?)? validator,
    bool obscureText = false,
    IconButton? suffixIcon,
    bool readOnly = false,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: const Color(0xfff5f5f5),
        suffixIcon: suffixIcon,
        hintText: hintTxt,
        hintStyle: hintTxtStyle,
        contentPadding: const EdgeInsets.all(12),
        labelText: labelTxt,
        labelStyle: labelTxtStyle,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: AppColor.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: AppColor.borderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: AppColor.errorBorder),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
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

  Widget _customBtn({
    required double width,
    required double height,
    required String text,
    required Function() onPressed,
  }) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(30),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onPressed,
        splashColor: Colors.black.withOpacity(0.3),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColor.btnColor,
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: AppColor.whiteTxt, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
