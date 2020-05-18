import 'package:http/http.dart' as http;
import 'dart:convert';

const coronaAPI= 'https://api.covid19india.org/state_district_wise.json';
const tnAPI = 'https://api.covid19india.org/data.json';
class CoronaCases {

  Future getCases(selectedDistrict) async {
    String requestURL = coronaAPI;
    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      int activeData = decodedData['Tamil Nadu']['districtData']['$selectedDistrict']['active'];
     int infectedData = decodedData['Tamil Nadu']['districtData']['$selectedDistrict']['confirmed'];
      int recoveredData = decodedData['Tamil Nadu']['districtData']['$selectedDistrict']['recovered'];


      //statewise[4].state/active/in==
      //Tamil Nadu.districtData.Salem.active

      return [activeData,infectedData,recoveredData];
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
  Future getTNCases() async {
    String requestURL = tnAPI;
    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      String activeSData = decodedData['statewise'][4]['active'];
      String infectedSData = decodedData['statewise'][4]['confirmed'];
      String recoveredSData = decodedData['statewise'][4]['recovered'];
      int activeData = int.parse(activeSData);
      int infectedData = int.parse(infectedSData);
      int recoveredData = int.parse(recoveredSData);
      return [activeData,infectedData,recoveredData];
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}

const List<String> districtList = [
  'Ariyalur',
  'Chengalpattu',
  'Chennai',
  'Coimbatore',
  'Cuddalore',
  'Dharmapuri',
  'Dindigul',
  'Erode',
  'Kallakurichi',
  'Kancheepuram',
  'Kanyakumari',
  'Karur',
  'Krishnagiri',
  'Madurai',
  'Nagapattinam',
  'Namakkal',
  'Nilgiris',
  'Perambalur',
  'Pudukkottai',
  'Ramanathapuram',
  'Ranipet',
  'Salem',
  'Sivaganga',
  'Tenkasi',
  'Thanjavur',
  'Theni',
  'Thiruvallur',
  'Thiruvarur',
  'Thoothukkudi',
  'Tiruchirappalli',
  'Tirunelveli',
  'Tirupathur',
  'Tiruppur',
  'Tiruvannamalai',
  'Vellore',
  'Viluppuram',
  'Virudhunagar'
];
