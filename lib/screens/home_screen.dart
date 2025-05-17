import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:four_all/providers/auth_provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final auth = context.watch<AuthProvider>();
    final userName = auth.userData?['name'] ?? 'زائر';

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                    child: Icon(
                      LucideIcons.user,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'مرحباً بك،',
                          style: theme.textTheme.bodyLarge,
                        ),
                        Text(
                          userName,
                          style: theme.textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(LucideIcons.bell),
                  ),
                ],
              )
              .animate()
              .fadeIn()
              .slideX(),
              const SizedBox(height: 24),
              Text(
                'خدماتنا',
                style: theme.textTheme.titleLarge,
              )
              .animate()
              .fadeIn(delay: const Duration(milliseconds: 200))
              .slideX(),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _ServiceCard(
                    icon: LucideIcons.car,
                    title: 'توصيل',
                    description: 'خدمة توصيل سريعة وآمنة',
                    onTap: () {},
                  ),
                  _ServiceCard(
                    icon: LucideIcons.truck,
                    title: 'سطحة',
                    description: 'خدمة سحب وإنقاذ على مدار الساعة',
                    onTap: () {},
                  ),
                  _ServiceCard(
                    icon: LucideIcons.key,
                    title: 'تأجير',
                    description: 'تأجير سيارات بأفضل الأسعار',
                    onTap: () {},
                  ),
                  _ServiceCard(
                    icon: LucideIcons.sparkles,
                    title: 'غسيل',
                    description: 'خدمة غسيل وتنظيف احترافية',
                    onTap: () {},
                  ),
                ].animate(interval: const Duration(milliseconds: 100))
                  .fadeIn()
                  .scale(),
              ),
              const SizedBox(height: 24),
              Text(
                'العروض المميزة',
                style: theme.textTheme.titleLarge,
              )
              .animate()
              .fadeIn(delay: const Duration(milliseconds: 400))
              .slideX(),
              const SizedBox(height: 16),
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _PromotionCard(
                      image: 'https://images.pexels.com/photos/4391470/pexels-photo-4391470.jpeg',
                      title: 'خصم 20% على خدمة التوصيل',
                      onTap: () {},
                    ),
                    _PromotionCard(
                      image: 'https://images.pexels.com/photos/6170398/pexels-photo-6170398.jpeg',
                      title: 'عرض خاص على خدمة السطحة',
                      onTap: () {},
                    ),
                    _PromotionCard(
                      image: 'https://images.pexels.com/photos/6873088/pexels-photo-6873088.jpeg',
                      title: 'اشترك في باقة الغسيل الشهرية',
                      onTap: () {},
                    ),
                  ].animate(interval: const Duration(milliseconds: 100))
                    .fadeIn()
                    .slideX(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: theme.colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: theme.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: theme.textTheme.bodySmall,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PromotionCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;

  const _PromotionCard({
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: onTap,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                image,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.8),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}