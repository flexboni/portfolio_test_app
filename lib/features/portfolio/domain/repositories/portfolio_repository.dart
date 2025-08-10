import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/asset.dart';
import '../entities/portfolio.dart';

abstract class PortfolioRepository {
  Future<Either<Failure, List<Asset>>> getAssets();
  Future<Either<Failure, Portfolio>> getPortfolio();
}