import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _services = [
    {
      'id': 'delivery',
      'title': 'خدمة التوصيل',
      'description': 'خدمة توصيل سريعة للطلبات المستعجلة. يصل المندوب خلال 2-3 ساعات من وقت الطلب.',
      'image': 'https://images.pexels.com/photos/7706407/pexels-photo-7706407.jpeg',
      'features': [
        {'icon': LucideIcons.mapPin, 'title': 'تتبع المندوب', 'description': 'تابع مندوبك في الوقت الحقيقي'},
        {'icon': LucideIcons.package, 'title': 'توصيل آمن', 'description': 'خدمة توصيل آمنة ومضمونة'},
        {'icon': LucideIcons.userCheck, 'title': 'مندوبين معتمدين', 'description': 'جميع المندوبين معتمدين'},
      ],
      'rating': 4.9,
      'reviews': 850,
    },
    {
      'id': 'towing',
      'title': 'خدمة السطحة',
      'description': 'خدمة سحب السيارات على مدار الساعة. نصل إليك في أي مكان خلال وقت قياسي.',
      'image': 'https://images.pexels.com/photos/6170398/pexels-photo-6170398.jpeg',
      'features': [
        {'icon': LucideIcons.clock, 'title': 'خدمة 24/7', 'description': 'متوفرين على مدار الساعة'},
        {'icon': LucideIcons.shield, 'title': 'خدمة آمنة', 'description': 'نقل آمن لسيارتك'},
        {'icon': LucideIcons.mapPin, 'title': 'تغطية واسعة', 'description': 'نصل لجميع المناطق'},
      ],
      'rating': 4.8,
      'reviews': 920,
    },
    {
      'id': 'rental',
      'title': 'تأجير السيارات',
      'description': 'مجموعة متنوعة من السيارات لجميع المناسبات بأسعار تنافسية وخدمة متميزة.',
      'image': 'https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg',
      'features': [
        {'icon': LucideIcons.car, 'title': 'تشكيلة واسعة', 'description': 'سيارات متنوعة لكل الأذواق'},
        {'icon': LucideIcons.shield, 'title': 'تأمين شامل', 'description': 'تأمين شامل ضد الحوادث'},
        {'icon': LucideIcons.wallet, 'title': 'أسعار مناسبة', 'description': 'أسعار تنافسية وعروض دائمة'},
      ],
      'rating': 4.7,
      'reviews': 650,
    },
    {
      'id': 'wash',
      'title': 'غسيل السيارات',
      'description': 'خدمة غسيل وتنظيف احترافية للسيارات. نستخدم أفضل المواد للحفاظ على سيارتك.',
      'image': 'https://images.pexels.com/photos/6873088/pexels-photo-6873088.jpeg',
      'features': [
        {'icon': LucideIcons.sparkles, 'title': 'تنظيف شامل', 'description': 'غسيل خارجي وداخلي'},
        {'icon': LucideIcons.timer, 'title': 'خدمة سريعة', 'description': 'إنجاز الخدمة بوقت قياسي'},
        {'icon': LucideIcons.check, 'title': 'جودة عالية', 'description': 'استخدام منتجات ممتازة'},
      ],
      'rating': 4.9,
      'reviews': 1510,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _services.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'خدماتنا',
                    style: theme.textTheme.headlineMedium,
                  )
                  .animate()
                  .fadeIn()
                  .slideX(),
                  const SizedBox(height: 8),
                  Text(
                    'اختر من مجموعة خدماتنا المتميزة',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                  )
                  .animate()
                  .fadeIn()
                  .slideX(delay: const Duration(milliseconds: 100)),
                ],
              ),
            ),
            TabBar(
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: _services.map((service) {
                return Tab(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Icon(_getServiceIcon(service['id'] as String)),
                        const SizedBox(width: 8),
                        Text(service['title'] as String),
                      ],
                    ),
                  ),
                );
              }).toList(),
            )
            .animate()
            .fadeIn()
            .slideY(delay: const Duration(milliseconds: 200)),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: _services.map((service) {
                  return _ServiceDetails(service: service);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getServiceIcon(String serviceId) {
    switch (serviceId) {
      case 'delivery':
        return LucideIcons.car;
      case 'towing':
        return LucideIcons.truck;
      case 'rental':
        return LucideIcons.key;
      case 'wash':
        return LucideIcons.sparkles;
      default:
        return LucideIcons.helpCircle;
    }
  }
}

class _ServiceDetails extends StatelessWidget {
  final Map<String, dynamic> service;

  const _ServiceDetails({required this.service});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    service['image'] as String,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                LucideIcons.star,
                                color: Colors.amber,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${service['rating']} (${service['reviews']} تقييم)',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          service['title'] as String,
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          service['description'] as String,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.white.withOpacity(0.8),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          .animate()
          .fadeIn()
          .scale(),
          const SizedBox(height: 24),
          Text(
            'مميزات الخدمة',
            style: theme.textTheme.titleLarge,
          )
          .animate()
          .fadeIn()
          .slideX(delay: const Duration(milliseconds: 200)),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.5,
            children: (service['features'] as List).map((feature) {
              return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: theme.colorScheme.outline.withOpacity(0.2),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        feature['icon'] as IconData,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        feature['title'] as String,
                        style: theme.textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        feature['description'] as String,
                        style: theme.textTheme.bodySmall,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          )
          .animate()
          .fadeIn()
          .slideY(delay: const Duration(milliseconds: 300)),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () {
              // Handle service booking
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('جاري تجهيز الطلب...')),
              );
            },
            icon: const Icon(LucideIcons.checkCircle),
            label: const Text('احجز الآن'),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          )
          .animate()
          .fadeIn()
          .slideY(delay: const Duration(milliseconds: 400)),
        ],
      ),
    );
  }
}