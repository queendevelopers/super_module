// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      username: json['username'] as String?,
      emailVerified: json['emailVerified'] as bool?,
      nickname: json['nickname'] as String?,
      phoneVerified: json['phoneVerified'] as bool?,
      role: json['role'] as String?,
      status: json['status'] as String?,
      social: json['social'] as bool?,
      language: json['language'] as String?,
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
      address: json['address'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      score: (json['score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('emailVerified', instance.emailVerified);
  writeNotNull('phoneVerified', instance.phoneVerified);
  writeNotNull('role', instance.role);
  writeNotNull('status', instance.status);
  writeNotNull('social', instance.social);
  writeNotNull('language', instance.language);
  writeNotNull('_id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('email', instance.email);
  writeNotNull('nickname', instance.nickname);
  writeNotNull('phone', instance.phone);
  writeNotNull('avatar', instance.avatar);
  writeNotNull('address', instance.address);
  writeNotNull('username', instance.username);
  writeNotNull('createdAt', instance.createdAt);
  writeNotNull('updatedAt', instance.updatedAt);
  writeNotNull('score', instance.score);
  return val;
}
