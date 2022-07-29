// import 'package:http_interceptor/http_interceptor.dart';
// import 'package:http_interceptor/models/request_data.dart';
// import 'package:http_interceptor/models/response_data.dart';

// class LoggingInterceptor implements InterceptorContract {
//   @override
//   Future<RequestData> interceptRequest({RequestData data}) async {
//     print(data.url.toString());
//     print(data.baseUrl.toString());
//     print(data.method.toString());
//     print(data.headers.toString());
//     print(data.body.toString());
//     return data;
//   }

//   @override
//   Future<ResponseData> interceptResponse({ResponseData data}) async {
//     print(data.body.toString());

//     return data;
//   }
// }
