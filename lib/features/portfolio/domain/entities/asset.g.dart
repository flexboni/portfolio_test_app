// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssetImpl _$$AssetImplFromJson(Map<String, dynamic> json) => _$AssetImpl(
  securitySymbol: json['securitySymbol'] as String,
  type: json['type'] as String,
  securityName: json['securityName'] as String,
  securityDescription: json['securityDescription'] as String,
  quantity: (json['quantity'] as num).toInt(),
  ratio: (json['ratio'] as num).toDouble(),
);

Map<String, dynamic> _$$AssetImplToJson(_$AssetImpl instance) =>
    <String, dynamic>{
      'securitySymbol': instance.securitySymbol,
      'type': instance.type,
      'securityName': instance.securityName,
      'securityDescription': instance.securityDescription,
      'quantity': instance.quantity,
      'ratio': instance.ratio,
    };
