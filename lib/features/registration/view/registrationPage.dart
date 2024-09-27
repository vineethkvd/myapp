import 'package:flutter/material.dart';
import 'package:myapp/core/utils/configs/styles/colors.dart';
import 'package:myapp/core/utils/shared/constant/assetsPathes.dart';
import 'package:myapp/features/registration/controller/registrationController.dart';
import 'package:provider/provider.dart';

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
    final registrationController = Provider.of<RegistrationController>(context);
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xfff5f5f5),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonFormField<String>(
                    dropdownColor: Colors.white,
                    value: registrationController.selectedStateId.isNotEmpty
                        ? registrationController.selectedStateId
                        : null,
                    menuMaxHeight: 200,
                    isExpanded: true,
                    items: registrationController.stateList.map((element) {
                      return DropdownMenuItem<String>(
                        value: element.id.toString(),
                        child: Text(element.state ?? ''),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      fillColor: const Color(0xfff5f5f5),
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        fontFamily: "poppinsRegular",
                        color: Colors.black,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.5, horizontal: 15),
                      labelText: "Select state",
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        fontFamily: "poppinsRegular",
                        color: Colors.black,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Color(0xffd9d9d9)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Color(0xffd9d9d9)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      registrationController.selectedStateId = value.toString();
                      registrationController.selectDistrict(
                          stateId: registrationController.selectedStateId
                              .toString());
                    },
                  ),
                ),
                SizedBox(
                  height: 10 / h * h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xfff5f5f5),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonFormField<String>(
                    dropdownColor: Colors.white,
                    value: registrationController.selectedDistrictId.isNotEmpty
                        ? registrationController.selectedDistrictId
                        : null,
                    menuMaxHeight: 200,
                    isExpanded: true,
                    items: registrationController.districtList.map((element) {
                      return DropdownMenuItem<String>(
                        value: element.id.toString(),
                        child: Text(element.districtName ?? ''),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      fillColor: const Color(0xfff5f5f5),
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        fontFamily: "poppinsRegular",
                        color: Colors.black,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.5, horizontal: 15),
                      labelText: "Select district",
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        fontFamily: "poppinsRegular",
                        color: Colors.black,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Color(0xffd9d9d9)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Color(0xffd9d9d9)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      registrationController.selectedDistrictId =
                          value.toString();
                      // selectDistrict(
                      //     stateId: _loginController.selectedStateId.value);
                    },
                  ),
                ),
              ],
            ),
          ),
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
