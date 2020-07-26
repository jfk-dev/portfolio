abstract class SectionWidget {
  /// The title for this section.
  String get title;

  /// Indicates if this section should be selectable in a tab bar.
  bool get isSelectable => true;
}
