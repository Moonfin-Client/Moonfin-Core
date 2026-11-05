import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/viewmodels/seerr_issues_view_model.dart';

void main() {
  test('every issue filter is sent explicitly, including all', () {
    // Seerr's API spec defaults a missing filter to open, so omitting it for
    // "all" would hide resolved issues.
    expect(SeerrIssueFilter.open.apiValue, 'open');
    expect(SeerrIssueFilter.resolved.apiValue, 'resolved');
    expect(SeerrIssueFilter.all.apiValue, 'all');
  });
}
