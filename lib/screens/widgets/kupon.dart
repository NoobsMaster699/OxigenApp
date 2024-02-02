import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomUserInfoWidget extends StatelessWidget {
  final String username;
  final String voucherIconPath;
  final String pointsIconPath;
  final String voucherCount;
  final String pointsCount;

  CustomUserInfoWidget({
    required this.username,
    required this.voucherIconPath,
    required this.pointsIconPath,
    required this.voucherCount,
    required this.pointsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 60,
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi!, $username",
                  style: TextStyle(
                    fontFamily: "Joss",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        voucherIconPath,
                        height: 26,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Center(
                      child: Text(
                        voucherCount,
                        style: TextStyle(
                          fontFamily: "Joss",
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Row(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        pointsIconPath,
                        height: 26,
                      ),
                    ),
                    SizedBox(width: 10),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: "Joss",
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: pointsCount + " ",
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: "pts",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
