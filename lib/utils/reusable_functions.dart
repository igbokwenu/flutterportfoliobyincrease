import 'package:url_launcher/url_launcher.dart';

class MyReusableFunctions {
  static Future<void> launchMail({String? address}) async {
    String encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri url = Uri(
      scheme: 'mailto',
      path: address ?? "increaseodwisdom@gmail.com",
      query: encodeQueryParameters(<String, String>{
        'subject': '🎉I Bring Glad Tidings🚀',
        'body': '<--- Add Glad Tidings Below This Text ---> \n\n',
      }),
    );
    !await launchUrl(url);
  }

  static   Future<void> launchAnyUrl(String url) async {
    await launchUrl(Uri.parse(url));
  }
}
