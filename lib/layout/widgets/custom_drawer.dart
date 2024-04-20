import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_news/layout/shared/colors.dart';

Widget customDrawer({required context, required height}) => Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text(
              "Setting",
              style: TextStyle(
                fontFamily: 'javanese-text',
              ),
            ),
            leading: const Icon(
              Icons.settings,
            ),
          ),
          ValueListenableBuilder(
            valueListenable: Hive.box("settings").listenable(),
            builder: (BuildContext context, Box box, Widget? child) {
              final isDarkMode = box.get("isDarkMode", defaultValue: false);
              return SwitchListTile(
                value: isDarkMode,
                secondary: CircleAvatar(
                  backgroundColor: AppColors.lightBlue,
                  child: const Icon(
                    Icons.nightlight,
                    color: Colors.white,
                  ),
                ),
                activeColor: AppColors.deepBlue,
                title: const Text(
                  "Dark Mode",
                  style: TextStyle(
                    fontFamily: 'javanese-text',
                  ),
                ),
                onChanged: (value) {
                  box.put("isDarkMode", value);
                },
              );
            },
          ),
          ExpansionTile(
            title: const Text(
              "Contact with me",
              style: TextStyle(
                fontFamily: 'javanese-text',
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: AppColors.lightGrey,
              child: const Icon(
                Icons.mail,
                color: Colors.white,
              ),
            ),
            children: [
              ListTile(
                onTap: () async {
                  String? encodeQueryParameters(Map<String, String> params) {
                    return params.entries
                        .map((MapEntry<String, String> e) =>
                            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                        .join('&');
                  }

                  final Uri emailUri = Uri(
                    scheme: 'mailto',
                    path: 'ismailtodoapp@gmail.com',
                    query: encodeQueryParameters(
                      <String, String>{
                        'subject': 'Hello from News app',
                        'body': "I'am using the app and it's very Good !"
                      },
                    ),
                  );
                  if (await canLaunchUrl(emailUri)) {
                    launchUrl(emailUri);
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          "Sorry , There is an issue , Check your internet connection",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: AppColors.lightGrey,
                      ),
                    );
                  }
                },
                leading: CircleAvatar(
                  backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                  child: Image.asset(
                    'assets/google-logo.png',
                    height: height * 0.9,
                    width: height * 0.9,
                  ),
                ),
                title: const InkWell(
                  child: Text(
                    "E-mail",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontFamily: 'javanese-text',
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () async {
                  final url =
                      Uri.parse('https://www.instagram.com/ismailabboud0');
                  if (await canLaunchUrl(url)) {
                    launchUrl(url);
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          "Sorry , There is an issue , Check your internet connection",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: AppColors.lightGrey,
                      ),
                    );
                  }
                },
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    'assets/instagram-logo.png',
                    height: height * 0.1,
                  ),
                ),
                title: const InkWell(
                  child: Text(
                    "Instagram",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontFamily: 'javanese-text',
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: height * 0.5,
          ),
          const Center(
            child: Text(
              "News app version 1.0 \n by : eng.Ismail Abboud ",
              style: TextStyle(
                fontFamily: 'javanese-text',
              ),
            ),
          ),
        ],
      ),
    );
