import 'package:json_annotation/json_annotation.dart';

part 'send_friend_requests_request_model.g.dart';

@JsonSerializable()
class SendFriendRequestsRequestModel {
  String friendId;

  SendFriendRequestsRequestModel({this.friendId});

  factory SendFriendRequestsRequestModel.fromJson(Map<String, dynamic> data) =>
      _$SendFriendRequestsRequestModelFromJson(data);

  Map<String, dynamic> toJson() => _$SendFriendRequestsRequestModelToJson(this);
}
