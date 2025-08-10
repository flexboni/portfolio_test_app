import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/asset.dart';
import '../../../../core/error/failures.dart';

part 'portfolio_state.freezed.dart';

@freezed
class PortfolioState with _$PortfolioState {
  const factory PortfolioState.initial() = PortfolioInitial;
  const factory PortfolioState.loading() = PortfolioLoading;
  const factory PortfolioState.loaded(List<Asset> assets) = PortfolioLoaded;
  const factory PortfolioState.error(Failure failure) = PortfolioError;
}