import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/asset.dart';
import '../../domain/entities/portfolio.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../datasources/portfolio_datasource.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioDataSource dataSource;

  PortfolioRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<Asset>>> getAssets() async {
    try {
      final assets = await dataSource.getAssets();
      return Right(assets);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Portfolio>> getPortfolio() async {
    try {
      final assets = await dataSource.getAssets();
      
      final result = Result(message: "Success", code: 200);
      final portfolioData = PortfolioData(assetList: assets);
      final portfolio = Portfolio(
        result: result,
        data: portfolioData,
      );

      return Right(portfolio);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }
}