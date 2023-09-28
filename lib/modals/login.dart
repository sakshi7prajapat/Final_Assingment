import 'dart:convert';

LoginModal loginModalFromJson(String str) => LoginModal.fromJson(json.decode(str));

String loginModalToJson(LoginModal data) => json.encode(data.toJson());

class LoginModal {
    int? status;
    String? error;

    LoginModal({
        this.status,
        this.error,
    });

    factory LoginModal.fromJson(Map<String, dynamic> json) => LoginModal(
        status: json["status"],
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
    };
}
