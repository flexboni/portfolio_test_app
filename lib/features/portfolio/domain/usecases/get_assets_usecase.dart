import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/asset.dart';
import '../repositories/portfolio_repository.dart';

class GetAssetsUseCase {
  final PortfolioRepository repository;

  GetAssetsUseCase(this.repository);

  Future<Either<Failure, List<Asset>>> call() async {
    return await repository.getAssets();
  }
}