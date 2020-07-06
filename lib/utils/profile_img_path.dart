
import 'dart:convert';

String getProfileImgPath(String username) {
  final encoder = AsciiEncoder();
  List<int> codes = encoder.convert(username);
  int sum = 0;
  codes.forEach((element) => sum += element);

  final imgNum = sum%1000;

  return "https://picsum.photos/id/$imgNum/30/30";
}