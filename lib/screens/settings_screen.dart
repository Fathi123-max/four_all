import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:four_all/providers/auth_provider.dart';
import 'package:four_all/providers/theme_provider.dart';
import 'package:four_all/providers/language_provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final auth = context.watch<AuthProvider>();
    final themeProvider = context.watch<ThemeProvider>();
    final languageProvider = context.watch<LanguageProvider>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الإعدادات',
                style: theme.textTheme.headlineMedium,
              )
              .animate()
              .fadeIn()
              .slideX(),
              const SizedBox(height: 8),
              Text(
                'تخصيص إعدادات التطبيق',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
              )
              .animate()
              .fadeIn()
              .slideX(delay: const Duration(milliseconds: 100)),
              const SizedBox(height: 24),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: theme.colorScheme.outline.withOpacity(0.2),
                  ),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                        child: Icon(
                          LucideIcons.user,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      title: Text(auth.userData?['name'] ?? 'زائر'),
                      subtitle: Text(auth.userData?['email'] ?? 'حساب زائر'),
                      trailing: Icon(LucideIcons.chevronLeft),
                      onTap: () {
                        // Navigate to profile settings
                      },
                    ),
                  ],
                ),
              )
              .animate()
              .fadeIn()
              .slideY(delay: const Duration(milliseconds: 200)),
              const SizedBox(height: 24),
              Text(
                'عام',
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
                  children: [
                    ListTile(
                      leading: Icon(LucideIcons.languages),
                      title: const Text('اللغة'),
                      trailing: DropdownButton<String>(
                        value: languageProvider.locale.languageCode,
                        items: const [
                          DropdownMenuItem(
                            value: 'ar',
                            child: Text('العربية'),
                          ),
                          DropdownMenuItem(
                            value: 'en',
                            child: Text('English'),
                          ),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            languageProvider.setLanguage(value);
                          }
                        },
                        underline: const SizedBox(),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        themeProvider.themeMode == ThemeMode.dark
                            ? LucideIcons.moon
                            : LucideIcons.sun,
                      ),
                      title: const Text('المظهر'),
                      trailing: DropdownButton<ThemeMode>(
                        value: themeProvider.themeMode,
                        items: const [
                          DropdownMenuItem(
                            value: ThemeMode.light,
                            child: Text('فاتح'),
                          ),
                          DropdownMenuItem(
                            value: ThemeMode.dark,
                            child: Text('داكن'),
                          ),
                          DropdownMenuItem(
                            value: ThemeMode.system,
                            child: Text('تلقائي'),
                          ),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            themeProvider.setThemeMode(value);
                          }
                        },
                        underline: const SizedBox(),
                      ),
                    ),
                    ListTile(
                      leading: Icon(LucideIcons.bell),
                      title: const Text('الإشعارات'),
                      trailing: Icon(LucideIcons.chevronLeft),
                      onTap: () {
                        // Navigate to notifications settings
                      },
                    ),
                  ],
                ),
              )
              .animate()
              .fadeIn()
              .slideY(delay: const Duration(milliseconds: 300)),
              const SizedBox(height: 24),
              Text(
                'الخصوصية والأمان',
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
                  children: [
                    ListTile(
                      leading: Icon(LucideIcons.lock),
                      title: const Text('كلمة المرور'),
                      trailing: Icon(LucideIcons.chevronLeft),
                      onTap: () {
                        // Navigate to password settings
                      },
                    ),
                    ListTile(
                      leading: Icon(LucideIcons.shield),
                      title: const Text('الخصوصية'),
                      trailing: Icon(LucideIcons.chevronLeft),
                      onTap: () {
                        // Navigate to privacy settings
                      },
                    ),
                  ],
                ),
              )
              .animate()
              .fadeIn()
              .slideY(delay: const Duration(milliseconds: 400)),
              const SizedBox(height: 24),
              Text(
                'الدعم',
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
                  children: [
                    ListTile(
                      leading: Icon(LucideIcons.helpCircle),
                      title: const Text('مركز المساعدة'),
                      trailing: Icon(LucideIcons.chevronLeft),
                      onTap: () {
                        // Navigate to help center
                      },
                    ),
                    ListTile(
                      leading: Icon(LucideIcons.messageCircle),
                      title: const Text('تواصل معنا'),
                      trailing: Icon(LucideIcons.chevronLeft),
                      onTap: () {
                        // Navigate to contact us
                      },
                    ),
                    ListTile(
                      leading: Icon(LucideIcons.info),
                      title: const Text('عن التطبيق'),
                      trailing: Icon(LucideIcons.chevronLeft),
                      onTap: () {
                        // Navigate to about
                      },
                    ),
                  ],
                ),
              )
              .animate()
              .fadeIn()
              .slideY(delay: const Duration(milliseconds: 500)),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    auth.logout();
                    context.go('/login');
                  },
                  icon: Icon(
                    LucideIcons.logOut,
                    color: theme.colorScheme.error,
                  ),
                  label: Text(
                    'تسجيل الخروج',
                    style: TextStyle(
                      color: theme.colorScheme.error,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    side: BorderSide(
                      color: theme.colorScheme.error,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              )
              .animate()
              .fadeIn()
              .slideY(delay: const Duration(milliseconds: 600)),
            ],
          ),
        ),
      ),
    );
  }
}