// ignore_for_file: unnecessary_this, prefer_collection_literals, unnecessary_new

class LoggedUser {
  String? displayName;
  String? email;
  bool? emailVerified;
  String? photoURL;

  LoggedUser({
    this.displayName = "",
    this.email = "",
    this.emailVerified = false,
    this.photoURL = ""
  });

  LoggedUser.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    email = json['email'];
    emailVerified = json['emailVerified'];
    photoURL = json['photoURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['email'] = this.email;
    data['emailVerified'] = this.emailVerified;
    data['photoURL'] = this.photoURL;
    return data;
  }
}