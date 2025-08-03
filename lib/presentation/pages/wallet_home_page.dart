import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_study/config/constants/image_constants.dart';
import 'package:get_study/presentation/controllers/home/home_controller.dart';
import 'package:get_study/presentation/widgets/portfolio_value_card.dart';
import 'package:get_study/presentation/components/quick_action_grid.dart';
import 'package:get_study/presentation/widgets/quick_action_button.dart';
import 'package:get_study/presentation/widgets/section_header.dart';
import 'package:get_study/presentation/widgets/asset_item_card.dart';
import 'package:get_study/presentation/widgets/transaction_item_card.dart';

class WalletHomePage extends GetView<HomeController> {
  const WalletHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          backgroundColor: Theme.of(context).primaryColor,
          color: Colors.white,
          onRefresh: () async => await controller.pullToRefresh(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                _buildHeader(context),
                _buildPortfolioSection(),
                _buildQuickActionsSection(),
                _buildAssetsSection(),
                _buildTransactionsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
              const SizedBox(height: 4),
              Obx(
                () => Text(
                  controller.user.value.name.isNotEmpty
                      ? controller.user.value.name
                      : 'Welcome',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.secondary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.notifications_outlined, size: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioSection() {
    return const PortfolioValueCard(
      totalValue: '\$47,824.33',
      dailyChange: '+\$1,094.23 Today',
      dailyChangePercent: '+2.34%',
      isPositive: true,
    );
  }

  Widget _buildQuickActionsSection() {
    return QuickActionGrid(
      actionButtons: [
        QuickActionButton(
          label: 'Send',
          icon: Icons.arrow_upward,
          onTap: () {},
        ),
        QuickActionButton(
          label: 'Receive',
          icon: Icons.arrow_downward,
          onTap: () {},
        ),
        QuickActionButton(label: 'Buy', icon: Icons.add, onTap: () {}),
        QuickActionButton(label: 'Swap', icon: Icons.swap_horiz, onTap: () {}),
      ],
    );
  }

  Widget _buildAssetsSection() {
    final assets = [
      {
        'symbol': 'BTC',
        'name': 'Bitcoin',
        'balance': '0.2847',
        'value': '\$18,429.33',
        'change': '+5.67%',
        'isPositive': true,
        'icon': ImageConstants.bitcoinLogo,
      },
      {
        'symbol': 'ETH',
        'name': 'Ethereum',
        'balance': '4.2156',
        'value': '\$12,847.91',
        'change': '+2.14%',
        'isPositive': true,
        'icon': ImageConstants.ethereumLogo,
      },
      {
        'symbol': 'TRX',
        'name': 'Tron',
        'balance': '15,842.33',
        'value': '\$2,573.42',
        'change': '-1.23%',
        'isPositive': false,
        'icon': ImageConstants.tronTrxLogo,
      },
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SectionHeader(title: 'Your Assets'),
          const SizedBox(height: 16),
          ...assets.map(
            (asset) => AssetItemCard(
              symbol: asset['symbol'] as String,
              name: asset['name'] as String,
              balance: asset['balance'] as String,
              value: asset['value'] as String,
              change: asset['change'] as String,
              isPositive: asset['isPositive'] as bool,
              icon: SvgPicture.asset(
                asset['icon'] as String,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionsSection() {
    final transactions = [
      {
        'type': TransactionType.received,
        'asset': 'BTC',
        'amount': '+0.0045',
        'time': '2 hours ago',
        'isPositive': true,
      },
      {
        'type': TransactionType.sent,
        'asset': 'ETH',
        'amount': '-0.125',
        'time': '5 hours ago',
        'isPositive': false,
      },
      {
        'type': TransactionType.swapped,
        'asset': 'TRX → BTC',
        'amount': '1,000 TRX',
        'time': '1 day ago',
        'isPositive': true,
      },
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 24),
          SectionHeader(
            title: 'Recent Transactions',
            actionText: 'See All',
            onActionTap: () {},
          ),
          const SizedBox(height: 16),
          ...transactions.map(
            (transaction) => TransactionItemCard(
              type: transaction['type'] as TransactionType,
              asset: transaction['asset'] as String,
              amount: transaction['amount'] as String,
              time: transaction['time'] as String,
              isPositive: transaction['isPositive'] as bool,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
