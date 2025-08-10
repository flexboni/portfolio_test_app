import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/asset.dart';
import '../../../../core/constants/constants.dart';

class StockListPage extends StatelessWidget {
  const StockListPage({super.key});

  List<Asset> get _mockAssets => MockData.assets;

  Color _getColorByType(String type) {
    switch (type) {
      case 'stock':
        return AppColors.stockColor;
      case 'bond':
        return AppColors.bondColor;
      case 'etc':
        return AppColors.etcColor;
      default:
        return AppColors.defaultColor;
    }
  }

  String _getTypeLabel(String type) {
    switch (type) {
      case 'stock':
        return Strings.stock;
      case 'bond':
        return Strings.bond;
      case 'etc':
        return Strings.etc;
      default:
        return Strings.unknown;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.stockList),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/main');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.assetList,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              '${Strings.totalAssets} ${_mockAssets.length}${Strings.assetsUnit}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _mockAssets.length,
                itemBuilder: (context, index) {
                  final asset = _mockAssets[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: _getColorByType(asset.type),
                        child: Text(
                          asset.securitySymbol.substring(0, 1),
                          style: const TextStyle(
                            color: AppColors.chartTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        asset.securityName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${asset.securitySymbol} • ${_getTypeLabel(asset.type)}'),
                          Text(
                            asset.securityDescription,
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${asset.ratio}%',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${Strings.quantity}: ${asset.quantity}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        // 개별 종목 상세 정보 (현재는 스낵바로 표시)
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${asset.securityName} ${Strings.stockDetailInfo}'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}