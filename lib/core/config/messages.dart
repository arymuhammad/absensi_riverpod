class FailureMessage {
  static const jsonParse = "JSON parsing failed";
  static const absenFetched = "Failed to fetch absen";
  static const authFetched = "Failed to authenticate";
  static const attendanceFetched = "Failed to fetch attendance data";
  static const historyFetched = "Failed to fetch history data";
  static const getRequestMessage = "GET REQUEST FAILED";
  static const postRequestMessage = "POST REQUEST FAILED";
  static const putRequestMessage = "PUT REQUEST FAILED";
  static const deleteRequestMessage = "DELETE REQUEST FAILED";
  static const jsonParsingFailed = "FAILED TO PARSE JSON RESPONSE";
  static const authTokenEmpty = "AUTH TOKEN EMPTY";
}

class SuccessMessage {
  static const absenFetched = "Absen fetched successfully";
  static const authFetched = "Authentication successfully";
  static const attendanceFetched = "Attendance data fetch successfully";
  static const historyFetched = "History data fetch successfully";
}

class LogLabel {
  static const product = "PRODUCT";
  static const auth = "AUTH";
  static const httpGet = "HTTP/GET";
  static const httpPost = "HTTP/POST";
  static const httpPut = "HTTP/PUT";
  static const httpDelete = "HTTP/DELETE";
  static const sharedPrefs = "SHARED_PREFERENCES";
}
