class UserModel {
  String email;
  String invitationcode;
  String transpassword;
  String uid;

  UserModel({
    required this.email,
    required this.uid,
    required this.invitationcode,
    required this.transpassword,
  });
  Map<String, dynamic> toJson() => {
        "email": email,
        "invitationcode": invitationcode,
        "uid": uid,
        "transpassword": transpassword,
      };
}
