class Authentication {
  String? status;
  String? message;
  User? user;
  Authorisation? authorisation;

  Authentication(
      {this.status, this.message, this.user, this.authorisation});

  Authentication.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    authorisation = json['authorisation'] != null
        ? new Authorisation.fromJson(json['authorisation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.authorisation != null) {
      data['authorisation'] = this.authorisation!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? email;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? profileUrl;

  User(
      {this.name,
        this.email,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.profileUrl});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    profileUrl = json['profile_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['profile_url'] = this.profileUrl;
    return data;
  }
}

class Authorisation {
  String? token;
  String? type;

  Authorisation({this.token, this.type});

  Authorisation.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['type'] = this.type;
    return data;
  }
}