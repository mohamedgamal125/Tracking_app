// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'https://flower.elevateegy.com/api/v1';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<HttpResponse<ApplyResponseDTO>> apply(
    String country,
    String firstName,
    String lastName,
    String vehicleType,
    String vehicleNumber,
    File vehicleLicense,
    String NID,
    File NIDImg,
    String email,
    String password,
    String rePassword,
    String gender,
    String phone,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('country', country));
    _data.fields.add(MapEntry('firstName', firstName));
    _data.fields.add(MapEntry('lastName', lastName));
    _data.fields.add(MapEntry('vehicleType', vehicleType));
    _data.fields.add(MapEntry('vehicleNumber', vehicleNumber));
    _data.files.add(
      MapEntry(
        'vehicleLicense',
        MultipartFile.fromFileSync(
          vehicleLicense.path,
          filename: vehicleLicense.path.split(Platform.pathSeparator).last,
          contentType: DioMediaType.parse('image/jpeg'),
        ),
      ),
    );
    _data.fields.add(MapEntry('NID', NID));
    _data.files.add(
      MapEntry(
        'NIDImg',
        MultipartFile.fromFileSync(
          NIDImg.path,
          filename: NIDImg.path.split(Platform.pathSeparator).last,
          contentType: DioMediaType.parse('image/jpeg'),
        ),
      ),
    );
    _data.fields.add(MapEntry('email', email));
    _data.fields.add(MapEntry('password', password));
    _data.fields.add(MapEntry('rePassword', rePassword));
    _data.fields.add(MapEntry('gender', gender));
    _data.fields.add(MapEntry('phone', phone));
    final _options = _setStreamType<HttpResponse<ApplyResponseDTO>>(
      Options(
        method: 'POST',
        headers: _headers,
        extra: _extra,
        contentType: 'multipart/form-data',
      )
          .compose(
            _dio.options,
            '/drivers/apply',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApplyResponseDTO _value;
    try {
      _value = ApplyResponseDTO.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<SignInResponseDTO> signIn(SignInRequest data) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data.toJson());
    final _options = _setStreamType<SignInResponseDTO>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'signin',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SignInResponseDTO _value;
    try {
      _value = SignInResponseDTO.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ForgetResponsePasswordDto> forgetPassword(
    Map<String, dynamic> data,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data);
    final _options = _setStreamType<ForgetResponsePasswordDto>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'forgotPassword',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ForgetResponsePasswordDto _value;
    try {
      _value = ForgetResponsePasswordDto.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<VerifyEmailResponseDto> verifyEmail(Map<String, String> code) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(code);
    final _options = _setStreamType<VerifyEmailResponseDto>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'verifyResetCode',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late VerifyEmailResponseDto _value;
    try {
      _value = VerifyEmailResponseDto.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ResetPasswordResponseDTO> resetPassword(
    Map<String, dynamic> data,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data);
    final _options = _setStreamType<ResetPasswordResponseDTO>(
      Options(method: 'PUT', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'resetPassword',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ResetPasswordResponseDTO _value;
    try {
      _value = ResetPasswordResponseDTO.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<HttpResponse<GetVehiclesResponseDTO>> getAllVehicles() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<HttpResponse<GetVehiclesResponseDTO>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/vehicles',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetVehiclesResponseDTO _value;
    try {
      _value = GetVehiclesResponseDTO.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<void> updateOrderState(
    String orderId,
    Map<String, dynamic> data,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data);
    final _options = _setStreamType<void>(
      Options(method: 'PUT', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'orders/state/${orderId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
