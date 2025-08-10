import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/constants.dart';
import '../../../../features/auth/presentation/providers/auth_notifier.dart';
import '../providers/portfolio_notifier.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final portfolioState = ref.watch(portfolioNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.portfolio),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await ref.read(authNotifierProvider.notifier).logout();
              if (context.mounted) {
                context.go('/login');
              }
            },
            tooltip: Strings.logout,
          ),
        ],
      ),
      body: portfolioState.when(
        initial: () => const Center(child: CircularProgressIndicator()),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (failure) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Error: ${failure.toString()}',
                style: const TextStyle(color: AppColors.errorColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(portfolioNotifierProvider.notifier).refreshAssets();
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
        loaded: (assets) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
            Text(
              Strings.assetAllocation,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 32),
            Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: () {
                  // 원형 그래프 클릭 시 전체 주식 화면으로 이동
                  context.go('/stocks');
                },
                child: PieChart(
                  PieChartData(
                    sections: assets.map((asset) {
                      return PieChartSectionData(
                        value: asset.ratio,
                        title: '${asset.ratio}%',
                        color: _getColorByType(asset.type),
                        radius: 100,
                        titleStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.chartTextColor,
                        ),
                      );
                    }).toList(),
                    borderData: FlBorderData(show: false),
                    sectionsSpace: 2,
                    centerSpaceRadius: 40,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              Strings.chartTooltip,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.legend,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildLegendItem(Strings.stock, AppColors.stockColor),
                        _buildLegendItem(Strings.bond, AppColors.bondColor),
                        _buildLegendItem(Strings.etc, AppColors.etcColor),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}