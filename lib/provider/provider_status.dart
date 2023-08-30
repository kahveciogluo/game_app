enum ProviderStatusType { initialized, loading, success, failed, empty }

extension ProviderStatusTypeExtension on ProviderStatusType {
  String get text {
    switch (this) {
      case ProviderStatusType.loading:
        return 'Loading';
      case ProviderStatusType.failed:
        return 'There is an error';
      case ProviderStatusType.empty:
        return 'There is no data to show';
      default:
        return '';
    }
  }
}
