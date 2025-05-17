import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:four_all/screens/login_screen.dart';
import 'package:four_all/screens/home_screen.dart';
import 'package:four_all/screens/services_screen.dart';
import 'package:four_all/screens/profile_screen.dart';
import 'package:four_all/screens/settings_screen.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBar(
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.car_repair_outlined),
                selectedIcon: Icon(Icons.car_repair),
                label: 'Services',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person),
                label: 'Profile',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            onDestinationSelected: (index) {
              switch (index) {
                case 0:
                  context.go('/home');
                  break;
                case 1:
                  context.go('/services');
                  break;
                case 2:
                  context.go('/profile');
                  break;
                case 3:
                  context.go('/settings');
                  break;
              }
            },
            selectedIndex: _getSelectedIndex(state.uri.path),
          ),
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/services',
          builder: (context, state) => const ServicesScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    ),
  ],
);

int _getSelectedIndex(String path) {
  switch (path) {
    case '/home':
      return 0;
    case '/services':
      return 1;
    case '/profile':
      return 2;
    case '/settings':
      return 3;
    default:
      return 0;
  }
}