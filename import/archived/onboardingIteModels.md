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
