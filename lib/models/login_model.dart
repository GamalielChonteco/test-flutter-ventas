import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    LoginResponse({
        this.username,
        this.accessToken,
        this.refreshToken,
    });

    String username;
    String accessToken;
    String refreshToken;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        username: json["username"],
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "access_token": accessToken,
        "refresh_token": refreshToken,
    };
}
