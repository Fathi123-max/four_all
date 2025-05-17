import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:four_all/providers/auth_provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final auth = context.watch<AuthProvider>();
    final userName = auth.userData?['name'] ?? 'زائر';
    final userEmail = auth.userData?['email'] ?? '';
    final userPhone = auth.userData?['phone'] ?? '';

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الملف الشخصي',
                style: theme.textTheme.headlineMedium,
              )
              .animate()
              .fadeIn()
              .slideX(),
              const SizedBox(height: 24),
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                          child: Icon(
                            LucideIcons.user,
                            size: 40,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              LucideIcons.camera,
                              size: 16,
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ],
                    )
                    .animate()
                    .scale()
                    .fadeIn(),
                    const SizedBox(height: 16),
                    Text(
                      userName,
                      style: theme.textTheme.titleLarge,
                    ),
                    if (userEmail.isNotEmpty) Text(
                      userEmail,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              _Section(
                title: 'معلومات شخصية',
                children: [
                  _InfoTile(
                    icon: LucideIcons.user,
                    title: 'الاسم',
                    value: userName,
                    onTap: () {},
                  ),
                  _InfoTile(
                    icon: LucideIcons.mail,
                    title: 'البريد الإلكتروني',
                    value: userEmail,
                    onTap: () {},
                  ),
                  _InfoTile(
                    icon: LucideIcons.phone,
                    title: 'رقم الجوال',
                    value: userPhone,
                    onTap: () {},
                  ),
                ],
              )
              .animate()
              .fadeIn()
              .slideY(delay: const Duration(milliseconds: 200)),
              const SizedBox(height: 24),
              _Section(
                title: 'طلباتي',
                children: [
                  _OrderTile(
                    orderNumber: 'ORD-001',
                    service: 'توصيل',
                    status: 'مكتمل',
                    date: '2024/03/15',
                    amount: '45.00 درهم',
                  ),
                  _OrderTile(
                    orderNumber: 'ORD-002',
                    service: 'سطحة',
                    status: 'قيد التنفيذ',
                    date: '2024/03/15',
                    amount: '120.00 درهم',
                  ),
                  _OrderTile(
                    orderNumber: 'ORD-003',
                    service: 'غسيل',
                    status: 'قيد التنفيذ',
                    date: '2024/03/15',
                    amount: '80.00 درهم',
                  ),
                ],
              )
              .animate()
              .fadeIn()
              .slideY(delay: const Duration(milliseconds: 300)),
              const SizedBox(height: 24),
              _Section(
                title: 'العناوين المحفوظة',
                children: [
                  _AddressTile(
                    title: 'المنزل',
                    address: 'دبي - الخليج التجاري',
                    isDefault: true,
                  ),
                  _AddressTile(
                    title: 'العمل',
                    address: 'دبي - مركز دبي المالي العالمي',
                    isDefault: false,
                  ),
                ],
              )
              .animate()
              .fadeIn()
              .slideY(delay: const Duration(milliseconds: 400)),
              const SizedBox(height: 24),
              _Section(
                title: 'وسائل الدفع',
                children: [
                  _PaymentMethodTile(
                    type: 'بطاقة ائتمان',
                    lastFourDigits: '4242',
                    isDefault: true,
                  ),
                  _PaymentMethodTile(
                    type: 'Apple Pay',
                    lastFourDigits: null,
                    isDefault: false,
                  ),
                ],
              )
              .animate()
              .fadeIn()
              .slideY(delay: const Duration(milliseconds: 500)),
            ],
          ),
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _Section({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 8),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: theme.colorScheme.outline.withOpacity(0.2),
            ),
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(value),
      trailing: const Icon(LucideIcons.chevronLeft),
      onTap: onTap,
    );
  }
}

class _OrderTile extends StatelessWidget {
  final String orderNumber;
  final String service;
  final String status;
  final String date;
  final String amount;

  const _OrderTile({
    required this.orderNumber,
    required this.service,
    required this.status,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return ListTile(
      title: Row(
        children: [
          Text(orderNumber),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: status == 'مكتمل'
                  ? Colors.green.withOpacity(0.1)
                  : Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              status,
              style: theme.textTheme.bodySmall?.copyWith(
                color: status == 'مكتمل'
                    ? Colors.green
                    : Colors.orange,
              ),
            ),
          ),
        ],
      ),
      subtitle: Text('$service - $date'),
      trailing: Text(
        amount,
        style: theme.textTheme.titleMedium,
      ),
      onTap: () {
        // Navigate to order details
      },
    );
  }
}

class _AddressTile extends StatelessWidget {
  final String title;
  final String address;
  final bool isDefault;

  const _AddressTile({
    required this.title,
    required this.address,
    required this.isDefault,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return ListTile(
      leading: Icon(LucideIcons.mapPin),
      title: Row(
        children: [
          Text(title),
          if (isDefault) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'افتراضي',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ],
        ],
      ),
      subtitle: Text(address),
      trailing: const Icon(LucideIcons.chevronLeft),
      onTap: () {
        // Navigate to address details
      },
    );
  }
}

class _PaymentMethodTile extends StatelessWidget {
  final String type;
  final String? lastFourDigits;
  final bool isDefault;

  const _PaymentMethodTile({
    required this.type,
    required this.lastFourDigits,
    required this.isDefault,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return ListTile(
      leading: Icon(
        type == 'Apple Pay' ? LucideIcons.apple : LucideIcons.creditCard,
      ),
      title: Row(
        children: [
          Text(type),
          if (isDefault) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'افتراضي',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ],
        ],
      ),
      subtitle: lastFourDigits != null
          ? Text('**** **** **** $lastFourDigits')
          : null,
      trailing: const Icon(LucideIcons.chevronLeft),
      onTap: () {
        // Navigate to payment method details
      },
    );
  }
}