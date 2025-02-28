// Copyright (c) 2020, alex@justprodev.com.
// All rights reserved. Use of this source code is governed by a
// MIT License that can be found in the LICENSE file.

/// Used when [JsonHttpClient] operates with services which are needs authentication
class AuthInfo {
  /// provide headers across [JsonHttpClient]
  /// [url] url of the request that requests headers
  final Map<String,String>? Function(String url) headers;
  /// Will be called for 401 error ([authHeaders] will be removed from the header immediately),
  /// `isRepeat`==true means that handler was called  at second, because a new auth data is wrong (refreshToken can't succeeded or etc),
  ///  and We probably should redirect to login page
  /// returns: true if toke is refreshed
  final Future<bool> Function(bool logout) onExpire;

  AuthInfo(this.headers, this.onExpire);
}