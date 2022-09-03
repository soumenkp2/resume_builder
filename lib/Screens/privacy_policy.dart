import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../AppUtils/CurvedWidget.dart';

class privacy_policy extends StatefulWidget {
  @override
  State<privacy_policy> createState() => _privacypolicyState();
}

class _privacypolicyState extends State<privacy_policy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            color: Colors.white38,
            child: SingleChildScrollView(
                child: Column(
              children: [
                CurvedWidget(
                  s: "Privacy Policy",
                  size: 22,
                  color: Color(0xFF011639),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,),
                        children: <TextSpan> [
                        TextSpan(
                            text:
                                'Kriti Saxena built the Instant Resume Maker an Ad Supported app. This SERVICE is provided by Kriti Saxena at no cost and is intended for use as is.\n'
                                'This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.\n'
                                'If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.\n'
                                'The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Resume Builder , Xbox unless otherwise defined in this Privacy Policy.\n\n'),
                        TextSpan(text: 'Information Collection and Use:\n',style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                'For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information. The information that I request will be retained on your device and is not collected by me in any way.\n'
                                'The app does use third party services that may collect information used to identify you.\n\n'
                                'Link to privacy policy of third party service providers used by the app\n'
                                'Google Play Services\n'
                                'AdMob\n'
                                'Firebase Analytics\n'
                                'Fabric\n'
                                'Log Data\n\n'
                                'I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.\n\n'),
                        TextSpan(text: 'Cookies\n',style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                'Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your devices internal memory.\n'
                                'This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.\n\n'),
                        TextSpan(text: 'Service Providers\n',style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                'I may employ third-party companies and individuals due to the following reasons:\n'
                                'To facilitate our Service;\n'
                                'To provide the Service on our behalf;\n'
                                'To perform Service-related services; or\n'
                                'To assist us in analyzing how our Service is used.\n'
                                'I want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.\n\n'),
                        TextSpan(text: 'Security\n',style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                'I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.\n\n'),
                        TextSpan(text: 'Links to Other Sites\n',style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                'This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.\n\n'),
                        TextSpan(text: 'Children’s Privacy\n',style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                'These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do necessary actions.\n\n'),
                        TextSpan(text: 'Changes to This Privacy Policy\n',style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                'I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately after they are posted on this page.\n\n'),
                        TextSpan(text: 'Contact Us\n',style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text:
                              'If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me,\n',
                        ),
                          TextSpan(text: '» By email: 18kritisaxena@gmail.com\n\n',style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                )
              ],
            ))));
  }
}
