import 'package:go_router/go_router.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/core/utils/configs/styles/colors.dart';
import 'package:myapp/core/utils/shared/constant/assetsPathes.dart';
import 'package:myapp/features/dashboard/controller/dashboardController.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  final Widget child;
  const DashboardPage({super.key, required this.child});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var title = [
    "BH Verification",
    "AH Verification",
    "Varification Report",
    "Manual Pawn Ticket",
    "Printed PT without Proper photo",
    "Updated Pawn Ticket Barcode",
    "Exit"
  ];
  var icons = [
    AssetsPathes.download,
    AssetsPathes.download,
    AssetsPathes.download,
    AssetsPathes.download,
    AssetsPathes.download,
    AssetsPathes.download,
    AssetsPathes.download,
  ];
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final dashboardcontroller = Provider.of<DashboardController>(context);
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
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 48 / h * h,
            width: w,
            decoration: const BoxDecoration(
              color: AppColor.whiteTxt,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Spacer(
                  flex: 1,
                ),
                Container(
                  height: 26 / h * h,
                  width: w,
                  decoration: BoxDecoration(
                    color: AppColor.whiteTxt,
                    border: Border.all(color: AppColor.skyBorder, width: 2),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: w * 0.25,
                      ),
                      const Expanded(
                          child: SizedBox(
                        child: Center(
                          child: MarqueeText(
                            text: TextSpan(
                              text:
                                  '.... Update Manual Pawn Ticket Status ... Please Contact Risk Management Department ....',
                            ),
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColor.txtColor,
                            ),
                            alwaysScroll: true,
                            speed: 30,
                          ),
                        ),
                      )),
                      SizedBox(
                        width: w * 0.25,
                      )
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                )
              ],
            ),
          ),
          Container(
            height: 50 / h * h,
            width: w,
            decoration: const BoxDecoration(
              color: AppColor.appBarColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 146 / w * w,
                  child: Row(
                    children: [
                      const Spacer(),
                      Image.asset(
                        AssetsPathes.mLogo,
                        fit: BoxFit.fill,
                        height: 33 / h * h,
                        width: 96 / w * w,
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    child: Center(
                      child: Text("MANAPPURAM FINANCE LIMITED - A  O VALAPAD",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColor.txtColorBrown,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  width: 146 / w * w,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: 82 / w * w, right: 82 / w * w, top: 27 / h * h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customCard(
                      onPressed: () {},
                      imgPath: AssetsPathes.book,
                      title: "DAY BOOK",
                      cardColor: AppColor.cardColor,
                      context: context,
                    ),
                    customCard(
                      onPressed: () {},
                      imgPath: AssetsPathes.download,
                      title: "STICKER UPDATION",
                      cardColor: AppColor.cardColor,
                      context: context,
                    ),
                    customCard(
                      onPressed: () {},
                      imgPath: AssetsPathes.download,
                      title: "TAREWT UPDATION",
                      cardColor: AppColor.cardColor,
                      context: context,
                    ),
                  ],
                ),
                SizedBox(
                  height: 18 / h * h,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.conColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 275 / w * w,
                      height: 376 / h * h,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColor.btnColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 40 / w * w,
                            height: 376 / h * h,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            // dashboardcontroller
                                            //     .changeCurrentWidget(
                                            //         index, context);

                                            if (index == 0) {
                                              GoRouter.of(context)
                                                  .goNamed('ahVerfication');
                                            } else if (index == 1) {
                                              GoRouter.of(context)
                                                  .goNamed('bhVerfication');
                                            }
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              drawerIcon(
                                                  assetName: icons[index]),
                                              Expanded(
                                                  child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: drawerTxt(
                                                            txt: title[index]),
                                                      ))),
                                            ],
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          height: 30 / h * h,
                                        );
                                      },
                                      itemCount: title.length),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 18 / w * w,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 376 / h * h,
                        decoration: BoxDecoration(
                          color: AppColor.conColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: widget.child,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget customCard({
    required Color cardColor,
    required String title,
    required String imgPath,
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
                      child: SvgPicture.asset(imgPath),
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

  Widget drawerTxt({required String txt}) {
    return Text(
      txt,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColor.txtColor,
      ),
    );
  }

  Widget drawerIcon({required String assetName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SvgPicture.asset(
        assetName,
        width: 20,
        height: 14,
      ),
    );
  }
}
