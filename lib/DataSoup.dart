import 'package:http/http.dart' as http;


class HtmlDataSoup {
  static final String _url = "http://www.mzitu.com";
  
  final String _userAgent = "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31";

  Future<String> parsePage() async {
    print("fetch : " + _url);
    var client = http.Client();
    try{
      Map<String,String> map = {"userAgent": _userAgent};
      var resp = await client.get(_url , headers : map);

      return resp.body;
    }catch(e){
      print(e);
    }finally{
      client.close();
    }
    return "";
  }

}//end class