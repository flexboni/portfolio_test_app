import 'package:freezed_annotation/freezed_annotation.dart';
import 'asset.dart';

part 'portfolio.freezed.dart';
part 'portfolio.g.dart';

@freezed
class Portfolio with _$Portfolio {
  const factory Portfolio({
    required Result result,
    required PortfolioData data,
  }) = _Portfolio;

  factory Portfolio.fromJson(Map<String, dynamic> json) => _$PortfolioFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    required String message,
    required int code,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class PortfolioData with _$PortfolioData {
  const factory PortfolioData({
    required List<Asset> assetList,
  }) = _PortfolioData;

  factory PortfolioData.fromJson(Map<String, dynamic> json) => _$PortfolioDataFromJson(json);
}