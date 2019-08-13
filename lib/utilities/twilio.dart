library twilio_dart_cli;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:hrisa/utilities/twilio_messages.dart';
import 'package:hrisa/utilities/twilio_utils.dart';
import 'package:hrisa/utilities/twilio_validator.dart';

class Twilio {
  final _baseUri = "api.twilio.com";
  http.Client _httpClient;
  Messages _messages;
  Map<String, String> _auth = new Map<String, String>();
  IValidator _validator = new Validator();

  Twilio(String key, String authToken, String version,
      [http.Client httpClient = null]) {
    _auth['accountSid'] = key;
    _auth['authToken'] = authToken;
    _auth['apiVersion'] = version;
    _auth['baseUri'] = _baseUri;
    this._httpClient = (httpClient == null) ? new http.Client() : httpClient;
    this._messages = new Messages(key);
  }

  // Messages
  Future sendSMS(String from, String to, String body,
      [String mediaUrl = null]) {
    Map<String, String> _parameters;
    _parameters = {
      'From': from,
      'To': to,
      'Body': body
    };
    // If we're trying to send an MMS
    if (mediaUrl != null) {
      _parameters.addAll({
        'media_url': mediaUrl
      });
    }
    return apiRequest(
        _messages.getPostResource(), _httpClient, _auth, verb: 'POST',
        body: _parameters).then((msg) {
      return _validator.validateResponse(msg);
    });
  }
}