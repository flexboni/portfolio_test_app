// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PortfolioImpl _$$PortfolioImplFromJson(Map<String, dynamic> json) =>
    _$PortfolioImpl(
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
      data: PortfolioData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PortfolioImplToJson(_$PortfolioImpl instance) =>
    <String, dynamic>{'result': instance.result, 'data': instance.data};

_$ResultImpl _$$ResultImplFromJson(Map<String, dynamic> json) => _$ResultImpl(
  message: json['message'] as String,
  code: (json['code'] as num).toInt(),
);

Map<String, dynamic> _$$ResultImplToJson(_$ResultImpl instance) =>
    <String, dynamic>{'message': instance.message, 'code': instance.code};

_$PortfolioDataImpl _$$PortfolioDataImplFromJson(Map<String, dynamic> json) =>
    _$PortfolioDataImpl(
      assetList: (json['assetList'] as List<dynamic>)
          .map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PortfolioDataImplToJson(_$PortfolioDataImpl instance) =>
    <String, dynamic>{'assetList': instance.assetList};
