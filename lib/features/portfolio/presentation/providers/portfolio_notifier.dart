import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/providers/providers.dart';
import '../../domain/usecases/get_assets_usecase.dart';
import '../states/portfolio_state.dart';

part 'portfolio_notifier.g.dart';

@riverpod
class PortfolioNotifier extends _$PortfolioNotifier {
  late GetAssetsUseCase _getAssetsUseCase;

  @override
  PortfolioState build() {
    _getAssetsUseCase = ref.watch(getAssetsUseCaseProvider);
    
    // Auto-load assets when initialized
    loadAssets();
    
    return const PortfolioState.initial();
  }

  Future<void> loadAssets() async {
    state = const PortfolioState.loading();

    final result = await _getAssetsUseCase();

    result.fold(
      (failure) => state = PortfolioState.error(failure),
      (assets) => state = PortfolioState.loaded(assets),
    );
  }

  Future<void> refreshAssets() async {
    await loadAssets();
  }
}