import '../../domain/entities/asset.dart';
import '../../../../core/constants/mock_data.dart';

abstract class PortfolioDataSource {
  Future<List<Asset>> getAssets();
}

class PortfolioDataSourceImpl implements PortfolioDataSource {
  @override
  Future<List<Asset>> getAssets() async {
    // Mock API delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Return mock data
    return MockData.assets;
  }
}