import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/app_util.dart';
import '../../../../core/utils/ff_icons.dart';
import '../../../../features/auth/domain/services/firebase_auth_util.dart';
import '../../../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../domain/models/profile_page_model.dart';
import 'personal_details_page.dart';
import 'activity_page.dart';
import 'saved_page.dart';
import 'account_settings_page.dart';

export '../../domain/models/profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  static String routeName = 'ProfilePage';
  static String routePath = '/profilePage';

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: AppTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: AppTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Profile',
            style: AppTheme.of(context).paragraphP1SemiBold.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontStyle: AppTheme.of(context)
                        .paragraphP1SemiBold
                        .fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: AppTheme.of(context)
                      .paragraphP1SemiBold
                      .fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Text(
                        currentUserDisplayName,
                        style: AppTheme.of(context)
                            .desktopHeadingH6Bold
                            .override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontStyle: AppTheme.of(context)
                                    .desktopHeadingH6Bold
                                    .fontStyle,
                              ),
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: AppTheme.of(context)
                                  .desktopHeadingH6Bold
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppTheme.of(context).darkMode800,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.push(PersonalDetailsPageWidget.routePath);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  FFIcons.kprofileOutline,
                                  color: AppTheme.of(context).primary,
                                  size: 24,
                                ),
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.push(PersonalDetailsPageWidget.routePath);
                                    },
                                    child: Text(
                                      'Personal Details',
                                      style: AppTheme.of(context)
                                          .mobileHeadingH6Medium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  AppTheme.of(context)
                                                      .mobileHeadingH6Medium
                                                      .fontStyle,
                                            ),
                                            color: AppTheme.of(context)
                                                .neutral50,
                                            fontSize: 18,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                AppTheme.of(context)
                                                    .mobileHeadingH6Medium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppTheme.of(context).primaryText,
                                  size: 20,
                                ),
                              ].divide(SizedBox(width: 16)),
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            color: AppTheme.of(context).darkMode600,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.push(ActivityPageWidget.routePath);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  FFIcons.kactivity,
                                  color: AppTheme.of(context).primary,
                                  size: 24,
                                ),
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.push(ActivityPageWidget.routePath);
                                    },
                                    child: Text(
                                      'Activity',
                                      style: AppTheme.of(context)
                                          .mobileHeadingH6Medium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  AppTheme.of(context)
                                                      .mobileHeadingH6Medium
                                                      .fontStyle,
                                            ),
                                            color: AppTheme.of(context)
                                                .neutral50,
                                            fontSize: 18,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                AppTheme.of(context)
                                                    .mobileHeadingH6Medium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppTheme.of(context).primaryText,
                                  size: 20,
                                ),
                              ].divide(SizedBox(width: 16)),
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            color: AppTheme.of(context).darkMode600,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.push(SavedPageWidget.routePath);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  FFIcons.ksaved,
                                  color: AppTheme.of(context).primary,
                                  size: 24,
                                ),
                                Expanded(
                                  child: Text(
                                    'Saved',
                                    style: AppTheme.of(context)
                                        .mobileHeadingH6Medium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                AppTheme.of(context)
                                                    .mobileHeadingH6Medium
                                                    .fontStyle,
                                          ),
                                          color: AppTheme.of(context)
                                              .neutral50,
                                          fontSize: 18,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              AppTheme.of(context)
                                                  .mobileHeadingH6Medium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppTheme.of(context).primaryText,
                                  size: 20,
                                ),
                              ].divide(SizedBox(width: 16)),
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            color: AppTheme.of(context).darkMode600,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                FFIcons.knotification,
                                color: AppTheme.of(context).primary,
                                size: 24,
                              ),
                              Expanded(
                                child: Text(
                                  'Notifications',
                                  style: AppTheme.of(context)
                                      .mobileHeadingH6Medium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              AppTheme.of(context)
                                                  .mobileHeadingH6Medium
                                                  .fontStyle,
                                        ),
                                        color: AppTheme.of(context)
                                            .neutral50,
                                        fontSize: 18,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: AppTheme.of(context)
                                            .mobileHeadingH6Medium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppTheme.of(context).primaryText,
                                size: 20,
                              ),
                            ].divide(SizedBox(width: 16)),
                          ),
                          Divider(
                            thickness: 2,
                            color: AppTheme.of(context).darkMode600,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                FFIcons.kworkoutOutline,
                                color: AppTheme.of(context).primary,
                                size: 24,
                              ),
                              Expanded(
                                child: Text(
                                  'Workout Preferences',
                                  style: AppTheme.of(context)
                                      .mobileHeadingH6Medium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              AppTheme.of(context)
                                                  .mobileHeadingH6Medium
                                                  .fontStyle,
                                        ),
                                        color: AppTheme.of(context)
                                            .neutral50,
                                        fontSize: 18,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: AppTheme.of(context)
                                            .mobileHeadingH6Medium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppTheme.of(context).primaryText,
                                size: 20,
                              ),
                            ].divide(SizedBox(width: 16)),
                          ),
                          Divider(
                            thickness: 2,
                            color: AppTheme.of(context).darkMode600,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                FFIcons.kdiet,
                                color: AppTheme.of(context).primary,
                                size: 24,
                              ),
                              Expanded(
                                child: Text(
                                  'Diet Preferences',
                                  style: AppTheme.of(context)
                                      .mobileHeadingH6Medium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              AppTheme.of(context)
                                                  .mobileHeadingH6Medium
                                                  .fontStyle,
                                        ),
                                        color: AppTheme.of(context)
                                            .neutral50,
                                        fontSize: 18,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: AppTheme.of(context)
                                            .mobileHeadingH6Medium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppTheme.of(context).primaryText,
                                size: 20,
                              ),
                            ].divide(SizedBox(width: 16)),
                          ),
                          Divider(
                            thickness: 2,
                            color: AppTheme.of(context).darkMode600,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.push(AccountSettingsPageWidget.routePath);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  FFIcons.ksetting,
                                  color: AppTheme.of(context).primary,
                                  size: 24,
                                ),
                                Expanded(
                                  child: Text(
                                    'Account Settings',
                                    style: AppTheme.of(context)
                                        .mobileHeadingH6Medium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                AppTheme.of(context)
                                                    .mobileHeadingH6Medium
                                                    .fontStyle,
                                          ),
                                          color: AppTheme.of(context)
                                              .neutral50,
                                          fontSize: 18,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              AppTheme.of(context)
                                                  .mobileHeadingH6Medium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppTheme.of(context).primaryText,
                                  size: 20,
                                ),
                              ].divide(SizedBox(width: 16)),
                            ),
                          ),
                        ].divide(SizedBox(height: 14)),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppTheme.of(context).darkMode800,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                FFIcons.khelp,
                                color: AppTheme.of(context).primary,
                                size: 24,
                              ),
                              Expanded(
                                child: Text(
                                  'Help and Support',
                                  style: AppTheme.of(context)
                                      .mobileHeadingH6Medium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              AppTheme.of(context)
                                                  .mobileHeadingH6Medium
                                                  .fontStyle,
                                        ),
                                        color: AppTheme.of(context)
                                            .neutral50,
                                        fontSize: 18,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: AppTheme.of(context)
                                            .mobileHeadingH6Medium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppTheme.of(context).primaryText,
                                size: 20,
                              ),
                            ].divide(SizedBox(width: 16)),
                          ),
                          Divider(
                            thickness: 2,
                            color: AppTheme.of(context).darkMode600,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              final router = GoRouter.of(context);
                              router.prepareAuthEvent();
                              await AuthUtil.signOut();
                              if (!mounted) return;
                              router.clearRedirectLocation();

                                router.go(OnboardingPageWidget.routePath);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  FFIcons.koutline,
                                  color: AppTheme.of(context).error300,
                                  size: 24,
                                ),
                                Expanded(
                                  child: Text(
                                    'Log Out',
                                    style: AppTheme.of(context)
                                        .mobileHeadingH6Medium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                AppTheme.of(context)
                                                    .mobileHeadingH6Medium
                                                    .fontStyle,
                                          ),
                                          color: AppTheme.of(context)
                                              .error300,
                                          fontSize: 18,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              AppTheme.of(context)
                                                  .mobileHeadingH6Medium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 16)),
                            ),
                          ),
                        ].divide(SizedBox(height: 14)),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 24)),
              ),
            ),
          ),
        ),
      ),
    );
  }

}

// Extension for TextStyle override to match FlutterFlow pattern
extension TextStyleOverride on TextStyle {
  TextStyle override({
    TextStyle? font,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
  }) {
    return copyWith(
      fontFamily: font?.fontFamily,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
    );
  }
}

// Extension for GoRouter auth preparation
extension GoRouterAuthExtensions on GoRouter {
  void prepareAuthEvent() {
    // Placeholder for auth event preparation
    // In FlutterFlow, this is used to prepare the router for auth state changes
  }

  void clearRedirectLocation() {
    // Placeholder for clearing redirect location
    // In FlutterFlow, this clears any stored redirect paths
  }
}
