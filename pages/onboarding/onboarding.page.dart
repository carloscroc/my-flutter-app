import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/components/onboarding_item/onboarding_item_widget.dart';
import '/components/primary_button/primary_button_widget.dart';
import '/components/secondary_btn/secondary_btn_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'onboarding_page_model.dart';
export 'onboarding_page_model.dart';

class OnboardingPageWidget extends StatefulWidget {
  const OnboardingPageWidget({super.key});

  static String routeName = 'OnboardingPage';
  static String routePath = '/onboardingPage';

  @override
  State<OnboardingPageWidget> createState() => _OnboardingPageWidgetState();
}

class _OnboardingPageWidgetState extends State<OnboardingPageWidget> {
  late OnboardingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final list = FFAppState().OnboardingList.toList();

                      return Container(
                        width: double.infinity,
                        height: 500,
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                              child: PageView.builder(
                                controller: _model.pageViewController ??=
                                    PageController(
                                        initialPage:
                                            max(0, min(0, list.length - 1))),
                                scrollDirection: Axis.horizontal,
                                itemCount: list.length,
                                itemBuilder: (context, listIndex) {
                                  final listItem = list[listIndex];
                                  return wrapWithModel(
                                    model: _model.onboardingIteModels.getModel(
                                      listIndex.toString(),
                                      listIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: OnboardingItemWidget(
                                      key: Key(
                                        'Keyyzx_${listIndex.toString()}',
                                      ),
                                      item: listItem,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child:
                                    smooth_page_indicator.SmoothPageIndicator(
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage:
                                              max(0, min(0, list.length - 1))),
                                  count: list.length,
                                  axisDirection: Axis.horizontal,
                                  onDotClicked: (i) async {
                                    await _model.pageViewController!
                                        .animateToPage(
                                      i,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                    safeSetState(() {});
                                  },
                                  effect: smooth_page_indicator.SlideEffect(
                                    spacing: 8,
                                    radius: 2,
                                    dotWidth: 90,
                                    dotHeight: 4,
                                    dotColor: FlutterFlowTheme.of(context)
                                        .darkMode100,
                                    activeDotColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    paintStyle: PaintingStyle.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 0),
                  child: wrapWithModel(
                    model: _model.primaryButtonModel,
                    updateCallback: () => safeSetState(() {}),
                    child: PrimaryButtonWidget(
                      btnText: 'Get Started',
                      onClick: () async {
                        context.pushNamed(WelcomeSignUpPageWidget.routeName);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: wrapWithModel(
                    model: _model.secondaryButtonModel,
                    updateCallback: () => safeSetState(() {}),
                    child: SecondaryBtnWidget(
                      btnText: 'Log in',
                      onClick: () async {
                        context.pushNamed(WelcomeLoginPageWidget.routeName);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                  child: FFButtonWidget(
                    onPressed: () async {
                      GoRouter.of(context).prepareAuthEvent();

                      final user = await authManager.signInWithEmail(
                        context,
                        FFAppConstants.guestUserEmail,
                        FFAppConstants.guestUserPassword,
                      );
                      if (user == null) {
                        return;
                      }

                      context.goNamedAuth(
                          HomePageWidget.routeName, context.mounted);
                    },
                    text: 'Join as Guest',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 56,
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: Colors.transparent,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FontStyle.italic,
                                ),
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FontStyle.italic,
                              ),
                      elevation: 0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// Generated code for this Column Widget...
Padding(
  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
  child: Column(
    mainAxisSize: MainAxisSize.max,
    children: [
      Expanded(
        child: Builder(
          builder: (context) {
            final list = FFAppState().OnboardingList.toList();
            return Container(
              width: double.infinity,
              height: 500,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                    child: PageView.builder(
                      controller: _model.pageViewController ??=
                          PageController(
                              initialPage: max(0, min(0, list.length - 1))),
                      scrollDirection: Axis.horizontal,
                      itemCount: list.length,
                      itemBuilder: (context, listIndex) {
                        final listItem = list[listIndex];
                        return wrapWithModel(
                          model: _model.onboardingIteModels.getModel(
                            listIndex.toString(),
                            listIndex,
                          ),
                          updateCallback: () => safeSetState(() {}),
                          child: OnboardingItemWidget(
                            key: Key(
                              'Keyyzx_${listIndex.toString()}',
                            ),
                            item: listItem,
                          ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 1),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: smooth_page_indicator.SmoothPageIndicator(
                        controller: _model.pageViewController ??=
                            PageController(
                                initialPage: max(0, min(0, list.length - 1))),
                        count: list.length,
                        axisDirection: Axis.horizontal,
                        onDotClicked: (i) async {
                          await _model.pageViewController!.animateToPage(
                            i,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                          safeSetState(() {});
                        },
                        effect: smooth_page_indicator.SlideEffect(
                          spacing: 8,
                          radius: 2,
                          dotWidth: 90,
                          dotHeight: 4,
                          dotColor: FlutterFlowTheme.of(context).darkMode100,
                          activeDotColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          paintStyle: PaintingStyle.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 0),
        child: wrapWithModel(
          model: _model.primaryButtonModel,
          updateCallback: () => safeSetState(() {}),
          child: PrimaryButtonWidget(
            btnText: 'Get Started',
            onClick: () async {
              context.pushNamed(WelcomeSignUpPageWidget.routeName);
            },
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(16),
        child: wrapWithModel(
          model: _model.secondaryButtonModel,
          updateCallback: () => safeSetState(() {}),
          child: SecondaryBtnWidget(
            btnText: 'Log in',
            onClick: () async {
              context.pushNamed(WelcomeLoginPageWidget.routeName);
            },
          ),
        ),
      ),
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
        child: FFButtonWidget(
          onPressed: () async {
            GoRouter.of(context).prepareAuthEvent();
            final user = await authManager.signInWithEmail(
              context,
              FFAppConstants.guestUserEmail,
              FFAppConstants.guestUserPassword,
            );
            if (user == null) {
              return;
            }
            context.goNamedAuth(HomePageWidget.routeName, context.mounted);
          },
          text: 'Join as Guest',
          options: FFButtonOptions(
            width: double.infinity,
            height: 56,
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            color: Colors.transparent,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  font: GoogleFonts.inter(
                    fontWeight:
                        FlutterFlowTheme.of(context).titleSmall.fontWeight,
                    fontStyle: FontStyle.italic,
                  ),
                  color: FlutterFlowTheme.of(context).primary,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).titleSmall.fontWeight,
                  fontStyle: FontStyle.italic,
                ),
            elevation: 0,
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primary,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ],
  ),
)

// Generated code for this PageView Widget...
Expanded(
  child: Builder(
    builder: (context) {
      final list = FFAppState().OnboardingList.toList();
      return Container(
        width: double.infinity,
        height: 500,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
              child: PageView.builder(
                controller: _model.pageViewController ??= PageController(
                    initialPage: max(0, min(0, list.length - 1))),
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, listIndex) {
                  final listItem = list[listIndex];
                  return wrapWithModel(
                    model: _model.onboardingIteModels.getModel(
                      listIndex.toString(),
                      listIndex,
                    ),
                    updateCallback: () => safeSetState(() {}),
                    child: OnboardingItemWidget(
                      key: Key(
                        'Keyyzx_${listIndex.toString()}',
                      ),
                      item: listItem,
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 1),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                child: smooth_page_indicator.SmoothPageIndicator(
                  controller: _model.pageViewController ??= PageController(
                      initialPage: max(0, min(0, list.length - 1))),
                  count: list.length,
                  axisDirection: Axis.horizontal,
                  onDotClicked: (i) async {
                    await _model.pageViewController!.animateToPage(
                      i,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                    safeSetState(() {});
                  },
                  effect: smooth_page_indicator.SlideEffect(
                    spacing: 8,
                    radius: 2,
                    dotWidth: 90,
                    dotHeight: 4,
                    dotColor: FlutterFlowTheme.of(context).darkMode100,
                    activeDotColor:
                        FlutterFlowTheme.of(context).secondaryText,
                    paintStyle: PaintingStyle.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  ),
)

// Generated code for this PlaceholderWidget Widget...
wrapWithModel(
  model: _model.onboardingIteModels.getModel(
    listIndex.toString(),
    listIndex,
  ),
  updateCallback: () => safeSetState(() {}),
  child: OnboardingItemWidget(
    key: Key(
      'Keyyzx_${listIndex.toString()}',
    ),
    item: listItem,
  ),
)


// Generated code for this OnboardingIte Widget...
wrapWithModel(
  model: _model.onboardingIteModels.getModel(
    listIndex.toString(),
    listIndex,
  ),
  updateCallback: () => safeSetState(() {}),
  child: OnboardingItemWidget(
    key: Key(
      'Keyyzx_${listIndex.toString()}',
    ),
    item: listItem,
  ),
)


// Generated code for this PrimaryButton Widget...
Padding(
  padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 0),
  child: wrapWithModel(
    model: _model.primaryButtonModel,
    updateCallback: () => safeSetState(() {}),
    child: PrimaryButtonWidget(
      btnText: 'Get Started',
      onClick: () async {
        context.pushNamed(WelcomeSignUpPageWidget.routeName);
      },
    ),
  ),
)





// Generated code for this SecondaryButton Widget...
Padding(
  padding: EdgeInsets.all(16),
  child: wrapWithModel(
    model: _model.secondaryButtonModel,
    updateCallback: () => safeSetState(() {}),
    child: SecondaryBtnWidget(
      btnText: 'Log in',
      onClick: () async {
        context.pushNamed(WelcomeLoginPageWidget.routeName);
      },
    ),
  ),
)





// Generated code for this Button Widget...
Padding(
  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
  child: FFButtonWidget(
    onPressed: () async {
      GoRouter.of(context).prepareAuthEvent();
      final user = await authManager.signInWithEmail(
        context,
        FFAppConstants.guestUserEmail,
        FFAppConstants.guestUserPassword,
      );
      if (user == null) {
        return;
      }
      context.goNamedAuth(HomePageWidget.routeName, context.mounted);
    },
    text: 'Join as Guest',
    options: FFButtonOptions(
      width: double.infinity,
      height: 56,
      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      color: Colors.transparent,
      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
            font: GoogleFonts.inter(
              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
              fontStyle: FontStyle.italic,
            ),
            color: FlutterFlowTheme.of(context).primary,
            letterSpacing: 0.0,
            fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
            fontStyle: FontStyle.italic,
          ),
      elevation: 0,
      borderSide: BorderSide(
        color: FlutterFlowTheme.of(context).primary,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
)



import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/components/onboarding_item/onboarding_item_widget.dart';
import '/components/primary_button/primary_button_widget.dart';
import '/components/secondary_btn/secondary_btn_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'onboarding_page_widget.dart' show OnboardingPageWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnboardingPageModel extends FlutterFlowModel<OnboardingPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for OnboardingIte.
  late FlutterFlowDynamicModels<OnboardingItemModel> onboardingIteModels;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Model for SecondaryButton.
  late SecondaryBtnModel secondaryButtonModel;

  @override
  void initState(BuildContext context) {
    onboardingIteModels = FlutterFlowDynamicModels(() => OnboardingItemModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
    secondaryButtonModel = createModel(context, () => SecondaryBtnModel());
  }

  @override
  void dispose() {
    onboardingIteModels.dispose();
    primaryButtonModel.dispose();
    secondaryButtonModel.dispose();
  }
}
