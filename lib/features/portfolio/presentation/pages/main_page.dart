import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          Strings.portfolio,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.errorColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.logout,
                  color: AppColors.errorColor,
                  size: 20,
                ),
              ),
              onPressed: () async {
                await ref.read(authNotifierProvider.notifier).logout();
                if (context.mounted) {
                  context.go('/login');
                }
              },
              tooltip: Strings.logout,
            ),
          ),
        ],
      ),
      body: portfolioState.when(
        initial: () => const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
          ),
        ),
        error: (failure) => Center(
          child: Card(
            margin: const EdgeInsets.all(20),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColors.errorColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.error_outline,
                      size: 30,
                      color: AppColors.errorColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '데이터를 불러오는 중 오류가 발생했습니다',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    failure.toString(),
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      ref
                          .read(portfolioNotifierProvider.notifier)
                          .refreshAssets();
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('다시 시도'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        loaded: (assets) => SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.primaryColor.withValues(alpha: 0.05),
                        Colors.white,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        Strings.assetAllocation,
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '현재 포트폴리오 구성 비율',
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        height: 250,
                        child: GestureDetector(
                          onTap: () {
                            context.go('/stocks');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: PieChart(
                              PieChartData(
                                sections: assets.map((asset) {
                                  return PieChartSectionData(
                                    value: asset.ratio,
                                    title: '${asset.ratio}%',
                                    color: _getColorByType(asset.type),
                                    radius: 80,
                                    titleStyle: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(1, 1),
                                          blurRadius: 2,
                                          color: Colors.black26,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                borderData: FlBorderData(show: false),
                                sectionsSpace: 3,
                                centerSpaceRadius: 50,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.primaryColor.withValues(
                              alpha: 0.2,
                            ),
                          ),
                        ),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Icon(
                              Icons.touch_app,
                              size: 16,
                              color: AppColors.primaryColor,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              Strings.chartTooltip,
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withValues(
                                alpha: 0.1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.legend_toggle,
                              color: AppColors.primaryColor,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            Strings.legend,
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildLegendItem(Strings.stock, AppColors.stockColor),
                      const SizedBox(height: 8),
                      _buildLegendItem(Strings.bond, AppColors.bondColor),
                      const SizedBox(height: 8),
                      _buildLegendItem(Strings.etc, AppColors.etcColor),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.3),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
          const Spacer(),
          Icon(Icons.circle, color: color, size: 8),
        ],
      ),
    );
  }
}
