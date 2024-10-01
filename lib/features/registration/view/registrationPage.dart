import 'package:flutter/material.dart';
import 'package:myapp/core/utils/configs/styles/colors.dart';
import 'package:myapp/core/utils/shared/constant/assetsPathes.dart';
import 'package:myapp/features/registration/controller/registrationController.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:menu_bar/menu_bar.dart';
import 'package:flutter_svg/svg.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  List<BarButton> _menuBarButtons() {
    return [
      BarButton(
        text: const Text(
          'File',
          style: TextStyle(color: Colors.white),
        ),
        submenu: SubMenu(
          menuItems: [
            MenuButton(
              onTap: () => print('Save'),
              text: const Text('Save'),
              shortcutText: 'Ctrl+S',
              shortcut:
                  const SingleActivator(LogicalKeyboardKey.keyS, control: true),
            ),
            MenuButton(
              onTap: () {},
              text: const Text('Save as'),
              shortcutText: 'Ctrl+Shift+S',
            ),
            const MenuDivider(),
            MenuButton(
              onTap: () {},
              text: const Text('Open File'),
            ),
            MenuButton(
              onTap: () {},
              text: const Text('Open Folder'),
            ),
            const MenuDivider(),
            MenuButton(
              text: const Text('Preferences'),
              icon: const Icon(Icons.settings),
              submenu: SubMenu(
                menuItems: [
                  MenuButton(
                    onTap: () {},
                    icon: const Icon(Icons.keyboard),
                    text: const Text('Shortcuts'),
                  ),
                  const MenuDivider(),
                  MenuButton(
                    onTap: () {},
                    icon: const Icon(Icons.extension),
                    text: const Text('Extensions'),
                  ),
                  const MenuDivider(),
                  MenuButton(
                    icon: const Icon(Icons.looks),
                    text: const Text('Change theme'),
                    submenu: SubMenu(
                      menuItems: [
                        MenuButton(
                          onTap: () {},
                          icon: const Icon(Icons.light_mode),
                          text: const Text('Light theme'),
                        ),
                        const MenuDivider(),
                        MenuButton(
                          onTap: () {},
                          icon: const Icon(Icons.dark_mode),
                          text: const Text('Dark theme'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const MenuDivider(),
            MenuButton(
              onTap: () {},
              shortcutText: 'Ctrl+Q',
              text: const Text('Exit'),
              icon: const Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
      BarButton(
        text: const Text(
          'Edit',
          style: TextStyle(color: Colors.white),
        ),
        submenu: SubMenu(
          menuItems: [
            MenuButton(
              onTap: () {},
              text: const Text('Undo'),
              shortcutText: 'Ctrl+Z',
            ),
            MenuButton(
              onTap: () {},
              text: const Text('Redo'),
              shortcutText: 'Ctrl+Y',
            ),
            const MenuDivider(),
            MenuButton(
              onTap: () {},
              text: const Text('Cut'),
              shortcutText: 'Ctrl+X',
            ),
            MenuButton(
              onTap: () {},
              text: const Text('Copy'),
              shortcutText: 'Ctrl+C',
            ),
            MenuButton(
              onTap: () {},
              text: const Text('Paste'),
              shortcutText: 'Ctrl+V',
            ),
            const MenuDivider(),
            MenuButton(
              onTap: () {},
              text: const Text('Find'),
              shortcutText: 'Ctrl+F',
            ),
          ],
        ),
      ),
      BarButton(
        text: const Text(
          'Help',
          style: TextStyle(color: Colors.white),
        ),
        submenu: SubMenu(
          menuItems: [
            MenuButton(
              onTap: () {},
              text: const Text('Check for updates'),
            ),
            const MenuDivider(),
            MenuButton(
              onTap: () {},
              text: const Text('View License'),
            ),
            const MenuDivider(),
            MenuButton(
              onTap: () {},
              icon: const Icon(Icons.info),
              text: const Text('About'),
            ),
          ],
        ),
      ),
    ];
  }

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
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                Column(
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
                          ElevatedButton(
                              onPressed: () {
                                registrationController.uploadImage();
                              },
                              child: Text("hi")),
                          const Center(
                            child: Text(
                              "Registration",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColor.btnColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 23 / h * h,
                          ),
                          textFileldTitle(title: "State", icon: null),
                          SizedBox(
                            height: 5 / h * h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xfff5f5f5),
                                borderRadius: BorderRadius.circular(10)),
                            child: DropdownButtonFormField<String>(
                              dropdownColor: Colors.white,
                              value: registrationController
                                      .selectedStateId.isNotEmpty
                                  ? registrationController.selectedStateId
                                  : null,
                              menuMaxHeight: 200,
                              isExpanded: true,
                              items: registrationController.stateList
                                  .map((element) {
                                return DropdownMenuItem<String>(
                                  value: element.id.toString(),
                                  child: Text(element.state ?? ''),
                                );
                              }).toList(),
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
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
                                  borderSide: const BorderSide(
                                      color: Color(0xffd9d9d9)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xffd9d9d9)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onChanged: (value) {
                                registrationController.selectedStateId =
                                    value.toString();
                                registrationController.selectDistrict(
                                    stateId: registrationController
                                        .selectedStateId
                                        .toString());
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10 / h * h,
                          ),
                          textFileldTitle(title: "District", icon: null),
                          SizedBox(
                            height: 5 / h * h,
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
                              value: registrationController
                                      .selectedDistrictId.isNotEmpty
                                  ? registrationController.selectedDistrictId
                                  : null,
                              menuMaxHeight: 200,
                              isExpanded: true,
                              items: registrationController.districtList
                                  .map((element) {
                                return DropdownMenuItem<String>(
                                  value: element.id.toString(),
                                  child: Text(element.districtName ?? ''),
                                );
                              }).toList(),
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
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
                                  borderSide: const BorderSide(
                                      color: Color(0xffd9d9d9)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xffd9d9d9)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: Colors.red),
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
                          customCard(
                            cardColor: Colors.red,
                            title: "Select Image",
                            icon: Icons.image,
                            context: context,
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  Widget textFileldTitle({required String title, IconData? icon}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (icon != null)
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

  Widget customCard({
    required Color cardColor,
    required String title,
    required IconData? icon,
    required BuildContext context,
    required Function() onPressed,
  }) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(30),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onPressed,
        splashColor: Colors.black.withOpacity(0.3),
        child: Container(
          width: 274 / h * h,
          height: 70 / w * w,
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: double.infinity,
                width: 65 / w * w,
                child: Row(
                  children: [
                    const Spacer(),
                    Container(
                      height: 60 / h * h,
                      width: 60 / w * w,
                      padding: EdgeInsets.all(18 / h * h),
                      decoration: BoxDecoration(
                        color: AppColor.cardSecondary,
                        border: Border.all(color: AppColor.whiteTxt, width: 2),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(icon),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColor.whiteTxt,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: double.infinity,
                width: 65 / w * w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
