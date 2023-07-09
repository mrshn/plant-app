import 'package:flutter/material.dart';

class SignBox extends StatelessWidget {
  const SignBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late int notificationCount = 1;
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 64.0,
      decoration: BoxDecoration(
        color: Color(0xff24201A),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Stack(
              children: [
                const Icon(
                  Icons.mail_outline_outlined,
                  size: 40.0,
                  color: Color(0xffD9A846),
                  // color: Color(0xff24201A),
                ),
                Positioned(
                  top: 3.0,
                  right: 3.0,
                  child: Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        '$notificationCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 6.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Free premium available',
                  style: TextStyle(
                    color: Color(0xffD9A846),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Tap to upgrade your account!',
                  style: TextStyle(
                    color: Color(0xffD9A846),
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          const Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: Icon(
              Icons.arrow_forward,
              color: Color(0xffD9A846),
            ),
          ),
        ],
      ),
    );
  }
}
