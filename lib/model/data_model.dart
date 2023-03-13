class DataModel {
  DataModel(email,{

     this.hashedPassword,
     this.isActive,
     this.isSuperuser,
     this.isVerified,
     this.oathAccounts,
     this.username,
     this.firstName,
     this.lastName,
     this.picture,
     this.createdAt,
     this.updatedAt,
     this.lastLoginAt,
  });
  late final String? email;
  late final String? hashedPassword;
  late final bool? isActive;
  late final bool? isSuperuser;
  late final bool? isVerified;
  late final List<OathAccounts>? oathAccounts;
  late final String? username;
  late final String? firstName;
  late final String? lastName;
  late final String? picture;
  late final String? createdAt;
  late final String? updatedAt;
  late final String? lastLoginAt;

  DataModel.fromJson(Map<String, dynamic> json){
    email = json['email'];
    hashedPassword = json['hashed_password'];
    isActive = json['is_active'];
    isSuperuser = json['is_superuser'];
    isVerified = json['is_verified'];
    oathAccounts = List.from(json['oath_accounts']).map((e)=>OathAccounts.fromJson(e)).toList();
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    picture = json['picture'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lastLoginAt = json['last_login_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['hashed_password'] = hashedPassword;
    _data['is_active'] = isActive;
    _data['is_superuser'] = isSuperuser;
    _data['is_verified'] = isVerified;
    _data['oath_accounts'] = oathAccounts?.map((e)=>e.toJson()).toList();
    _data['username'] = username;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['picture'] = picture;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['last_login_at'] = lastLoginAt;
    return _data;
  }
}

class OathAccounts {
  OathAccounts({
    required this.id,
    required this.oathName,
    required this.accessToken,
    required this.accountId,
    required this.accountEmail,
    required this.expiresAt,
    required this.refreshToken,
  });
  late final String id;
  late final String oathName;
  late final String accessToken;
  late final String accountId;
  late final String accountEmail;
  late final int expiresAt;
  late final String refreshToken;

  OathAccounts.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    oathName = json['oath_name'];
    accessToken = json['access_token'];
    accountId = json['account_id'];
    accountEmail = json['account_email'];
    expiresAt = json['expires_at'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['oath_name'] = oathName;
    _data['access_token'] = accessToken;
    _data['account_id'] = accountId;
    _data['account_email'] = accountEmail;
    _data['expires_at'] = expiresAt;
    _data['refresh_token'] = refreshToken;
    return _data;
  }
}