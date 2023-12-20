import 'package:freezed_annotation/freezed_annotation.dart';

part 'crowd.freezed.dart';
part 'crowd.g.dart';

@freezed
class Crowd with _$Crowd {
  factory Crowd({
    @JsonKey(
      name: 'chair count',
    )
    required int chairCount,
    @JsonKey(
      name: 'person count',
    )
    required int personCount,
  }) = _Crowd;

  factory Crowd.fromJson(Map<String, dynamic> json) => _$CrowdFromJson(json);
}
