import 'dart:convert';
import 'dart:io';
import 'package:LMShubAdmin/helpers/helper.dart';
import 'package:LMShubAdmin/models/borrow.dart';
import 'package:LMShubAdmin/models/book.dart';
import 'package:LMShubAdmin/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:LMShubAdmin/repository/user_repository.dart' as userRepo;

User currentUser = new User();
final navigatorKey = GlobalKey<NavigatorState>();

Future<Stream<Book>> allBook() async {
  User _user = userRepo.currentUser;
  final String _token = _user.token;
  final String url =
      '${GlobalConfiguration().getValue('api_url')}student/books';
  print(url);
  final client = new http.Client();
  var request = new http.Request('POST', Uri.parse(url));
  request.headers[HttpHeaders.contentTypeHeader] = 'application/json';
  request.headers[HttpHeaders.authorizationHeader] = 'Bearer $_token';
  print(_token);
  final streamedRest = await client.send(request);
  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getData(data))
      .expand((data) => (data as List))
      .map((data) {
    return Book.fromJSON(data);
  });
}

Future<Stream<Borrow>> myBorrow() async {
  User _user = userRepo.currentUser;
  final String _token = _user.token;
  final String url = '${GlobalConfiguration().getValue('api_url')}book/borrow';
  final client = new http.Client();
  var request = new http.Request('POST', Uri.parse(url));
  request.headers[HttpHeaders.contentTypeHeader] = 'application/json';
  request.headers[HttpHeaders.authorizationHeader] = 'Bearer $_token';
  final streamedRest = await client.send(request);
  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getData(data))
      .expand((data) => (data as List))
      .map((data) {
    print(Borrow.fromJSON(data));
    return Borrow.fromJSON(data);
  });
}

Future<Stream<Book>> bookDetail(id) async {
  User _user = userRepo.currentUser;
  final String _token = _user.token;
  final String url =
      '${GlobalConfiguration().getValue('api_url')}book/details/$id';
  final client = new http.Client();
  var request = new http.Request('POST', Uri.parse(url));
  request.headers[HttpHeaders.contentTypeHeader] = 'application/json';
  request.headers[HttpHeaders.authorizationHeader] = 'Bearer $_token';
  final streamedRest = await client.send(request);
  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getObjectData(data))
      .expand((data) => (data as List))
      .map((data) {
    return Book.fromJSON(data);
  });
}

addBorrow(Borrow borrow, bookId) async {
  User _user = userRepo.currentUser;
  final String _token = _user.token;
  final String url =
      '${GlobalConfiguration().getValue('api_url')}borrow/$bookId';
  final client = new http.Client();
  final response = await client.post(
    url,
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $_token',
    },
    body: json.encode(borrow.toMap()),
  );
  return response.statusCode;
}

addBook(Book book) async {
  final String url = '${GlobalConfiguration().getValue('api_url')}add_books';
  User _user = userRepo.currentUser;
  final String _token = _user.token;
  final client = new http.Client();
  final response = await client.post(
    url,
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $_token',
    },
    body: json.encode(book.toMap()),
  );

  print(response.statusCode);
  return response.statusCode;
}
