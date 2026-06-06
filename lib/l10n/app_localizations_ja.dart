// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'Account Preferences';

  @override
  String get interfaceLanguage => 'Interface Language';

  @override
  String get systemLanguageDefault => 'System Default';

  @override
  String get signIn => 'サインイン';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'クイックコネクト';

  @override
  String get password => 'パスワード';

  @override
  String get username => 'ユーザー名';

  @override
  String get email => '電子メール';

  @override
  String get quickConnectInstruction => 'サーバーの Web ダッシュボードに次のコードを入力します。';

  @override
  String get waitingForAuthorization => '承認を待っています...';

  @override
  String get back => '戻る';

  @override
  String get serverUnavailable => 'サーバーが利用できません';

  @override
  String get loginFailed => 'ログインに失敗しました';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => '誰が見てるの？';

  @override
  String get addUser => 'ユーザーの追加';

  @override
  String get selectServer => 'サーバーの選択';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => '保存されたサーバー';

  @override
  String get discoveredServers => '検出されたサーバー';

  @override
  String get noneFound => '何も見つかりませんでした';

  @override
  String get unableToConnectToServer => 'サーバーに接続できません';

  @override
  String get addServer => 'サーバーの追加';

  @override
  String get embyConnect => 'Emby 接続';

  @override
  String get removeServer => 'サーバーの削除';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'キャンセル';

  @override
  String get remove => '取り除く';

  @override
  String get connectToServer => 'サーバーに接続する';

  @override
  String get serverAddress => 'サーバーアドレス';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => '接続する';

  @override
  String get secureStorageUnavailable => '安全なストレージが使用不可';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin はシステム キーリングにアクセスできませんでした。ログインは続行できますが、キーリングのロックが解除されるまで安全なトークン ストレージを利用できなくなる可能性があります。';

  @override
  String get ok => 'わかりました';

  @override
  String get settingsAppearanceTheme => 'アプリのテーマ';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'アプリを再起動せずに Moonfin と Neon Pulse を切り替える';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle => '皆さんが気に入った現在の Moonfin の外観';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle =>
      'マゼンタの輝き、シアンのテキスト、より強いクロムコントラストを備えた Synthwave スタイル';

  @override
  String get embyConnectSignInSubtitle => 'Emby Connect アカウントでサインインする';

  @override
  String get emailOrUsername => 'メールアドレスまたはユーザー名';

  @override
  String get selectAServer => 'サーバーを選択してください';

  @override
  String get tryAgain => 'もう一度やり直してください';

  @override
  String get noLinkedServers => 'この Emby Connect アカウントにリンクされているサーバーはありません';

  @override
  String get invalidEmbyConnectCredentials => '無効な Emby Connect 認証情報';

  @override
  String get invalidEmbyConnectLogin => '無効な Emby Connect ユーザー名またはパスワード';

  @override
  String get embyConnectExchangeNotSupported =>
      'サーバーはEmby Connect交換をサポートしていません';

  @override
  String get embyConnectNetworkError =>
      'Emby Connect または選択したサーバーへの接続中にネットワーク エラーが発生しました';

  @override
  String get loadingLinkedServers => 'リンクサーバーをロード中...';

  @override
  String get connectingToServerEllipsis => 'サーバーに接続しています...';

  @override
  String get noReachableAddress => '到達可能なアドレスが指定されていません';

  @override
  String get invalidServerExchangeResponse => 'サーバー交換エンドポイントからの無効な応答';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Moonfin を終了しますか?';

  @override
  String get exitAppConfirmation => '終了してもよろしいですか?';

  @override
  String get exit => '出口';

  @override
  String get noHomeRowsLoaded => 'ホーム行をロードできませんでした';

  @override
  String get noHomeRowsHint => 'アクティブなホームセクションを更新または削減してみてください。';

  @override
  String get retryHomeRows => 'ホーム行の再試行';

  @override
  String get guide => 'ガイド';

  @override
  String get recordings => '録音';

  @override
  String get schedule => 'スケジュール';

  @override
  String get series => 'シリーズ';

  @override
  String get noItemsFound => '項目が見つかりませんでした';

  @override
  String get home => '家';

  @override
  String get browseAll => 'すべて参照';

  @override
  String get genres => 'ジャンル';

  @override
  String get collectionPlaceholder => 'ここにコレクションアイテムが表示されます';

  @override
  String get browseByLetter => '文字ごとに閲覧';

  @override
  String get alphabeticalBrowsePlaceholder => 'ここにアルファベット順の参照が表示されます';

  @override
  String get suggestions => '提案';

  @override
  String get suggestionsPlaceholder => 'おすすめのアイテムがここに表示されます';

  @override
  String get failedToLoadLibraries => 'ライブラリのロードに失敗しました';

  @override
  String get noLibrariesFound => 'ライブラリが見つかりませんでした';

  @override
  String get library => '図書館';

  @override
  String get displaySettings => '表示設定';

  @override
  String get allGenres => 'オールジャンル';

  @override
  String get noGenresFound => 'ジャンルが見つかりません';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'このフォルダは空です';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => 'お気に入りの読み込みに失敗しました';

  @override
  String get retry => 'リトライ';

  @override
  String get noFavoritesYet => 'まだお気に入りはありません';

  @override
  String get favorites => 'お気に入り';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => '継続中';

  @override
  String get ended => '終了しました';

  @override
  String get sortAndFilter => '並べ替えとフィルター';

  @override
  String get type => 'タイプ';

  @override
  String get sortBy => '並べ替え';

  @override
  String get display => '画面';

  @override
  String get imageType => '画像の種類';

  @override
  String get posterSize => 'ポスターサイズ';

  @override
  String get small => '小さい';

  @override
  String get medium => '中くらい';

  @override
  String get large => '大きい';

  @override
  String get extraLarge => '特大';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'ビュー';

  @override
  String get albums => 'アルバム';

  @override
  String get albumArtists => 'アルバムアーティスト';

  @override
  String get artists => 'アーティスト';

  @override
  String get bookmarks => 'ブックマーク';

  @override
  String get noSavedBookmarks => 'このタイトルにはまだブックマークが保存されていません。';

  @override
  String get openBook => '開いた本';

  @override
  String get chapter => '章';

  @override
  String get page => 'ページ';

  @override
  String get bookmark => 'ブックマーク';

  @override
  String get justNow => 'ちょうど今';

  @override
  String minutesAgo(int count) {
    return '${count}m ago';
  }

  @override
  String hoursAgo(int count) {
    return '${count}h ago';
  }

  @override
  String daysAgo(int count) {
    return '${count}d ago';
  }

  @override
  String get discoverySubjects => '発見の主題';

  @override
  String get pickDiscoverySubjects => 'Discover に表示する件名フィードを選択します。';

  @override
  String get apply => '適用する';

  @override
  String get openLink => 'リンクを開く';

  @override
  String get scanWithYourPhone => '携帯電話でスキャン';

  @override
  String get audiobookGenres => 'オーディオブックのジャンル';

  @override
  String get pickAudiobookGenres => 'Audiobook Discover で表示するジャンルを選択します。';

  @override
  String get discoverAudiobooks => 'オーディオブックを発見する';

  @override
  String get librivoxDescription => 'LibriVox の人気のパブリック ドメイン タイトル。';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => '左にスクロール';

  @override
  String get scrollRight => '右にスクロール';

  @override
  String get couldNotLoadGenre => '現在このジャンルを読み込めませんでした。';

  @override
  String get continueReading => '続きを読む';

  @override
  String get savedHighlights => '保存されたハイライト';

  @override
  String get continueListening => '聞き続ける';

  @override
  String get listen => '聞く';

  @override
  String get resume => '再開する';

  @override
  String get failedToLoadLibrary => 'ライブラリのロードに失敗しました';

  @override
  String get popularNow => '今人気の';

  @override
  String get savedForLater => '後で使用するために保存';

  @override
  String get topListens => 'トップリッスン';

  @override
  String get unreadDiscoveries => '未読の発見';

  @override
  String get pickUpAgain => '再びピックアップ';

  @override
  String get bookHighlightsDescription => 'ハイライト、お気に入り、または読書の進み具合を含む書籍。';

  @override
  String get handPickedFromLibrary => 'ライブラリから厳選しました。';

  @override
  String get handPickedFromListeningQueue => 'リスニング キューから厳選されます。';

  @override
  String get booksWithHighlights => 'ハイライト、お気に入り、または読書の進み具合のある本。';

  @override
  String get jumpBackNarration => '自分の場所を探すことなく、ナレーションに戻ります。';

  @override
  String get unreadBooksReady => '未読の本を次の静かな時間に備えます。';

  @override
  String get quickAccessFavorites => '何度も読み返す書籍にすばやくアクセスできます。';

  @override
  String get searchAudiobooks => 'オーディオブックを検索する';

  @override
  String get searchYourLibrary => 'ライブラリを検索する';

  @override
  String get pickUpStory => '中断したところから話を再開する';

  @override
  String get savedPlacesChapters => '保存した場所と未完了の章';

  @override
  String authorsCount(int count) {
    return '$count authors';
  }

  @override
  String genresCount(int count) {
    return '$count genres';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% completed';
  }

  @override
  String get readyWhenYouAre => 'いつでも準備完了';

  @override
  String get details => '詳細';

  @override
  String get listeningRoom => 'リスニングルーム';

  @override
  String get bookmarksAndProgress => 'ブックマークと進捗状況';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'タイトル';

  @override
  String get allTitles => 'すべてのタイトル';

  @override
  String get authors => '著者';

  @override
  String get browseByAuthor => '著者別に参照';

  @override
  String get browseByGenre => 'ジャンル別に見る';

  @override
  String get discover => '発見する';

  @override
  String get trendingTitlesOpenLibrary => 'Open Library からの主題別のトレンド タイトル。';

  @override
  String get noBookmarkedItems => 'ブックマークされたアイテムはまだありません';

  @override
  String get nothingMatchesSection =>
      'このセクションに一致するものはまだありません。別のタブを試すか、ライブラリの同期が完了してから戻ってください。';

  @override
  String get audiobooks => 'オーディオブック';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => 'フォルダ';

  @override
  String get filters => 'フィルター';

  @override
  String get readingStatus => 'ステータスの読み取り';

  @override
  String get playedStatus => 'プレイ済みステータス';

  @override
  String get readStatus => '読む';

  @override
  String get watched => '見た';

  @override
  String get unread => '未読';

  @override
  String get unwatched => '未視聴';

  @override
  String get seriesStatus => 'シリーズステータス';

  @override
  String get allLibraries => 'すべての図書館';

  @override
  String get books => '本';

  @override
  String get author => '著者';

  @override
  String get unknownAuthor => '作者不明';

  @override
  String get uncategorized => '未分類';

  @override
  String get overview => '概要';

  @override
  String get noLibrivoxDescription => 'このタイトルについては、LibriVox による説明がまだありません。';

  @override
  String get readers => '読者';

  @override
  String get openLinks => 'リンクを開く';

  @override
  String get librivoxPage => 'LibriVox ページ';

  @override
  String get internetArchive => 'インターネットアーカイブ';

  @override
  String get rssFeed => 'RSSフィード';

  @override
  String get downloadZip => 'ZIP をダウンロード';

  @override
  String sectionCountLabel(int count) {
    return '$count sections';
  }

  @override
  String firstPublished(int year) {
    return 'First published $year';
  }

  @override
  String get noOpenLibraryOverview => 'このタイトルの Open Library からはまだ概要が入手できません。';

  @override
  String get subjects => '科目';

  @override
  String get all => '全て';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => '現在この件名を読み込めませんでした。';

  @override
  String get audiobookDetails => 'オーディオブックの詳細';

  @override
  String authorsCountTitle(int count) {
    return '$count Authors';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count audiobooks',
      one: '1 audiobook',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'トラックリスト';

  @override
  String get itemListPlaceholder => 'ここにアイテム一覧が表示されます';

  @override
  String get favoriteTracksPlaceholder => 'お気に入りのトラックがここに表示されます';

  @override
  String get failedToLoad => 'ロードに失敗しました';

  @override
  String get delete => '消去';

  @override
  String get save => '保存';

  @override
  String get moreLikeThis => 'もっと似たもの';

  @override
  String get castAndCrew => 'キャスト＆スタッフ';

  @override
  String get collection => 'コレクション';

  @override
  String get episodes => 'エピソード';

  @override
  String get nextUp => '次は次へ';

  @override
  String get seasons => '季節';

  @override
  String get chapters => '章';

  @override
  String get features => '特徴';

  @override
  String get movies => '映画';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => '他の';

  @override
  String get discography => 'ディスコグラフィー';

  @override
  String get similarArtists => '似ているアーティスト';

  @override
  String get tableOfContents => '目次';

  @override
  String get tracklist => 'トラックリスト';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'バイオグラフィー';

  @override
  String get authorDetails => '著者詳細';

  @override
  String get noOverviewAvailable => 'このタイトルの概要はまだありません。';

  @override
  String get noBiographyAvailable => 'この著者の経歴はありません。';

  @override
  String get noBooksFound => 'この著者の書籍は見つかりませんでした。';

  @override
  String get unableToLoadAuthorDetails => '現在、著者の詳細を読み込むことができません。';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => '発行日不明';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seasons',
      one: '1 Season',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Ends at $time';
  }

  @override
  String endsIn(String time) {
    return 'Ends in $time';
  }

  @override
  String get view => 'ビュー';

  @override
  String get resumeReading => '読書を再開する';

  @override
  String get read => '読む';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => '遊ぶ';

  @override
  String get startOver => '最初からやり直す';

  @override
  String get restart => '再起動';

  @override
  String get readOffline => 'オフラインで読む';

  @override
  String get playOffline => 'オフラインでプレイ';

  @override
  String get audio => 'オーディオ';

  @override
  String get subtitles => '字幕';

  @override
  String get version => 'バージョン';

  @override
  String get cast => 'キャスト';

  @override
  String get trailer => 'トレーラー';

  @override
  String get finished => '終了した';

  @override
  String get favorited => 'お気に入りに追加しました';

  @override
  String get favorite => 'お気に入り';

  @override
  String get playlist => 'プレイリスト';

  @override
  String get downloaded => 'ダウンロード済み';

  @override
  String get downloadAll => 'すべてダウンロード';

  @override
  String get download => 'ダウンロード';

  @override
  String get deleteDownloaded => 'ダウンロード済みの削除';

  @override
  String get goToSeries => 'シリーズへ';

  @override
  String get editMetadata => 'メタデータの編集';

  @override
  String get less => '少ない';

  @override
  String get more => 'もっと';

  @override
  String get deleteItem => '項目の削除';

  @override
  String get deletePlaylist => 'プレイリストの削除';

  @override
  String get deletePlaylistMessage => 'このプレイリストをサーバーから削除しますか?';

  @override
  String get deleteItemMessage => 'このアイテムをサーバーから削除しますか?';

  @override
  String get failedToDeletePlaylist => 'プレイリストの削除に失敗しました';

  @override
  String get failedToDeleteItem => 'アイテムの削除に失敗しました';

  @override
  String get renamePlaylist => 'プレイリストの名前を変更する';

  @override
  String get playlistName => 'プレイリスト名';

  @override
  String get deleteDownloadedAlbum => 'ダウンロードしたアルバムを削除する';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'ダウンロードしたトラックが削除されました';

  @override
  String get downloadedTracksDeleteFailed => 'ダウンロードした一部のトラックが削除できませんでした';

  @override
  String get noTracksLoaded => 'トラックがロードされていません';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'No $itemLabel loaded';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Downloading $title ($count items)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Are you sure you want to delete \"$name\" from the server? This action cannot be undone.';
  }

  @override
  String get itemDeleted => 'アイテムが削除されました';

  @override
  String get noPlayableTrailerFound => 'プレイ可能なトレーラーが見つかりません。';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'オーディオトラック';

  @override
  String get subtitleTrack => '字幕トラック';

  @override
  String get none => 'なし';

  @override
  String get downloadSubtitlesLabel => '字幕をダウンロード...';

  @override
  String get searchOpenSubtitlesPlugin => 'OpenSubtitles プラグインを使用して検索する';

  @override
  String get downloadSubtitles => '字幕をダウンロードする';

  @override
  String get selectedSubtitleInvalid => '選択された字幕は無効です。';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      '字幕をダウンロードしました。 Jellyfin が項目を更新している間、表示されるまでに少し時間がかかる場合があります。';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'バージョンの選択';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'すべてダウンロード — 品質';

  @override
  String get downloadQuality => 'ダウンロード品質';

  @override
  String get originalFileNoReencoding => '元のファイル、再エンコードなし';

  @override
  String get originalFilesNoReencoding => '元のファイル、再エンコードなし';

  @override
  String get noEpisodesLoaded => 'エピソードがロードされていません';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'ダウンロードしたファイルを削除する';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => 'ダウンロードしたファイルが削除されました';

  @override
  String get failedToDeleteFiles => 'ファイルの削除に失敗しました';

  @override
  String get deleteFiles => 'ファイルの削除';

  @override
  String get director => '監督';

  @override
  String get writers => 'ライター';

  @override
  String get studio => 'スタジオ';

  @override
  String studioMoreCount(int count) {
    return '+$count more';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Episodes';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Episode $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Chapter $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tracks',
      one: '1 track',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chapters',
      one: '1 chapter',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Born $date';
  }

  @override
  String died(String date) {
    return 'Died $date';
  }

  @override
  String age(int age) {
    return 'Age $age';
  }

  @override
  String get showLess => '表示を減らす';

  @override
  String get readMore => '続きを読む';

  @override
  String get shuffle => 'シャッフル';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => '完璧に一致';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => '単核症';

  @override
  String get stereo => 'ステレオ';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'Remote subtitle $action requires the Jellyfin subtitle management permission for this user.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'This item could not be found on the server for remote subtitle $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Remote subtitle $action failed: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Remote subtitle $action failed (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Failed to $action remote subtitles.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'all downloaded episodes for \"$name\"';
  }

  @override
  String get deleteSeasonFiles => '今シーズンのダウンロードされたすべてのエピソード';

  @override
  String get stillWatching => 'まだご覧ですか?';

  @override
  String get unableToLoadTrailerStream => 'トレーラー ストリームをロードできません。';

  @override
  String get trailerTimedOut => 'トレーラーのロード中にタイムアウトが発生しました。';

  @override
  String get playbackFailedForTrailer => 'このトレーラーの再生に失敗しました。';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline => 'オフライン再生中はキャストできません。';

  @override
  String castActionFailed(String label, String error) {
    return '$label action failed: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Failed to set cast volume: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Controls';
  }

  @override
  String get deviceVolume => 'デバイスボリューム';

  @override
  String get unavailable => '利用不可';

  @override
  String get pause => '一時停止';

  @override
  String get syncPosition => '同期位置';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'キューは空です';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'リモート再生';

  @override
  String get castingToGoogleCast => 'Google Cast へのキャスト';

  @override
  String get castingViaAirPlay => 'AirPlay 経由でキャストする';

  @override
  String get castingViaDlna => 'DLNA 経由でキャストする';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => '長押しするとロックが解除されます';

  @override
  String get off => 'オフ';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => '自動';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'ビットレートオーバーライド';

  @override
  String get audioDelay => '音声遅延';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => '字幕の遅延';

  @override
  String get reset => 'リセット';

  @override
  String get unknown => '未知';

  @override
  String get playbackInformation => '再生情報';

  @override
  String get playback => '再生';

  @override
  String get playMethod => '遊び方';

  @override
  String get directPlay => 'ダイレクトプレイ';

  @override
  String get directStream => 'ダイレクトストリーム';

  @override
  String get transcoding => 'トランスコーディング';

  @override
  String get transcodeReasons => 'トランスコードの理由';

  @override
  String get player => 'プレーヤー';

  @override
  String get container => '容器';

  @override
  String get bitrate => 'ビットレート';

  @override
  String get video => 'ビデオ';

  @override
  String get resolution => '解決';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'コーデック';

  @override
  String get videoBitrate => 'ビデオビットレート';

  @override
  String get track => '追跡';

  @override
  String get channels => 'チャンネル';

  @override
  String get audioBitrate => 'オーディオビットレート';

  @override
  String get sampleRate => 'サンプルレート';

  @override
  String get format => '形式';

  @override
  String get external => '外部の';

  @override
  String get embedded => '埋め込み';

  @override
  String castSessionError(String protocol) {
    return '$protocol session error';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Failed to load book details: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'アプリ内 EPUB レンダリングは、このプラットフォームではまだ利用できません。';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'このプラットフォームでは、埋め込みドキュメントのレンダリングは利用できません。';

  @override
  String get couldNotOpenExternalViewer => '外部ビューアを開けませんでした。';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Failed to open in-app reader: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Bookmark already saved at $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Bookmark added: $label';
  }

  @override
  String get noBookmarksYet =>
      'まだブックマークはありません。\n読書中にブックマーク アイコンをタップして、位置を保存します。';

  @override
  String get noTableOfContentsAvailable => '目次がありません';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => '位置';

  @override
  String get bookReader => 'ブックリーダー';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => '更新中...';

  @override
  String get markUnread => '未読としてマークする';

  @override
  String get markAsRead => '既読としてマーク';

  @override
  String get reloadReader => 'リーダーのリロード';

  @override
  String get noPagesFound => 'ページが見つかりませんでした。';

  @override
  String get failedToDecodePageImage => 'ページ画像のデコードに失敗しました。';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => '単一ページ';

  @override
  String get twoPageSpread => '見開き2ページ';

  @override
  String get addBookmark => 'ブックマークを追加';

  @override
  String get bookmarksEllipsis => 'ブックマーク...';

  @override
  String get markedAsRead => '既読としてマークされました';

  @override
  String get markedAsUnread => '未読としてマークされています';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => 'テーマ: システム';

  @override
  String get themeLight => 'テーマ: 光';

  @override
  String get themeDark => 'テーマ: ダーク';

  @override
  String get themeSepia => 'テーマ: セピア';

  @override
  String get invertColorsFixedLayout => '色を反転（固定レイアウト）';

  @override
  String get invertColorsPdf => '色を反転する (PDF)';

  @override
  String get preparingInAppReader => 'アプリ内リーダーを準備しています...';

  @override
  String get pdfDataNotAvailable => 'PDFデータはありません。';

  @override
  String get readerFallbackModeActive => 'リーダーフォールバックモードがアクティブです';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'サポートされているプラ​​ットフォーム ターゲット (Android、iOS、macOS) に切り替えた後、Reload Reader を使用します。';

  @override
  String get openExternally => '外部に開く';

  @override
  String get noEpubChaptersFound => 'EPUB の章が見つかりません。';

  @override
  String get readerNotReady => 'リーダーの準備ができていません。';

  @override
  String get seriesRecordings => 'シリーズ録音';

  @override
  String get now => '今';

  @override
  String get sports => 'スポーツ';

  @override
  String get news => 'ニュース';

  @override
  String get kids => 'キッズ';

  @override
  String get premiere => 'プレミア公開';

  @override
  String get guideTimeline => 'ガイドのタイムライン';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'チャンネルが見つかりません';

  @override
  String get liveBadge => 'ライブ';

  @override
  String get movie => '映画';

  @override
  String get removedFromFavoriteChannels => 'お気に入りチャンネルから削除されました';

  @override
  String get addedToFavoriteChannels => 'お気に入りチャンネルに追加されました';

  @override
  String get failedToUpdateFavoriteChannel => 'お気に入りチャンネルの更新に失敗しました';

  @override
  String get unfavoriteChannel => 'お気に入りでないチャンネル';

  @override
  String get favoriteChannel => 'お気に入りのチャンネル';

  @override
  String get record => 'Record';

  @override
  String get cancelRecordingAction => 'Cancel Recording';

  @override
  String get programSetToRecord => 'Program set to record';

  @override
  String get recordingCancelled => 'Recording cancelled';

  @override
  String get unableToCreateRecording => 'Unable to create recording';

  @override
  String get watch => '時計';

  @override
  String get close => '近い';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => '録音のロードに失敗しました';

  @override
  String get scheduledInNext24Hours => '今後 24 時間以内に予定されている';

  @override
  String get recentRecordings => '最近の録音';

  @override
  String get tvSeries => '連続テレビ番組';

  @override
  String get failedToLoadSchedule => 'スケジュールの読み込みに失敗しました';

  @override
  String get noScheduledRecordings => '録画予約はありません';

  @override
  String get cancelRecording => '録音をキャンセルしますか?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'いいえ';

  @override
  String get yesCancel => 'はい、キャンセルします';

  @override
  String get failedToCancelRecording => '録音のキャンセルに失敗しました';

  @override
  String get failedToLoadSeriesRecordings => 'シリーズ録画のロードに失敗しました';

  @override
  String get noSeriesRecordings => 'シリーズ録画なし';

  @override
  String get cancelSeriesRecording => 'シリーズ録画のキャンセル';

  @override
  String get cancelSeriesRecordingQuestion => 'シリーズ録画をキャンセルしますか?';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording => 'シリーズ録画のキャンセルに失敗しました';

  @override
  String get searchThisLibrary => 'このライブラリを検索...';

  @override
  String get searchEllipsis => '検索...';

  @override
  String noResultsForQuery(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => 'シーア';

  @override
  String get seerrAccountType => 'シーアアカウントの種類';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => '地元';

  @override
  String get savedMedia => '保存されたメディア';

  @override
  String get tvShows => 'テレビ番組';

  @override
  String get music => '音楽';

  @override
  String get musicAlbums => '音楽アルバム';

  @override
  String get noMediaInFilter => 'このフィルタにはメディアがありません';

  @override
  String get noDownloadedMediaYet => 'ダウンロードされたメディアはまだありません';

  @override
  String get browseLibrary => 'ライブラリを参照する';

  @override
  String get deleteDownload => 'ダウンロードの削除';

  @override
  String removeItemAndFiles(String name) {
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'アルバム';

  @override
  String get playAlbum => 'アルバムを再生する';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => '季節';

  @override
  String get errorLoadingEpisodes => 'エピソードの読み込みエラー';

  @override
  String get noDownloadedEpisodes => 'ダウンロードされたエピソードはありません';

  @override
  String get deleteEpisode => 'エピソードの削除';

  @override
  String removeName(String name) {
    return 'Remove \"$name\"?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'Episode $number';
  }

  @override
  String get seriesNotFound => 'シリーズが見つかりません';

  @override
  String get errorLoadingSeries => 'シリーズの読み込みエラー';

  @override
  String get downloadedEpisodes => 'ダウンロードされたエピソード';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'スペシャル';

  @override
  String get deleteSeason => 'シーズンの削除';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Delete all downloaded episodes in $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodes',
      one: '1 episode',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'ストレージ管理';

  @override
  String get storageBreakdown => 'ストレージの内訳';

  @override
  String get downloadedItems => 'ダウンロードしたアイテム';

  @override
  String get storageLimit => 'ストレージ制限';

  @override
  String get noLimit => '制限なし';

  @override
  String get deleteAllDownloads => 'すべてのダウンロードを削除';

  @override
  String get deleteAllDownloadsWarning =>
      'これにより、ダウンロードされたすべてのメディア ファイルが削除され、元に戻すことはできません。';

  @override
  String get deleteAll => 'すべて削除';

  @override
  String get deleteSelected => '選択したものを削除';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => '音楽とオーディオブック';

  @override
  String get images => '画像';

  @override
  String get database => 'データベース';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => '設定';

  @override
  String get authentication => '認証';

  @override
  String get autoLoginServerManagement => '自動ログイン、サーバー管理';

  @override
  String get pinCode => 'PINコード';

  @override
  String get setUpPinCodeProtection => 'PINコード保護を設定する';

  @override
  String get parentalControls => 'ペアレンタルコントロール';

  @override
  String get contentRatingRestrictions => 'コンテンツレーティングの制限';

  @override
  String get bitRateResolutionBehavior => 'ビットレート、解像度、動作';

  @override
  String get languageSizeAppearance => '言語、サイズ、外観';

  @override
  String get qualityStorage => '品質、保管';

  @override
  String get serverSyncAndPluginStatus => 'サーバーの同期とプラグインのステータス';

  @override
  String get mediaRequestIntegration => 'メディアリクエストの統合';

  @override
  String get switchServer => 'スイッチサーバー';

  @override
  String get signOut => 'サインアウト';

  @override
  String get versionLicenses => 'バージョン、ライセンス';

  @override
  String get account => 'アカウント';

  @override
  String get signInAndSecurity => 'サインインとセキュリティ';

  @override
  String get administration => '管理';

  @override
  String get serverSettingsUsersLibraries => 'サーバー設定、ユーザー、ライブラリ';

  @override
  String get customization => 'カスタマイズ';

  @override
  String get themeAndLayout => 'テーマとレイアウト';

  @override
  String get videoAndSubtitles => 'ビデオと字幕';

  @override
  String get integrations => '統合';

  @override
  String get pluginAndRequests => 'プラグインとリクエスト';

  @override
  String get customizeAccountPlaybackInterface =>
      'アカウント、再生、インターフェースの動作をカスタマイズする';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => 'テーマと外観';

  @override
  String get focusBorderColor => 'フォーカス境界線の色';

  @override
  String get watchedIndicators => '監視されているインジケーター';

  @override
  String get always => 'いつも';

  @override
  String get hideUnwatched => '未視聴を非表示にする';

  @override
  String get episodesOnly => 'エピソードのみ';

  @override
  String get never => '一度もない';

  @override
  String get focusExpansionAnimation => 'フォーカス拡張アニメーション';

  @override
  String get desktopUiScale => 'デスクトップ UI スケール';

  @override
  String get scaleFocusedCards => 'フォーカスまたはホバーされたカードとタイルを拡大縮小する';

  @override
  String get backgroundBackdrops => '背景の背景';

  @override
  String get showBackdropImages => 'コンテンツの後ろに背景画像を表示する';

  @override
  String get seriesThumbnails => 'シリーズのサムネイル';

  @override
  String get seriesThumbnailsDescription =>
      'エピソードのみ: 各行の画像タイプに一致するシリーズ アートワークを使用します';

  @override
  String get homeRowInfoOverlay => 'ホーム行情報オーバーレイ';

  @override
  String get showTitleMetadataOnHomeRows => 'ホーム行を参照するときにタイトルとメタデータを表示する';

  @override
  String get clockDisplay => '時計表示';

  @override
  String get inMenus => 'メニュー内';

  @override
  String get inVideo => 'ビデオで';

  @override
  String get seasonalEffects => '季節の影響';

  @override
  String get seasonalEffectsDescription => '視覚効果と季節の装飾';

  @override
  String get snow => '雪';

  @override
  String get fireworks => '花火';

  @override
  String get confetti => '紙吹雪';

  @override
  String get fallingLeaves => '落ち葉';

  @override
  String get themeMusic => 'テーマ曲';

  @override
  String get playThemeMusicOnDetailPages => '詳細ページでテーマ音楽を再生する';

  @override
  String get themeMusicVolume => 'テーマ曲の音量';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'ホームロウズのテーマ音楽';

  @override
  String get playWhenBrowsingHomeScreen => 'ホーム画面閲覧時に再生';

  @override
  String get detailsBackgroundBlur => '詳細背景ぼかし';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => '背景ぼかしの閲覧';

  @override
  String get maxStreamingBitrate => '最大ストリーミングビットレート';

  @override
  String get maxResolution => '最大解像度';

  @override
  String get playerZoomMode => 'プレーヤーズームモード';

  @override
  String get settingsScrollWheelAction => 'Mouse scroll wheel';

  @override
  String get settingsScrollWheelActionDescription =>
      'Choose what scrolling the mouse wheel over the video does during playback.';

  @override
  String get scrollWheelActionOff => 'Off';

  @override
  String get scrollWheelActionSeek => 'Seek (forward / back)';

  @override
  String get scrollWheelActionVolume => 'Volume';

  @override
  String get playerTooltipVolume => 'Volume';

  @override
  String get fit => 'フィット';

  @override
  String get autoCrop => '自動トリミング';

  @override
  String get stretch => 'ストレッチ';

  @override
  String get refreshRateSwitching => 'リフレッシュレートの切り替え';

  @override
  String get disabled => '無効';

  @override
  String get scaleOnTv => 'テレビのスケール';

  @override
  String get scaleOnDevice => 'デバイス上のスケール';

  @override
  String get trickPlay => 'トリックプレイ';

  @override
  String get showPreviewThumbnailsWhenSeeking => 'シーク時にプレビューのサムネイルを表示する';

  @override
  String get showDescriptionOnPause => '一時停止時に説明を表示';

  @override
  String get dimVideoShowOverview => '一時停止中にビデオを暗くして概要テキストを表示する';

  @override
  String get osdLockButton => 'OSDロックボタン';

  @override
  String get osdLockButtonDescription => '長押しするまでタッチ入力をブロックするロック ボタンを表示します';

  @override
  String get audioBehavior => 'オーディオの動作';

  @override
  String get downmixToStereo => 'ステレオへのダウンミックス';

  @override
  String get defaultAudioLanguage => 'デフォルトの音声言語';

  @override
  String get autoServerDefault => '自動 (サーバーのデフォルト)';

  @override
  String get english => '英語';

  @override
  String get spanish => 'スペイン語';

  @override
  String get french => 'フランス語';

  @override
  String get german => 'ドイツ語';

  @override
  String get italian => 'イタリア語';

  @override
  String get portuguese => 'ポルトガル語';

  @override
  String get japanese => '日本語';

  @override
  String get korean => '韓国人';

  @override
  String get chinese => '中国語';

  @override
  String get russian => 'ロシア';

  @override
  String get arabic => 'アラビア語';

  @override
  String get hindi => 'ヒンディー語';

  @override
  String get dutch => 'オランダ語';

  @override
  String get swedish => 'スウェーデン語';

  @override
  String get norwegian => 'ノルウェー語';

  @override
  String get danish => 'デンマーク語';

  @override
  String get finnish => 'フィンランド語';

  @override
  String get polish => '研磨';

  @override
  String get ac3Passthrough => 'AC3 パススルー';

  @override
  String get dtsPassthrough => 'DTS パススルー';

  @override
  String get trueHdSupport => 'TrueHD のサポート';

  @override
  String get enableDtsPassthrough =>
      'DTS オーディオを AVR にのみビットストリームします。レシーバーのサポートと DTS ソース トラックが必要です';

  @override
  String get enableTrueHdAudio =>
      'TrueHD オーディオを有効にする (プラットフォームによっては機能しない場合があります)';

  @override
  String get settingsAudioOutputMode => 'Audio Output Mode';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Audio Fallback Codec';

  @override
  String get settingsAudioFallbackAacStereo => 'AAC Stereo';

  @override
  String get settingsAudioFallbackAc35_1 => 'AC3 5.1';

  @override
  String get settingsAudioFallbackEac35_1 => 'EAC3 5.1';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (Advanced)';

  @override
  String get settingsAudioCodecPassthrough => 'Codec Passthrough';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Enable only formats your AVR or HDMI sink supports.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 Passthrough';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos) Passthrough';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core Passthrough';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA Passthrough';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD Passthrough';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos Passthrough';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Bitstream Dolby Digital Plus (EAC3) to external decoder.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Bitstream Dolby Atmos over EAC3 (JOC) to external decoder.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Bitstream DTS-HD MA (includes DTS core) to external decoder.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Bitstream Dolby TrueHD with Atmos metadata to external decoder.';

  @override
  String get settingsDetectedAudioCapabilities => 'Detected Audio Capabilities';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'No runtime capability snapshot available yet.';

  @override
  String get settingsAudioRouteLabel => 'Route';

  @override
  String get settingsAudioDecodeLabel => 'Decode';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'HD audio route';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Speaker';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Diagnostics';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Video Level';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Video Range';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Subtitle Codec';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Allowed Audio Codecs';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS Audio Codecs';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 Audio Codecs';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif passthrough';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Active Audio Route';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Route HD Audio Support';

  @override
  String get nightMode => 'ナイトモード';

  @override
  String get compressDynamicRange => 'ダイナミックレンジを圧縮する';

  @override
  String get advancedMpv => '高度な mpv';

  @override
  String get enableCustomMpvConf => 'カスタム mpv.conf を有効にする';

  @override
  String get applyMpvConfBeforePlayback => '再生を開始する前に、ユーザー指定の mpv.conf を適用します。';

  @override
  String get unsafeAdvancedMpvOptions => '安全でない高度な mpv オプション';

  @override
  String get unsafeMpvOptionsDescription =>
      'mpv オプションの幅広いセットを許可します。再生動作が壊れる可能性があります。';

  @override
  String get hardwareDecoding => 'ハードウェアデコード';

  @override
  String get hardwareDecodingSubtitle =>
      'パフォーマンスが向上する可能性がありますが、一部のデバイスでは再生の問題が発生する可能性があります。';

  @override
  String get nextUpAndQueuing => '次の作業とキューイング';

  @override
  String get nextUpDisplay => '次のディスプレイ';

  @override
  String get extended => '拡張された';

  @override
  String get minimal => '最小限';

  @override
  String get nextUpTimeout => '次のタイムアウト';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'メディアキューイング';

  @override
  String get autoQueueNextEpisodes => '次のエピソードを自動キューに入れる';

  @override
  String get stillWatchingPrompt => 'プロンプトをまだ見ています';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => '再開とスキップ';

  @override
  String get resumeRewind => '巻き戻しを再開';

  @override
  String get unpauseRewind => '一時停止を解除して巻き戻し';

  @override
  String get fiveSeconds => '5秒';

  @override
  String get tenSeconds => '10秒';

  @override
  String get fifteenSeconds => '15秒';

  @override
  String get thirtySeconds => '30秒';

  @override
  String get skipBackLength => 'スキップバックの長さ';

  @override
  String get skipForwardLength => '前方スキップの長さ';

  @override
  String get customMpvConfPath => 'カスタム mpv.conf パス';

  @override
  String get notSetMpvConf =>
      '設定されていません。 Moonfin は、app/data フォルダー内のデフォルトの mpv.conf を試行します。';

  @override
  String get selectMpvConf => 'mpv.conf を選択します';

  @override
  String get pathToMpvConf => '/パス/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'スタイル設定 (サイズ、色、オフセット) は、テキストベースの字幕 (SRT、VTT、TTML) に適用されます。 ASS/SSA 字幕は、「ASS/SSA ダイレクト再生」がオフになっていない限り、独自の埋め込みスタイルを使用します。ビットマップ字幕 (PGS、DVB、VobSub) のスタイルを変更することはできません。';

  @override
  String get defaultSubtitleLanguage => 'デフォルトの字幕言語';

  @override
  String get defaultToNoSubtitles => 'デフォルトは字幕なし';

  @override
  String get turnOffSubtitlesByDefault => 'デフォルトで字幕をオフにする';

  @override
  String get subtitleSize => '字幕サイズ';

  @override
  String get textFillColor => 'テキストの塗りつぶしの色';

  @override
  String get backgroundColor => '背景色';

  @override
  String get textStrokeColor => 'テキストのストロークの色';

  @override
  String get subtitleCustomization => '字幕のカスタマイズ';

  @override
  String get subtitleCustomizationDescription => '字幕の外観をカスタマイズする';

  @override
  String get subtitlePreviewText => '素早い茶色のキツネが怠惰な犬を飛び越える';

  @override
  String get verticalOffset => '垂直オフセット';

  @override
  String get pgsDirectPlay => 'PGS ダイレクト プレイ';

  @override
  String get directPlayPgsSubtitles => 'PGS 字幕の直接再生';

  @override
  String get assSsaDirectPlay => 'ASS/SSA ダイレクトプレイ';

  @override
  String get directPlayAssSsaSubtitles => '直接再生 ASS/SSA 字幕';

  @override
  String get white => '白';

  @override
  String get black => '黒';

  @override
  String get yellow => '黄色';

  @override
  String get green => '緑';

  @override
  String get cyan => 'シアン';

  @override
  String get red => '赤';

  @override
  String get transparent => '透明';

  @override
  String get semiTransparentBlack => '半透明ブラック';

  @override
  String get global => 'グローバル';

  @override
  String get desktop => 'デスクトップ';

  @override
  String get mobile => '携帯';

  @override
  String get tv => 'テレビ';

  @override
  String loadedProfileSettings(String profile) {
    return 'Loaded $profile profile settings.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Failed to load $profile profile settings.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Synced local settings to $profile profile.';
  }

  @override
  String get customizationProfile => 'カスタマイズプロファイル';

  @override
  String get customizationProfileDescription =>
      'ロード、編集、同期するプロファイルを選択します。グローバルは、デバイス プロファイルでオーバーライドされない限り、どこにでも適用されます。緑色の点は、現在のデバイス プロファイルを示します。';

  @override
  String get loadProfile => 'プロファイルをロードする';

  @override
  String get syncing => '同期中...';

  @override
  String get syncToProfile => 'プロファイルに同期';

  @override
  String get profileSyncHidden => 'プロファイル同期非表示';

  @override
  String get enablePluginSyncDescription =>
      'ここにプロファイル コントロールを表示するには、プラグイン設定でサーバー プラグイン同期を有効にします。';

  @override
  String get quality => '品質';

  @override
  String get defaultDownloadQuality => 'デフォルトのダウンロード品質';

  @override
  String get network => 'ネットワーク';

  @override
  String get wifiOnlyDownloads => 'WiFi のみのダウンロード';

  @override
  String get onlyDownloadOnWifi => 'WiFiに接続している場合のみダウンロードする';

  @override
  String get storage => 'ストレージ';

  @override
  String get storageUsed => '使用済みストレージ';

  @override
  String get manage => '管理';

  @override
  String get calculating => '計算中...';

  @override
  String get downloadLocation => 'ダウンロード場所';

  @override
  String get defaultLabel => 'デフォルト';

  @override
  String get saveToDownloadsFolder => 'ダウンロードフォルダーに保存';

  @override
  String get downloadsVisibleToOtherApps => 'ダウンロード/Moonfin — 他のアプリに表示されます';

  @override
  String get dangerZone => '危険地帯';

  @override
  String get clearAllDownloads => 'すべてのダウンロードをクリア';

  @override
  String get original => 'オリジナル';

  @override
  String get changeDownloadLocation => 'ダウンロード場所の変更';

  @override
  String get changeDownloadLocationDescription =>
      '新しいダウンロードは、選択したフォルダーに保存されます。既存のダウンロードは現在の場所に残り、ストレージ設定から管理できます。';

  @override
  String get confirm => '確認する';

  @override
  String get cannotWriteToFolder =>
      '選択したフォルダーに書き込めません。別の場所を選択するか、ストレージ権限を付与してください。';

  @override
  String get saveToDownloadsFolderQuestion => 'ダウンロードフォルダーに保存しますか?';

  @override
  String get saveToDownloadsFolderDescription =>
      'ダウンロードしたメディアは、デバイスの Downloads/Moonfin に保存されます。これらのファイルは、ギャラリーや音楽プレーヤーなどの他のアプリに表示されます。\n\n既存のダウンロードは現在の場所に残ります。';

  @override
  String get enable => '有効にする';

  @override
  String get clearAllDownloadsWarning =>
      'これにより、ダウンロードしたメディアがすべて削除され、元に戻すことはできません。';

  @override
  String get clearAll => 'すべてクリア';

  @override
  String get navigationStyle => 'ナビゲーションスタイル';

  @override
  String get topBar => 'トップバー';

  @override
  String get leftSidebar => '左側のサイドバー';

  @override
  String get showShuffleButton => 'シャッフルボタンを表示';

  @override
  String get showGenresButton => 'ジャンルボタンを表示';

  @override
  String get showFavoritesButton => 'お気に入りボタンを表示';

  @override
  String get showLibrariesInToolbar => 'ツールバーにライブラリを表示';

  @override
  String get navbarOpacity => 'ナビゲーションバーの不透明度';

  @override
  String get navbarColor => 'ナビゲーションバーの色';

  @override
  String get gray => 'グレー';

  @override
  String get darkBlue => 'ダークブルー';

  @override
  String get purple => '紫';

  @override
  String get teal => 'ティール';

  @override
  String get navy => '海軍';

  @override
  String get charcoal => '木炭';

  @override
  String get brown => '茶色';

  @override
  String get darkRed => 'ダークレッド';

  @override
  String get darkGreen => 'ダークグリーン';

  @override
  String get slate => 'スレート';

  @override
  String get indigo => 'インジゴ';

  @override
  String get libraryDisplay => 'ライブラリーの展示';

  @override
  String get posterLabel => 'ポスター';

  @override
  String get thumbnailLabel => 'サムネイル';

  @override
  String get bannerLabel => 'バナー';

  @override
  String get overridePerLibrarySettings => 'ライブラリごとの設定を上書きする';

  @override
  String get applyImageTypeToAllLibraries => '画像タイプをすべてのライブラリに適用する';

  @override
  String get multiServerLibraries => 'マルチサーバーライブラリ';

  @override
  String get showLibrariesFromAllServers => '接続されているすべてのサーバーのライブラリを表示する';

  @override
  String get enableFolderView => 'フォルダービューを有効にする';

  @override
  String get showFolderBrowsingOption => 'フォルダー参照オプションを表示する';

  @override
  String get libraryVisibility => 'ライブラリの可視性';

  @override
  String get libraryVisibilityDescription =>
      'ライブラリごとにホームページの表示を切り替えます。変更を有効にするには、Moonfin を再起動します。';

  @override
  String get showInNavigation => 'ナビゲーションに表示';

  @override
  String get showInLatestMedia => '最新メディアに出演';

  @override
  String get sourceLibraries => 'ソースライブラリ';

  @override
  String get sourceCollections => 'ソースコレクション';

  @override
  String get excludedGenres => '除外ジャンル';

  @override
  String get selectAll => 'すべて選択';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => 'メディアバー';

  @override
  String get mediaSources => 'メディアソース';

  @override
  String get behavior => '行動';

  @override
  String get seconds => '秒';

  @override
  String get localPreviews => 'ローカルプレビュー';

  @override
  String get localPreviewsDescription => 'トレーラー、メディア、オーディオのプレビューを構成します。';

  @override
  String get mediaBarMode => 'メディアバーのスタイル';

  @override
  String get mediaBarModeDescription =>
      'Moonfin、MakD のいずれかを選択するか、メディア バーをオフにする';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'マクド';

  @override
  String get mediaBarModeOff => 'オフ';

  @override
  String get enableMediaBar => 'メディアバーを有効にする';

  @override
  String get showFeaturedContentSlideshow => '注目のコンテンツのスライドショーをホームに表示する';

  @override
  String get contentType => 'コンテンツタイプ';

  @override
  String get moviesAndTvShows => '映画とテレビ番組';

  @override
  String get moviesOnly => '映画のみ';

  @override
  String get tvShowsOnly => 'テレビ番組のみ';

  @override
  String get itemCount => 'アイテム数';

  @override
  String get noneSelected => '何も選択されていません';

  @override
  String get noneExcluded => '除外されるものはありません';

  @override
  String get autoAdvance => 'オートアドバンス';

  @override
  String get autoAdvanceSlides => '自動的に次のスライドに進みます';

  @override
  String get autoAdvanceInterval => '自動進行間隔';

  @override
  String get trailerPreview => 'トレーラープレビュー';

  @override
  String get autoPlayTrailers => '3 秒後にメディア バーでトレーラーを自動再生します';

  @override
  String get episodePreview => 'エピソードのプレビュー';

  @override
  String get mediaPreview => 'メディアプレビュー';

  @override
  String get episodePreviewDescription =>
      'フォーカス、ホバー、または長押しされたカードで 30 秒のインライン プレビューを再生します';

  @override
  String get mediaPreviewDescription =>
      'フォーカス、ホバー、または長押しされたカードで 30 秒のインライン プレビューを再生します';

  @override
  String get previewAudio => 'オーディオをプレビューする';

  @override
  String get enablePreviewAudio => 'トレーラーとエピソードのプレビューの音声を有効にする';

  @override
  String get latestMedia => '最新メディア';

  @override
  String get recentlyReleased => '最近リリースされた';

  @override
  String get myMedia => '私のメディア';

  @override
  String get myMediaSmall => 'マイメディア（小）';

  @override
  String get continueWatching => '視聴を続ける';

  @override
  String get resumeAudio => 'オーディオを再開する';

  @override
  String get resumeBooks => '履歴書';

  @override
  String get activeRecordings => 'アクティブな録音';

  @override
  String get playlists => 'プレイリスト';

  @override
  String get liveTV => 'ライブテレビ';

  @override
  String get homeSections => 'ホームセクション';

  @override
  String get resetToDefaults => 'デフォルトにリセットする';

  @override
  String get homeRowPosterSize => 'ホーム列ポスターのサイズ';

  @override
  String get perRowImageTypeSelection => '行ごとの画像タイプの選択';

  @override
  String get configureImageTypeForEachRow => '有効なホーム行ごとに画像タイプを構成する';

  @override
  String get mergeContinueWatchingAndNextUp => '「継続視聴」と「次へ」を結合';

  @override
  String get combineBothRows => '両方の行を 1 つのホーム セクションに結合します';

  @override
  String get perRowImageType => '行ごとの画像タイプ';

  @override
  String get perRowSettings => '行ごとの設定';

  @override
  String get autoLogin => '自動ログイン';

  @override
  String get lastUser => '最後のユーザー';

  @override
  String get specificUser => '特定のユーザー';

  @override
  String get alwaysAuthenticate => '常に認証する';

  @override
  String get requirePasswordWithToken => 'トークンが保存されている場合でもパスワードを要求する';

  @override
  String get confirmExit => '終了の確認';

  @override
  String get showConfirmationBeforeExiting => '終了する前に確認を表示する';

  @override
  String get blockContentWithRatings => '次の評価を持つコンテンツをブロックします。';

  @override
  String get noContentRatingsFound => 'このサーバーにはコンテンツ レーティングがまだ見つかりません。';

  @override
  String get couldNotLoadServerRatings => 'サーバー評価を読み込めませんでした。保存された評価のみを表示します。';

  @override
  String get couldNotRefreshRatings => 'サーバーからの評価を更新できませんでした。保存された評価を表示しています。';

  @override
  String get enablePinCode => 'PINコードを有効にする';

  @override
  String get requirePinToAccess => 'アカウントにアクセスするには PIN が必要です';

  @override
  String get changePin => 'PINの変更';

  @override
  String get setNewPinCode => '新しいPINコードを設定する';

  @override
  String get removePin => 'PIN を削除する';

  @override
  String get removePinProtection => 'PINコード保護を解除する';

  @override
  String get screensaver => 'スクリーンセーバー';

  @override
  String get inAppScreensaver => 'アプリ内スクリーンセーバー';

  @override
  String get enableBuiltInScreensaver => '内蔵スクリーンセーバーを有効にする';

  @override
  String get mode => 'モード';

  @override
  String get libraryArt => 'ライブラリアート';

  @override
  String get logo => 'ロゴ';

  @override
  String get clock => 'クロック';

  @override
  String get timeout => 'タイムアウト';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => '調光レベル';

  @override
  String get maxAgeRating => '最大年齢評価';

  @override
  String get any => 'どれでも';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => '年齢制限が必要';

  @override
  String get onlyShowRatedContent => '評価されたコンテンツのみを表示する';

  @override
  String get showClock => '時計を表示する';

  @override
  String get displayClockDuringScreensaver => 'スクリーンセーバー中に時計を表示する';

  @override
  String get rottenTomatoesCritics => 'ロッテン・トマト (批評家)';

  @override
  String get rottenTomatoesAudience => 'ロッテン・トマト（観客）';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'メタクリティック';

  @override
  String get metacriticUser => 'Metacritic (ユーザー)';

  @override
  String get trakt => 'トラクト';

  @override
  String get letterboxd => 'レターボックスd';

  @override
  String get myAnimeList => '私のアニメリスト';

  @override
  String get aniList => 'アニリスト';

  @override
  String get communityRating => 'コミュニティ評価';

  @override
  String get ratings => '評価';

  @override
  String get additionalRatings => '追加の評価';

  @override
  String get showMdbListAndTmdbRatings => 'MDBList と TMDB の評価を表示する';

  @override
  String get ratingLabels => '評価ラベル';

  @override
  String get showLabelsNextToIcons => '評価アイコンの横にラベルを表示する';

  @override
  String get ratingBadges => '評価バッジ';

  @override
  String get showDecorativeBadges => '評価の後ろに装飾バッジを表示する';

  @override
  String get episodeRatings => 'エピソードの評価';

  @override
  String get showRatingsOnEpisodes => '個々のエピソードの評価を表示する';

  @override
  String get ratingSources => '評価ソース';

  @override
  String get ratingSourcesDescription => 'アプリ全体に表示される評価ソースを有効にして並べ替える';

  @override
  String get pluginLabel => 'プラグイン';

  @override
  String get pluginDetected => 'プラグインが検出されました';

  @override
  String get pluginNotDetected => 'プラグインが検出されない';

  @override
  String get pluginDetectedDescription =>
      'サーバープラグインが検出されました。同期は、プラグインが初めて見つかったときに自動的に有効になります。';

  @override
  String get pluginNotDetectedDescription =>
      'サーバープラグインは現在検出されません。ローカル設定では、保存された値または組み込みのデフォルトが引き続き使用されます。';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => '利用可能なサービス';

  @override
  String get serverPluginSync => 'サーバープラグインの同期';

  @override
  String get syncSettingsWithPlugin => 'サーバープラグインと設定を同期する';

  @override
  String get whatSyncControls => '同期制御の内容';

  @override
  String get syncControlsDescription =>
      '同期は、プラグインに基づく設定をサーバーにプッシュまたはサーバーからプルするかどうかのみを制御します。プラグインの同期が有効になっている場合、プロファイルの選択とプロファイルの同期アクションはカスタマイズ設定にあります。';

  @override
  String get recentRequests => '最近のリクエスト';

  @override
  String get recentlyAdded => '最近追加された';

  @override
  String get trending => 'トレンド';

  @override
  String get popularMovies => '人気の映画';

  @override
  String get movieGenres => '映画のジャンル';

  @override
  String get upcomingMovies => '今後の映画';

  @override
  String get studios => 'スタジオ';

  @override
  String get popularSeries => '人気シリーズ';

  @override
  String get seriesGenres => 'シリーズのジャンル';

  @override
  String get upcomingSeries => '今後のシリーズ';

  @override
  String get networks => 'ネットワーク';

  @override
  String get resetRowsToDefaults => '行をデフォルトにリセットする';

  @override
  String get enableSeerr => 'Seer を有効にする';

  @override
  String get showSeerrInNavigation => 'ナビゲーションに Seerr を表示 (サーバープラグインが必要)';

  @override
  String get seerrUnavailable => 'サーバー プラグイン Seerr サポートが無効になっているため、使用できません。';

  @override
  String get nsfwFilter => 'NSFWフィルター';

  @override
  String get hideAdultContent => '結果内のアダルト コンテンツを非表示にする';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => '行の発見';

  @override
  String get discoverRowsDescriptionPlugin =>
      'ドラッグして並べ替えます。行を有効または無効にします。 Moonfin プラグインとの行順序の同期が有効になりました。';

  @override
  String get discoverRowsDescription => 'ドラッグして並べ替えます。行を有効または無効にします。';

  @override
  String get enabled => '有効';

  @override
  String get hidden => '隠れた';

  @override
  String get aboutTitle => 'について';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'オープンソースライセンス';

  @override
  String get sourceCode => 'ソースコード';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => '今すぐアップデートをチェックしてください';

  @override
  String get checksLatestDesktopRelease => 'このプラットフォームの最新のデスクトップ リリースを確認します';

  @override
  String get youAreUpToDate => '最新情報を入手できます。';

  @override
  String get couldNotCheckForUpdates => '現在アップデートを確認できませんでした。';

  @override
  String get noCompatibleUpdate => 'このプラットフォームと互換性のある更新パッケージが見つかりません。';

  @override
  String get updateChecksNotSupported => 'このプラットフォームでは更新チェックはサポートされていません。';

  @override
  String get updateNotificationsDisabled => '更新通知は無効になっています。';

  @override
  String get pleaseWaitBeforeChecking => '再度確認する前にお待ちください。';

  @override
  String get latestUpdateAlreadyShown => '最新のアップデートがすでに表示されていました。';

  @override
  String get updateAvailable => 'アップデートが利用可能です。';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'アップデート通知';

  @override
  String get showWhenUpdatesAvailable => 'アップデートが利用可能になったときに表示する';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => 'リリースノートを読む';

  @override
  String get downloadingUpdate => 'アップデートをダウンロード中...';

  @override
  String get updateDownloadFailed => 'アップデートのダウンロードに失敗しました。もう一度試してください。';

  @override
  String get openReleasesPage => 'リリースページを開く';

  @override
  String get navigation => 'ナビゲーション';

  @override
  String get watchedIndicatorsBackdrops => '監視されているインジケーター、背景';

  @override
  String get focusColorWatchedIndicatorsBackdrops => 'フォーカスカラー、注目のインジケーター、背景';

  @override
  String get navbarStyleToolbarAppearance => 'Navbar スタイル、ツールバー ボタン、外観';

  @override
  String get reorderToggleHomeRows => 'ホーム行の並べ替えと切り替え';

  @override
  String get featuredContentAppearance => '注目の内容・外観';

  @override
  String get posterSizeImageTypeFolderView => 'ポスターサイズ、画像タイプ、フォルダービュー';

  @override
  String get mdbListTmdbRatingSources => 'MDBList、TMDB、および評価ソース';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'クリア';

  @override
  String get browse => 'ブラウズ';

  @override
  String get noResults => '結果はありません';

  @override
  String get seerrAvailableStatus => '利用可能';

  @override
  String get seerrRequestedStatus => 'リクエスト済み';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'シーラー設定';

  @override
  String get requestMore => 'さらにリクエスト';

  @override
  String get request => 'リクエスト';

  @override
  String get cancelRequest => 'キャンセルリクエスト';

  @override
  String get playInMoonfin => 'Moonfin でプレイする';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => '承認する';

  @override
  String get declineAction => '衰退';

  @override
  String get similar => '似ている';

  @override
  String get recommendations => '推奨事項';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => '保つ';

  @override
  String get itemNotFoundInLibrary => 'Moonfin ライブラリにアイテムが見つかりません';

  @override
  String get errorSearchingLibrary => 'ライブラリ検索エラー';

  @override
  String budgetAmount(String amount) {
    return 'Budget: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Revenue: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Request $type';
  }

  @override
  String get submitRequest => 'リクエストの送信';

  @override
  String get allSeasons => 'オールシーズン';

  @override
  String get advancedOptions => '詳細オプション';

  @override
  String get noServiceServersConfigured => 'サービスサーバーが構成されていません';

  @override
  String get server => 'サーバ';

  @override
  String get qualityProfile => '品質プロファイル';

  @override
  String get rootFolder => 'ルートフォルダー';

  @override
  String get showMore => 'もっと見る';

  @override
  String get appearances => '出演';

  @override
  String get crewSection => 'クルー';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => 'リクエストはありません';

  @override
  String get pendingStatus => '保留中';

  @override
  String get declinedStatus => '拒否されました';

  @override
  String get partiallyAvailable => '一部利用可能';

  @override
  String get downloadingStatus => 'ダウンロード中';

  @override
  String get approvedStatus => '承認された';

  @override
  String get notRequestedStatus => '要求されていません';

  @override
  String get blocklistedStatus => 'ブロックリストに登録されました';

  @override
  String get deletedStatus => '削除されました';

  @override
  String get tmdbScore => 'TMDBスコア';

  @override
  String get releaseDateLabel => '発売日';

  @override
  String get firstAirDateLabel => '初放送日';

  @override
  String get revenueLabel => '収益';

  @override
  String get runtimeLabel => 'ランタイム';

  @override
  String get budgetLabel => '予算';

  @override
  String get originalLanguageLabel => '元の言語';

  @override
  String get seasonsLabel => '季節';

  @override
  String get episodesLabel => 'エピソード';

  @override
  String get access => 'アクセス';

  @override
  String get add => '追加';

  @override
  String get address => '住所';

  @override
  String get analytics => '分析';

  @override
  String get catalog => 'カタログ';

  @override
  String get content => 'コンテンツ';

  @override
  String get copy => 'コピー';

  @override
  String get create => '作成する';

  @override
  String get disable => '無効にする';

  @override
  String get done => '終わり';

  @override
  String get edit => '編集';

  @override
  String get encoding => 'エンコーディング';

  @override
  String get error => 'エラー';

  @override
  String get forward => 'フォワード';

  @override
  String get general => '一般的な';

  @override
  String get go => '行く';

  @override
  String get install => 'インストール';

  @override
  String get installed => 'インストール済み';

  @override
  String get interval => '間隔';

  @override
  String get name => '名前';

  @override
  String get networking => 'ネットワーキング';

  @override
  String get next => '次';

  @override
  String get path => 'パス';

  @override
  String get paused => '一時停止中';

  @override
  String get permissions => '権限';

  @override
  String get processing => '処理';

  @override
  String get profile => 'プロフィール';

  @override
  String get provider => 'プロバイダー';

  @override
  String get refresh => 'リフレッシュ';

  @override
  String get remote => 'リモート';

  @override
  String get rename => '名前の変更';

  @override
  String get revoke => '取り消す';

  @override
  String get role => '役割';

  @override
  String get root => '根';

  @override
  String get run => '走る';

  @override
  String get search => '検索';

  @override
  String get select => '選択';

  @override
  String get send => '送信';

  @override
  String get sessions => 'セッション';

  @override
  String get set => 'セット';

  @override
  String get status => '状態';

  @override
  String get stop => '停止';

  @override
  String get streaming => 'ストリーミング';

  @override
  String get time => '時間';

  @override
  String get trickplay => 'トリックプレイ';

  @override
  String get uninstall => 'アンインストール';

  @override
  String get up => '上';

  @override
  String get update => 'アップデート';

  @override
  String get upload => 'アップロード';

  @override
  String get unmute => 'ミュートを解除する';

  @override
  String get mute => 'ミュート';

  @override
  String get branding => 'ブランディング';

  @override
  String get adminDrawerDashboard => 'ダッシュボード';

  @override
  String get adminDrawerAnalytics => '分析';

  @override
  String get adminDrawerSettings => '設定';

  @override
  String get adminDrawerBranding => 'ブランディング';

  @override
  String get adminDrawerUsers => 'ユーザー';

  @override
  String get adminDrawerLibraries => '図書館';

  @override
  String get adminDrawerTranscoding => 'トランスコーディング';

  @override
  String get adminDrawerResume => '再開する';

  @override
  String get adminDrawerStreaming => 'ストリーミング';

  @override
  String get adminDrawerTrickplay => 'トリックプレイ';

  @override
  String get adminDrawerDevices => 'デバイス';

  @override
  String get adminDrawerActivity => '活動';

  @override
  String get adminDrawerNetworking => 'ネットワーキング';

  @override
  String get adminDrawerApiKeys => 'APIキー';

  @override
  String get adminDrawerBackups => 'バックアップ';

  @override
  String get adminDrawerLogs => 'ログ';

  @override
  String get adminDrawerScheduledTasks => 'スケジュールされたタスク';

  @override
  String get adminDrawerPlugins => 'プラグイン';

  @override
  String get adminDrawerRepositories => 'リポジトリ';

  @override
  String get adminDrawerLiveTv => 'ライブテレビ';

  @override
  String get adminExitTooltip => '管理者を終了する';

  @override
  String get adminDashboardLoadFailed => 'ダッシュボードの読み込みに失敗しました';

  @override
  String get adminMediaOverview => 'メディア概要';

  @override
  String get adminMediaTotalsError => 'サーバーメディアの合計をロードできませんでした。';

  @override
  String get adminMediaOverviewSubtitle =>
      'このサーバー上にどれだけのコンテンツがあるかについて簡単に説明します。';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Plugin updates available: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Plugins requiring restart: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Failed scheduled tasks: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Recent warning/error entries: $count';
  }

  @override
  String get analyticsMediaDistribution => 'メディア配信';

  @override
  String get analyticsVideoCodecs => 'ビデオコーデック';

  @override
  String get analyticsAudioCodecs => 'オーディオコーデック';

  @override
  String get analyticsContainers => 'コンテナ';

  @override
  String get analyticsTopGenres => '人気のジャンル';

  @override
  String get analyticsReleaseYears => '発売年';

  @override
  String get analyticsContentRatings => 'コンテンツのレーティング';

  @override
  String get analyticsRuntimeBuckets => 'ランタイムバケット';

  @override
  String get analyticsFileFormats => 'ファイル形式';

  @override
  String get analyticsNoData => '利用可能なデータがありません。';

  @override
  String get adminServerInfo => 'サーバー情報';

  @override
  String get adminRestartPending => '再起動保留中';

  @override
  String get adminServerPaths => 'サーバーパス';

  @override
  String get adminServerActions => 'サーバーアクション';

  @override
  String get adminRestartServer => 'サーバーを再起動します';

  @override
  String get adminShutdownServer => 'サーバーをシャットダウンする';

  @override
  String get adminScanLibraries => 'スキャンライブラリ';

  @override
  String get adminLibraryScanStarted => 'ライブラリのスキャンが開始されました';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress => 'サーバーの再起動が進行中です';

  @override
  String get adminServerRebootMessage => 'サーバーの再起動が進行中です。Moonfin を再起動してください。';

  @override
  String get adminActiveSessions => 'アクティブなセッション';

  @override
  String get adminSessionsLoadFailed => 'セッションのロードに失敗しました';

  @override
  String get adminNoActiveSessions => 'アクティブなセッションはありません';

  @override
  String get adminRecentActivity => '最近の活動';

  @override
  String get adminNoRecentActivity => '最近のアクティビティはありません';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => 'メッセージを送信する';

  @override
  String get adminMessageTextHint => 'メッセージテキスト';

  @override
  String get adminSetVolume => '音量を設定する';

  @override
  String get sessionPrev => '前へ';

  @override
  String get sessionRewind => '巻き戻し';

  @override
  String get sessionForward => 'フォワード';

  @override
  String get sessionNext => '次';

  @override
  String get sessionVolumeDown => 'Vol –';

  @override
  String get sessionVolumeUp => '巻+';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'プレイ中';

  @override
  String get volume => '音量';

  @override
  String get actions => 'アクション';

  @override
  String get videoCodec => 'ビデオコーデック';

  @override
  String get audioCodec => 'オーディオコーデック';

  @override
  String get hwAccel => 'ハードウェアアクセル';

  @override
  String get completion => '完了';

  @override
  String get direct => '直接';

  @override
  String get adminDisconnect => '切断する';

  @override
  String get adminClearDates => '日付を明確にする';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => 'アクティビティのエントリはありません';

  @override
  String get adminEditDeviceName => 'デバイス名の編集';

  @override
  String get adminCustomName => 'カスタム名';

  @override
  String get adminDeviceNameUpdated => 'デバイス名が更新されました';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'デバイスの削除';

  @override
  String get adminDeviceDeleted => 'デバイスが削除されました';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'デバイスのロードに失敗しました';

  @override
  String get adminSearchDevices => 'デバイスの検索';

  @override
  String get adminThisDevice => 'このデバイス';

  @override
  String get adminEditName => '名前の編集';

  @override
  String get adminLibrariesLoadFailed => 'ライブラリのロードに失敗しました';

  @override
  String get adminNoLibraries => 'ライブラリが構成されていません';

  @override
  String get adminScanAllLibraries => 'すべてのライブラリをスキャン';

  @override
  String get adminAddLibrary => 'ライブラリの追加';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'ライブラリ名の変更';

  @override
  String get adminNewName => '新しい名前';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'ライブラリの削除';

  @override
  String adminLibraryDeleted(String name) {
    return 'Library \"$name\" deleted';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Failed to delete library: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Failed to add path: $error';
  }

  @override
  String get adminRemovePath => 'パスの削除';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'ライブラリオプションが保存されました';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'ライブラリのロードに失敗しました';

  @override
  String get adminNoMediaPaths => 'メディアパスが構成されていません';

  @override
  String get adminAddPath => 'パスの追加';

  @override
  String get adminBrowseFilesystem => 'サーバー ファイル システムを参照します。';

  @override
  String get adminSaveOptions => '保存オプション';

  @override
  String get adminPreferredMetadataLanguage => '優先されるメタデータ言語';

  @override
  String get adminMetadataLanguageHint => '例えば英語、ドイツ語、フランス語';

  @override
  String get adminMetadataCountryCode => 'メタデータの国コード';

  @override
  String get adminMetadataCountryHint => '例えば米国、ドイツ、フランス';

  @override
  String get adminLibraryNameRequired => 'ライブラリ名は必須です';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => '図書館名';

  @override
  String get adminSelectedPaths => '選択されたパス:';

  @override
  String get adminNoPathsAdded => 'パスは追加されていません (後で追加できます)';

  @override
  String get adminCreateLibrary => 'ライブラリの作成';

  @override
  String get paths => 'パス:';

  @override
  String get adminDisableUser => 'ユーザーを無効にする';

  @override
  String get adminEnableUser => 'ユーザーを有効にする';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Disable $name? They will not be able to sign in.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Enable $name? They will be able to sign in again.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'User \"$name\" disabled';
  }

  @override
  String adminUserEnabled(String name) {
    return 'User \"$name\" enabled';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Failed to update user policy: $error';
  }

  @override
  String get adminUsersLoadFailed => 'ユーザーのロードに失敗しました';

  @override
  String get adminSearchUsers => 'ユーザーを検索する';

  @override
  String get adminEditUser => 'ユーザーの編集';

  @override
  String get adminAddUser => 'ユーザーの追加';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'ユーザーの作成';

  @override
  String get adminPasswordOptional => 'パスワード (オプション)';

  @override
  String get adminUsernameRequired => 'ユーザー名を空にすることはできません';

  @override
  String get adminNoProfileChanges => '保存するプロファイルの変更はありません';

  @override
  String get adminProfileSaved => 'プロファイルが保存されました';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => '権限が保存されました';

  @override
  String get adminPasswordsMismatch => 'パスワードが一致しません';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'ユーザーのロードに失敗しました';

  @override
  String get adminBackToUsers => 'ユーザーに戻る';

  @override
  String get adminSaveProfile => 'プロファイルの保存';

  @override
  String get adminDeleteUser => 'ユーザーの削除';

  @override
  String get admin => '管理者';

  @override
  String get adminFullAccessWarning => '管理者はサーバーに完全にアクセスできます。慎重に付与してください。';

  @override
  String get administrator => '管理者';

  @override
  String get adminHiddenUser => '非表示のユーザー';

  @override
  String get adminAllowMediaPlayback => 'メディアの再生を許可する';

  @override
  String get adminAllowAudioTranscoding => 'オーディオのトランスコーディングを許可する';

  @override
  String get adminAllowVideoTranscoding => 'ビデオのトランスコーディングを許可する';

  @override
  String get adminAllowRemuxing => '再多重化を許可する';

  @override
  String get adminForceRemoteTranscoding => 'リモートソースのトランスコーディングを強制する';

  @override
  String get adminAllowContentDeletion => 'コンテンツの削除を許可する';

  @override
  String get adminAllowContentDownloading => 'コンテンツのダウンロードを許可する';

  @override
  String get adminAllowPublicSharing => 'パブリック共有を許可する';

  @override
  String get adminAllowRemoteControl => '他のユーザーのリモート制御を許可する';

  @override
  String get adminAllowSharedDeviceControl => '共有デバイス制御を許可する';

  @override
  String get adminAllowRemoteAccess => 'リモートアクセスを許可する';

  @override
  String get adminRemoteBitrateLimit => 'リモート クライアントのビットレート制限 (bps)';

  @override
  String get adminLeaveEmptyNoLimit => '制限を設けない場合は空のままにします';

  @override
  String get adminMaxActiveSessions => '最大アクティブセッション数';

  @override
  String get adminAllowLiveTvAccess => 'ライブ TV アクセスを許可する';

  @override
  String get adminAllowLiveTvManagement => 'ライブ TV 管理を許可する';

  @override
  String get adminAllowCollectionManagement => 'コレクション管理を許可する';

  @override
  String get adminAllowSubtitleManagement => '字幕管理を許可する';

  @override
  String get adminAllowLyricManagement => '歌詞管理を許可する';

  @override
  String get adminSavePermissions => '権限の保存';

  @override
  String get adminEnableAllLibraryAccess => 'すべてのライブラリへのアクセスを有効にする';

  @override
  String get adminSaveAccess => '保存アクセス';

  @override
  String get adminChangePassword => 'パスワードを変更する';

  @override
  String get adminNewPassword => '新しいパスワード';

  @override
  String get adminConfirmPassword => 'パスワードを認証する';

  @override
  String get adminSetPassword => 'パスワードを設定する';

  @override
  String get adminResetPassword => 'パスワードのリセット';

  @override
  String get adminPasswordReset => 'パスワードのリセット';

  @override
  String get adminPasswordUpdated => 'パスワードが更新されました';

  @override
  String get adminUserSettings => 'ユーザー設定';

  @override
  String get adminLibraryAccess => '図書館へのアクセス';

  @override
  String get adminDeviceAndChannelAccess => 'デバイスとチャネルへのアクセス';

  @override
  String get adminEnableAllDevices => 'すべてのデバイスへのアクセスを有効にする';

  @override
  String get adminEnableAllChannels => 'すべてのチャンネルへのアクセスを有効にする';

  @override
  String get adminResetPasswordWarning =>
      'これによりパスワードが削除されます。ユーザーはパスワードなしでログインできるようになります。';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Server returned HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Are you sure you want to delete $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'User \"$name\" deleted';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Failed to delete user: $error';
  }

  @override
  String get adminCreateApiKey => 'APIキーの作成';

  @override
  String get adminAppName => 'アプリ名';

  @override
  String get adminApiKeyCreated => 'APIキーが作成されました';

  @override
  String get adminApiKeyCreatedNoToken =>
      'キーが正常に作成されました。サーバーはトークンを返しませんでした。サーバーの API キーを確認します。';

  @override
  String get adminKeyCopied => 'キーがクリップボードにコピーされました';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => 'サーバー応答にキートークンがありません';

  @override
  String get adminRevokeApiKey => 'APIキーを取り消す';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'APIキーが取り消されました';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'APIキーのロードに失敗しました';

  @override
  String get adminApiKeysTitle => 'APIキー';

  @override
  String get adminCreateKey => 'キーの作成';

  @override
  String get adminNoApiKeys => 'API キーが見つかりません';

  @override
  String get adminUnknownApp => '不明なアプリ';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'バックアップを作成しています...';

  @override
  String get adminBackupCreated => 'バックアップが正常に作成されました';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing => 'サーバー応答にバックアップ パスがありません';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => '復元の確認';

  @override
  String get adminRestoringBackup => 'バックアップを復元中...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'バックアップのロードに失敗しました';

  @override
  String get adminCreateBackup => 'バックアップの作成';

  @override
  String get adminNoBackups => 'バックアップが見つかりませんでした';

  @override
  String get adminViewDetails => '詳細を見る';

  @override
  String get restore => '復元する';

  @override
  String get adminLogsLoadFailed => 'サーバーログのロードに失敗しました';

  @override
  String get adminNoLogFiles => 'ログファイルが見つかりません';

  @override
  String get adminLogCopied => 'ログをクリップボードにコピーしました';

  @override
  String get adminSaveLogFile => 'ログファイルの保存';

  @override
  String adminSavedTo(String path) {
    return 'Saved to $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Failed to save file: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Failed to load $fileName';
  }

  @override
  String get adminSearchInLog => 'ログ内検索';

  @override
  String get adminNoMatchingLines => '一致する行はありません';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'スケジュールされたタスクが見つかりません';

  @override
  String get adminNoTasksMatchFilter => '現在のフィルターに一致するタスクはありません';

  @override
  String adminTaskStartFailed(String error) {
    return 'Failed to start task: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Failed to stop task: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Failed to load task: $error';
  }

  @override
  String get adminRunNow => '今すぐ実行';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => '最後の実行';

  @override
  String get adminTriggers => 'トリガー';

  @override
  String get adminAddTrigger => 'トリガーの追加';

  @override
  String get adminNoTriggers => 'トリガーが設定されていません';

  @override
  String get adminTriggerType => 'トリガータイプ';

  @override
  String get adminTimeLimit => '制限時間（オプション）';

  @override
  String get adminNoLimit => '制限なし';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => '曜日';

  @override
  String get adminSearchPlugins => 'プラグインを検索...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'プラグインのアンインストール';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Are you sure you want to uninstall \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Failed to uninstall plugin: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Failed to install package: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Failed to install update: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Failed to load plugins: $error';
  }

  @override
  String get adminNoPluginsMatchSearch => '検索に一致するプラグインはありません';

  @override
  String get adminNoPluginsInstalled => 'プラグインがインストールされていません';

  @override
  String adminInstallUpdate(String version) {
    return 'Install update (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Failed to load catalog: $error';
  }

  @override
  String get adminNoPackagesMatchSearch => '検索に一致するパッケージはありません';

  @override
  String get adminNoPackagesAvailable => '利用可能なパッケージはありません';

  @override
  String get adminExperimentalIntegration => '実験的な統合';

  @override
  String get adminExperimentalWarning =>
      'プラグイン設定の統合はまだ実験段階です。一部の設定ページは正しく表示されない場合があります。';

  @override
  String get continueAction => '続く';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" will be removed after server restart';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Failed to uninstall: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Updating \"$name\" to v$version...';
  }

  @override
  String get adminMissingAuthToken => '設定を開けません: 認証トークンがありません。';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'プラグインが見つかりません';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => 'プラグインを有効にする';

  @override
  String get adminPluginSettingsPage => 'プラグイン設定ページ';

  @override
  String get adminRevisionHistory => '改訂履歴';

  @override
  String get adminNoChangelog => '利用可能な変更ログはありません。';

  @override
  String get adminRemoveRepository => 'リポジトリの削除';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminRepositoryNameHint => '例えばJellyfin 安定しています';

  @override
  String get adminRepositoryUrl => 'リポジトリURL';

  @override
  String get adminAddEntry => 'エントリを追加';

  @override
  String get adminInvalidUrl => '無効な URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
  }

  @override
  String get adminOpenInBrowser => 'ブラウザで開く';

  @override
  String get adminOpenExternally => '外部に開く';

  @override
  String get adminGeneralSettings => '一般設定';

  @override
  String get adminServerName => 'サーバー名';

  @override
  String get adminPreferredMetadataCountry => 'メタデータを優先する国';

  @override
  String get adminCachePath => 'キャッシュパス';

  @override
  String get adminMetadataPath => 'メタデータのパス';

  @override
  String get adminLibraryScanConcurrency => 'ライブラリスキャンの同時実行';

  @override
  String get adminParallelImageEncodingLimit => '並列画像エンコーディングの制限';

  @override
  String get adminSlowResponseThreshold => '低速応答しきい値 (ms)';

  @override
  String get adminBrandingSaved => 'ブランド設定が保存されました';

  @override
  String get adminBrandingLoadFailed => 'ブランド設定の読み込みに失敗しました';

  @override
  String get adminLoginDisclaimer => 'ログインに関する免責事項';

  @override
  String get adminLoginDisclaimerHint => 'ログインフォームの下に表示されるHTML';

  @override
  String get adminCustomCss => 'カスタムCSS';

  @override
  String get adminCustomCssHint => 'Webインターフェイスに適用されるカスタムCSS';

  @override
  String get adminEnableSplashScreen => 'スプラッシュスクリーンを有効にする';

  @override
  String get adminStreamingSaved => 'ストリーミング設定が保存されました';

  @override
  String get adminStreamingLoadFailed => 'ストリーミング設定の読み込みに失敗しました';

  @override
  String get adminStreamingDescription =>
      'リモート接続のグローバル ストリーミング ビットレート制限を設定します。';

  @override
  String get adminRemoteBitrateLimitMbps => 'リモートクライアントのビットレート制限 (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => '空のままにするか、無制限にする場合は 0 のままにします';

  @override
  String get adminPlaybackSaved => '再生設定が保存されました';

  @override
  String get adminPlaybackLoadFailed => '再生設定の読み込みに失敗しました';

  @override
  String get adminPlaybackTranscoding => '再生/トランスコーディング';

  @override
  String get adminHardwareAcceleration => 'ハードウェアアクセラレーション';

  @override
  String get adminVaapiDevice => 'VA-APIデバイス';

  @override
  String get adminEnableHardwareEncoding => 'ハードウェアエンコーディングを有効にする';

  @override
  String get adminEnableHardwareDecoding => '以下のハードウェア デコードを有効にします。';

  @override
  String get adminEncodingThreads => 'エンコードスレッド';

  @override
  String get adminAutomatic => '0 = 自動';

  @override
  String get adminTranscodingTempPath => 'トランスコーディング一時パス';

  @override
  String get adminEnableFallbackFont => 'フォールバックフォントを有効にする';

  @override
  String get adminFallbackFontPath => 'フォールバックフォントパス';

  @override
  String get adminAllowSegmentDeletion => 'セグメントの削除を許可する';

  @override
  String get adminSegmentKeepSeconds => 'セグメント保持 (秒)';

  @override
  String get adminThrottleBuffering => 'スロットルバッファリング';

  @override
  String get adminTrickplaySaved => 'トリックプレイ設定が保存されました';

  @override
  String get adminTrickplayLoadFailed => 'トリックプレイ設定のロードに失敗しました';

  @override
  String get adminEnableHardwareAcceleration => 'ハードウェアアクセラレーションを有効にする';

  @override
  String get adminEnableKeyFrameExtraction => 'キーフレームのみの抽出を有効にする';

  @override
  String get adminKeyFrameSubtitle => '高速だが精度は低い';

  @override
  String get adminScanBehavior => 'スキャン動作';

  @override
  String get adminProcessPriority => 'プロセスの優先順位';

  @override
  String get adminImageSettings => '画像設定';

  @override
  String get adminIntervalMs => '間隔 (ミリ秒)';

  @override
  String get adminCaptureFrameSubtitle => 'フレームをキャプチャする頻度';

  @override
  String get adminWidthResolutions => '幅の解像度';

  @override
  String get adminTileWidth => 'タイルの幅';

  @override
  String get adminTileHeight => 'タイルの高さ';

  @override
  String get adminQualitySubtitle => '値が低いほど品質が向上し、ファイルが大きくなります';

  @override
  String get adminProcessThreads => 'プロセススレッド';

  @override
  String get adminResumeSaved => '再開設定が保存されました';

  @override
  String get adminResumeLoadFailed => '再開設定のロードに失敗しました';

  @override
  String get adminResumeDescription => 'コンテンツを部分再生または完全再生としてマークするタイミングを構成します。';

  @override
  String get adminMinResumePercentage => '最低履歴書の割合';

  @override
  String get adminMinResumeSubtitle => '進行状況を保存するには、この割合を超えてコンテンツを再生する必要があります';

  @override
  String get adminMaxResumePercentage => '最大再開パーセンテージ';

  @override
  String get adminMaxResumeSubtitle => 'この割合を過ぎると、コンテンツは完全に再生されたとみなされます';

  @override
  String get adminMinResumeDuration => '最小再開時間 (秒)';

  @override
  String get adminMinResumeDurationSubtitle => 'これより短いアイテムは再開できません';

  @override
  String get adminMinAudiobookResume => 'オーディオブックの最小再開パーセンテージ';

  @override
  String get adminMaxAudiobookResume => 'オーディオブック再開の最大パーセンテージ';

  @override
  String get adminNetworkingSaved => 'ネットワーク設定が保存されました。サーバーの再起動が必要になる場合があります。';

  @override
  String get adminNetworkingLoadFailed => 'ネットワーク設定のロードに失敗しました';

  @override
  String get adminNetworkingWarning => 'ネットワーク設定を変更すると、サーバーの再起動が必要になる場合があります。';

  @override
  String get adminEnableRemoteAccess => 'リモートアクセスを有効にする';

  @override
  String get ports => 'ポート';

  @override
  String get adminHttpPort => 'HTTPポート';

  @override
  String get adminHttpsPort => 'HTTPSポート';

  @override
  String get adminPublicHttpsPort => 'パブリックHTTPSポート';

  @override
  String get adminBaseUrl => 'ベース URL';

  @override
  String get adminBaseUrlHint => '例えば/ジェリーフィン';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'HTTPSを有効にする';

  @override
  String get adminLocalNetwork => 'ローカルネットワーク';

  @override
  String get adminLocalNetworkAddresses => 'ローカルネットワークアドレス';

  @override
  String get adminKnownProxies => '既知のプロキシ';

  @override
  String get adminRemoteIpFilter => 'リモートIPフィルタ';

  @override
  String get adminRemoteIpFilterEntries => 'リモートIPフィルター';

  @override
  String get adminCertificatePath => '証明書のパス';

  @override
  String get whitelist => 'ホワイトリスト';

  @override
  String get blacklist => 'ブラックリスト';

  @override
  String get notSet => '未設定';

  @override
  String get adminMetadataSaved => 'メタデータが保存されました';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'メタデータを更新する';

  @override
  String get recursive => '再帰的';

  @override
  String get adminReplaceAllMetadata => 'すべてのメタデータを置き換える';

  @override
  String get adminReplaceAllImages => 'すべての画像を置き換える';

  @override
  String get adminMetadataRefreshRequested => 'メタデータの更新が要求されました';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => '遠隔地にいる人の検索';

  @override
  String get adminNoRemoteMatches => 'リモート一致が見つかりません';

  @override
  String get adminRemoteResults => 'リモート結果';

  @override
  String get adminRemoteMetadataApplied => 'リモートメタデータの適用';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'コンテンツタイプの更新';

  @override
  String get adminContentType => 'コンテンツタイプ';

  @override
  String get adminContentTypeUpdated => 'コンテンツタイプが更新されました';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed => 'メタデータエディタのロードに失敗しました';

  @override
  String get adminNoPeopleEntries => '人のエントリーはありません';

  @override
  String get adminNoExternalIds => '使用可能な外部 ID がありません';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'サポートされていない画像形式です';

  @override
  String get adminImageReadFailed => '選択した画像の読み込みに失敗しました';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType image uploaded';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Failed to upload image: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Delete $imageType image';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType image deleted';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String get adminAllProviders => 'すべてのプロバイダー';

  @override
  String get adminNoRemoteImages => 'リモートイメージが見つかりません';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'チューナーの追加';

  @override
  String get adminTunerType => 'チューナーの種類';

  @override
  String get adminTunerTypeHint => 'HDホームラン、M3U、その他';

  @override
  String get adminUrlPath => 'URL/パス';

  @override
  String get adminNameOptional => '名前 (オプション)';

  @override
  String get adminTunerAdded => 'チューナーを追加しました';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'ガイドプロバイダーの追加';

  @override
  String get adminProviderType => 'プロバイダーの種類';

  @override
  String get adminProviderTypeHint => 'スケジュールダイレクトまたは XMLTV';

  @override
  String get adminUsernameOptional => 'ユーザー名 (オプション)';

  @override
  String get adminRefreshInterval => '更新間隔 (時間)';

  @override
  String get adminProviderAdded => 'プロバイダーが追加されました';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'チューナーのリセットが要求されました';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => '録音設定';

  @override
  String get adminPrePadding => 'プリパディング (分)';

  @override
  String get adminPostPadding => 'ポストパディング (分)';

  @override
  String get adminRecordingPath => '録音パス';

  @override
  String get adminSeriesRecordingPath => 'シリーズ録画パス';

  @override
  String get adminRecordingSettingsSaved => '録音設定が保存されました';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'チャンネルマッピングの設定';

  @override
  String get adminMappingJson => 'JSONのマッピング';

  @override
  String get adminMappingJsonHint => '例: JSON ペイロードのマッピング';

  @override
  String get adminChannelMappingsUpdated => 'チャンネルマッピングが更新されました';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed => 'ライブ TV 管理の読み込みに失敗しました';

  @override
  String get adminTunerDevices => 'チューナーデバイス';

  @override
  String get adminNoTunerHosts => 'チューナー ホストが構成されていません';

  @override
  String get adminGuideProviders => 'ガイドプロバイダー';

  @override
  String get adminAddProvider => 'プロバイダーの追加';

  @override
  String get adminNoListingProviders => 'リストプロバイダーが構成されていません';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Recording path: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Series path: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Pre-padding: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Post-padding: $minutes min';
  }

  @override
  String get adminTunerDiscovery => 'チューナーディスカバリー';

  @override
  String get adminChannelMappings => 'チャンネルマッピング';

  @override
  String get adminNoDiscoveredTuners => 'まだチューナーが検出されていません';

  @override
  String get adminSettingsSaved => '設定が保存されました';

  @override
  String get adminBackupsNotAvailable => 'このサーバー ビルドではバックアップは利用できません。';

  @override
  String get adminRestoreWarning1 =>
      '復元すると、現在のサーバー データがすべてバックアップ データに置き換えられます。';

  @override
  String get adminRestoreWarning2 => '現在のサーバー設定、ユーザー、ライブラリ データは上書きされます。';

  @override
  String get adminRestoreWarning3 => '復元後、サーバーが再起動されます。';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      '復元が要求されました。サーバーを再起動すると、このセッションが切断される可能性があります。';

  @override
  String get adminBackupsTitle => 'バックアップ';

  @override
  String get adminUnknownDate => '日付不明';

  @override
  String get adminUnnamedBackup => '名前のないバックアップ';

  @override
  String get adminLiveTvNotAvailable => 'このサーバー ビルドでは、ライブ TV 管理は利用できません。';

  @override
  String get adminLiveTvTitle => 'ライブ TV 管理';

  @override
  String get adminApply => '適用する';

  @override
  String get adminNotSet => '未設定';

  @override
  String get adminReset => 'リセット';

  @override
  String get adminLogsTitle => 'サーバーログ';

  @override
  String get adminLogsNewestFirst => '新しい順';

  @override
  String get adminLogsOldestFirst => '古い順';

  @override
  String get adminLogsJustNow => 'ちょうど今';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '${minutes}m ago';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '${hours}h ago';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d ago';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Failed to load $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count matches';
  }

  @override
  String get adminLogViewerNoMatches => '一致する行はありません';

  @override
  String get adminMetadataEditorTitle => 'メタデータエディター';

  @override
  String get adminMetadataRemote => 'リモート';

  @override
  String get adminMetadataType => 'タイプ';

  @override
  String get adminMetadataDetails => '詳細';

  @override
  String get adminMetadataExternalIds => '外部ID';

  @override
  String get adminMetadataImages => '画像';

  @override
  String get adminMetadataFieldTitle => 'タイトル';

  @override
  String get adminMetadataFieldSortTitle => 'タイトルの並べ替え';

  @override
  String get adminMetadataFieldOriginalTitle => '原題';

  @override
  String get adminMetadataFieldPremiereDate => '初回放送日 (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => '終了日 (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => '製造年';

  @override
  String get adminMetadataFieldOfficialRating => '公式評価';

  @override
  String get adminMetadataFieldCommunityRating => 'コミュニティの評価';

  @override
  String get adminMetadataFieldCriticRating => '批評家の評価';

  @override
  String get adminMetadataFieldTagline => 'キャッチフレーズ';

  @override
  String get adminMetadataFieldOverview => '概要';

  @override
  String get adminMetadataGenres => 'ジャンル';

  @override
  String get adminMetadataTags => 'タグ';

  @override
  String get adminMetadataStudios => 'スタジオ';

  @override
  String get adminMetadataPeople => '人々';

  @override
  String get adminMetadataAddGenre => 'ジャンルを追加';

  @override
  String get adminMetadataAddTag => 'タグを追加';

  @override
  String get adminMetadataAddStudio => 'スタジオを追加';

  @override
  String get adminMetadataAddPerson => '人物を追加';

  @override
  String get adminMetadataEditPerson => '人物の編集';

  @override
  String get adminMetadataRole => '役割';

  @override
  String get adminMetadataImagePrimary => '主要な';

  @override
  String get adminMetadataImageBackdrop => '背景';

  @override
  String get adminMetadataImageLogo => 'ロゴ';

  @override
  String get adminMetadataImageBanner => 'バナー';

  @override
  String get adminMetadataImageThumb => '親指';

  @override
  String get adminMetadataRecursive => '再帰的';

  @override
  String get adminMetadataProvider => 'プロバイダー';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType image uploaded';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType image deleted';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminMetadataImageReadFailed => '選択した画像の読み込みに失敗しました';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Failed to upload image: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Delete $imageType image';
  }

  @override
  String get adminMetadataDeleteImageContent => 'これにより、現在の画像がアイテムから削除されます。';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => 'アップロード';

  @override
  String get adminMetadataUpdate => 'アップデート';

  @override
  String get adminMetadataRemoteImage => 'リモート画像';

  @override
  String get adminPluginsInstalled => 'インストール済み';

  @override
  String get adminPluginsCatalog => 'カタログ';

  @override
  String get adminPluginsActive => 'アクティブ';

  @override
  String get adminPluginsRestart => '再起動';

  @override
  String get adminPluginsNoSearchResults => '検索に一致するプラグインはありません';

  @override
  String get adminPluginsNoneInstalled => 'プラグインがインストールされていません';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => '利用可能なアップデート';

  @override
  String get adminPluginsPendingRemoval => '再起動後の削除保留中';

  @override
  String get adminPluginsChangesPending => '変更は再起動を保留しています';

  @override
  String get adminPluginsEnable => '有効にする';

  @override
  String get adminPluginsDisable => '無効にする';

  @override
  String get adminPluginsInstallUpdate => 'アップデートをインストールする';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults => '検索に一致するパッケージはありません';

  @override
  String get adminPluginsCatalogEmpty => '利用可能なパッケージはありません';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => '実験的な統合';

  @override
  String get adminPluginDetailExperimentalContent =>
      'プラグイン設定の統合はまだ実験段階です。一部のフィールドまたはレイアウトはまだ正しく表示されない可能性があります。';

  @override
  String get adminPluginDetailToggle404 =>
      'プラグインの切り替えに失敗しました。サーバーはこのプラグインのバージョンを見つけることができませんでした。プラグインを更新してから再試行してください。';

  @override
  String get adminPluginDetailToggleDioError =>
      'プラグインの切り替えに失敗しました。詳細についてはサーバーのログを確認してください。';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => '詳細';

  @override
  String get adminPluginDetailDeveloper => '開発者';

  @override
  String get adminPluginDetailRepository => 'リポジトリ';

  @override
  String get adminPluginDetailBundled => '同梱';

  @override
  String get adminPluginDetailEnablePlugin => 'プラグインを有効にする';

  @override
  String get adminPluginDetailRestartRequired =>
      '変更を有効にするには、サーバーを再起動する必要があります。';

  @override
  String get adminPluginDetailRemovalPending => 'このプラグインはサーバーの再起動後に削除されます。';

  @override
  String get adminPluginDetailMalfunctioned =>
      'このプラグインは誤動作しているため、正しく動作しない可能性があります。';

  @override
  String get adminPluginDetailNotSupported =>
      'このプラグインは現在のサーバー バージョンではサポートされていません。';

  @override
  String get adminPluginDetailSuperseded => 'このプラグインは新しいバージョンに置き換えられました。';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'リポジトリの削除';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => '取り除く';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => 'リポジトリが構成されていません';

  @override
  String get adminReposEmptySubtitle => 'リポジトリを追加して利用可能なプラグインを参照する';

  @override
  String get adminReposUnnamed => '(名前なし)';

  @override
  String get adminReposEditTitle => 'リポジトリの編集';

  @override
  String get adminReposAddTitle => 'リポジトリの追加';

  @override
  String get adminReposUrl => 'リポジトリURL';

  @override
  String get adminReposNameHint => '例えばJellyfin 安定しています';

  @override
  String get adminPluginSettingsInvalidUrl => '無効な URL';

  @override
  String get adminGeneralSettingsTitle => '一般設定';

  @override
  String get adminGeneralMetadataLanguage => '優先されるメタデータ言語';

  @override
  String get adminGeneralMetadataLanguageHint => '例えば英語、ドイツ語、フランス語';

  @override
  String get adminGeneralMetadataCountry => 'メタデータを優先する国';

  @override
  String get adminGeneralMetadataCountryHint => '例えば米国、ドイツ、フランス';

  @override
  String get adminGeneralLibraryScanConcurrency => 'ライブラリスキャンの同時実行';

  @override
  String get adminGeneralImageEncodingLimit => '並列画像エンコーディングの制限';

  @override
  String get adminUnknownError => '不明なエラー';

  @override
  String get adminBrowse => 'ブラウズ';

  @override
  String get adminCloseBrowser => 'ブラウザを閉じる';

  @override
  String get adminNetworkingTitle => 'ネットワーキング';

  @override
  String get adminNetworkingRestartWarning =>
      'ネットワーク設定を変更すると、サーバーの再起動が必要になる場合があります。';

  @override
  String get adminNetworkingRemoteAccess => 'リモートアクセスを有効にする';

  @override
  String get adminNetworkingPorts => 'ポート';

  @override
  String get adminNetworkingHttpPort => 'HTTPポート';

  @override
  String get adminNetworkingHttpsPort => 'HTTPSポート';

  @override
  String get adminNetworkingEnableHttps => 'HTTPSを有効にする';

  @override
  String get adminNetworkingLocalNetwork => 'ローカルネットワーク';

  @override
  String get adminNetworkingLocalAddresses => 'ローカルネットワークアドレス';

  @override
  String get adminNetworkingAddressHint => '例えば192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => '既知のプロキシ';

  @override
  String get adminNetworkingProxyHint => '例えば10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'ホワイトリスト';

  @override
  String get adminNetworkingBlacklist => 'ブラックリスト';

  @override
  String get adminNetworkingAddEntry => 'エントリを追加';

  @override
  String get adminBrandingTitle => 'ブランディング';

  @override
  String get adminBrandingLoginDisclaimer => 'ログインに関する免責事項';

  @override
  String get adminBrandingLoginDisclaimerHint => 'ログインフォームの下に表示されるHTML';

  @override
  String get adminBrandingCustomCss => 'カスタムCSS';

  @override
  String get adminBrandingCustomCssHint => 'Webインターフェイスに適用されるカスタムCSS';

  @override
  String get adminBrandingEnableSplash => 'スプラッシュスクリーンを有効にする';

  @override
  String get adminPlaybackHwAccel => 'ハードウェアアクセラレーション';

  @override
  String get adminPlaybackHwAccelLabel => 'ハードウェアアクセラレーション';

  @override
  String get adminPlaybackEnableHwEncoding => 'ハードウェアエンコーディングを有効にする';

  @override
  String get adminPlaybackEnableHwDecoding => '以下のハードウェア デコードを有効にします。';

  @override
  String get adminPlaybackEncoding => 'エンコーディング';

  @override
  String get adminPlaybackEncodingThreads => 'エンコードスレッド';

  @override
  String get adminPlaybackFallbackFont => 'フォールバックフォントを有効にする';

  @override
  String get adminPlaybackFallbackFontPath => 'フォールバックフォントパス';

  @override
  String get adminPlaybackStreaming => 'ストリーミング';

  @override
  String get adminResumeVideo => 'ビデオ';

  @override
  String get adminResumeAudiobooks => 'オーディオブック';

  @override
  String get adminResumeMinAudiobookPct => 'オーディオブックの最小再開パーセンテージ';

  @override
  String get adminResumeMaxAudiobookPct => 'オーディオブック再開の最大パーセンテージ';

  @override
  String get adminStreamingBitrateLimit => 'リモートクライアントのビットレート制限 (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint => '空のままにするか、無制限にする場合は 0 のままにします';

  @override
  String get adminTrickplayHwAccel => 'ハードウェアアクセラレーションを有効にする';

  @override
  String get adminTrickplayHwEncoding => 'ハードウェアエンコーディングを有効にする';

  @override
  String get adminTrickplayKeyFrameOnly => 'キーフレームのみの抽出を有効にする';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle => '高速だが精度は低い';

  @override
  String get adminTrickplayNonBlocking => 'ノンブロッキング';

  @override
  String get adminTrickplayBlocking => 'ブロッキング';

  @override
  String get adminTrickplayPriorityHigh => '高い';

  @override
  String get adminTrickplayPriorityAboveNormal => '正常以上';

  @override
  String get adminTrickplayPriorityNormal => '普通';

  @override
  String get adminTrickplayPriorityBelowNormal => '正常以下';

  @override
  String get adminTrickplayPriorityIdle => 'アイドル状態';

  @override
  String get adminTrickplayImageSettings => '画像設定';

  @override
  String get adminTrickplayInterval => '間隔 (ミリ秒)';

  @override
  String get adminTrickplayIntervalSubtitle => 'フレームをキャプチャする頻度';

  @override
  String get adminTrickplayWidthResolutionsHint => 'カンマ区切りのピクセル幅 (例: 320)';

  @override
  String get adminTrickplayQuality => '品質';

  @override
  String get adminTrickplayQScale => '品質スケール';

  @override
  String get adminTrickplayQScaleSubtitle => '値が低いほど品質が向上し、ファイルが大きくなります';

  @override
  String get adminTrickplayJpegQuality => 'JPEG画質';

  @override
  String get adminTrickplayProcessing => '処理';

  @override
  String get adminTasksEmpty => 'スケジュールされたタスクが見つかりません';

  @override
  String get adminTasksNoFilterMatch => '現在のフィルターに一致するタスクはありません';

  @override
  String get adminTaskCancelling => 'キャンセル中...';

  @override
  String get adminTaskRunning => '走っています...';

  @override
  String get adminTaskNeverRun => '決して走らないでください';

  @override
  String get adminTaskStop => '停止';

  @override
  String get adminTaskRun => '走る';

  @override
  String get adminTaskDetailLastExecution => '最後の実行';

  @override
  String get adminTaskDetailStarted => '開始しました';

  @override
  String get adminTaskDetailEnded => '終了しました';

  @override
  String get adminTaskDetailDuration => '間隔';

  @override
  String get adminTaskDetailErrorLabel => 'エラー：';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Daily at $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Every $day at $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Every $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'アプリケーション起動時';

  @override
  String get adminTaskTriggerTypeDaily => '毎日';

  @override
  String get adminTaskTriggerTypeWeekly => '毎週';

  @override
  String get adminTaskTriggerTypeInterval => 'インターバル中';

  @override
  String get adminTaskTriggerIntervalLabel => '間隔';

  @override
  String get adminTaskTriggerEveryHour => '1時間ごと';

  @override
  String get adminTaskTriggerEvery6Hours => '6時間ごと';

  @override
  String get adminTaskTriggerEvery12Hours => '12時間ごと';

  @override
  String get adminTaskTriggerEvery24Hours => '24時間ごと';

  @override
  String get adminTaskTriggerEvery2Days => '2日ごと';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hours',
      one: '1 hour',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => '時間';

  @override
  String get adminTaskTriggerNoLimit => '制限なし';

  @override
  String get adminActivityJustNow => 'ちょうど今';

  @override
  String get adminActivityLastHour => '過去 1 時間';

  @override
  String get adminActivityToday => '今日';

  @override
  String get adminActivityYesterday => '昨日';

  @override
  String get adminActivityOlder => '古い';

  @override
  String adminActivityDaysAgo(int days) {
    return '${days}d ago';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '${hours}h ago';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '${minutes}m ago';
  }

  @override
  String get adminActivityNow => '今';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '${minutes}m';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '${hours}h';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '${days}d';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$month/$day';
  }

  @override
  String get adminTrickplayDescription => 'シークプレビューサムネイル用のトリックプレイ画像生成を設定します。';

  @override
  String get adminNetworkingPublicHttpsPort => 'パブリックHTTPSポート';

  @override
  String get adminNetworkingBaseUrl => 'ベース URL';

  @override
  String get adminNetworkingBaseUrlHint => '例えば/ジェリーフィン';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => '証明書のパス';

  @override
  String get adminNetworkingRemoteIpFilter => 'リモートIPフィルタ';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'リモートIPフィルター';

  @override
  String get adminPlaybackVaapiDevice => 'VA-APIデバイス';

  @override
  String get adminPlaybackAutomatic => '0 = 自動';

  @override
  String get adminPlaybackTranscodeTempPath => 'トランスコーディング一時パス';

  @override
  String get adminPlaybackSegmentDeletion => 'セグメントの削除を許可する';

  @override
  String get adminPlaybackSegmentKeep => 'セグメント保持 (秒)';

  @override
  String get adminPlaybackThrottleBuffering => 'スロットルバッファリング';

  @override
  String get adminResumeMinPct => '最低履歴書の割合';

  @override
  String get adminResumeMinPctSubtitle =>
      '進行状況を保存するには、この割合を超えてコンテンツを再生する必要があります';

  @override
  String get adminResumeMaxPct => '最大再開パーセンテージ';

  @override
  String get adminResumeMaxPctSubtitle => 'この割合を過ぎると、コンテンツは完全に再生されたとみなされます';

  @override
  String get adminResumeMinDuration => '最小再開時間 (秒)';

  @override
  String get adminResumeMinDurationSubtitle => 'これより短いアイテムは再開できません';

  @override
  String get adminTrickplayScanBehavior => 'スキャン動作';

  @override
  String get adminTrickplayProcessPriority => 'プロセスの優先順位';

  @override
  String get adminTrickplayTileWidth => 'タイルの幅';

  @override
  String get adminTrickplayTileHeight => 'タイルの高さ';

  @override
  String get adminTrickplayProcessThreads => 'プロセススレッド';

  @override
  String get adminTrickplayWidthResolutions => '幅の解像度';

  @override
  String get adminMetadataDefault => 'デフォルト';

  @override
  String get adminMetadataContentTypeUpdated => 'コンテンツタイプが更新されました';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => '低速応答しきい値 (ms)';

  @override
  String get adminGeneralCachePath => 'キャッシュパス';

  @override
  String get adminGeneralMetadataPath => 'メタデータのパス';

  @override
  String get adminGeneralServerName => 'サーバー名';

  @override
  String get adminSettingsLoadFailed => '設定の読み込みに失敗しました';

  @override
  String get adminDiscover => '発見する';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => 'フォルダー';

  @override
  String get libraries => '図書館';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay が無効になりました';

  @override
  String get syncPlayDisabledMessage => '同期再生を使用するには、設定で SyncPlay を有効にします。';

  @override
  String get syncPlayServerUnsupportedTitle => 'サーバーがサポートされていません';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay には Jellyfin サーバーが必要です。現在のサーバーではサポートされていません。';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay グループ';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay グループ';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# participants',
      one: '# participant',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => '待機を無視する';

  @override
  String get syncPlayIgnoreWaitSubtitle => 'このデバイスのバッファリング中にグループを保持しないでください';

  @override
  String get syncPlayContinueLocallyNoWait => '遅いメンバーを待たずにローカルで続行';

  @override
  String get syncPlayRepeat => '繰り返す';

  @override
  String get syncPlayRepeatOne => '1つ';

  @override
  String get syncPlayShuffleModeShuffled => 'シャッフル';

  @override
  String get syncPlayShuffleModeSorted => 'ソート済み';

  @override
  String get syncPlaySyncCurrentQueue => '現在の再生キューを同期します';

  @override
  String get syncPlaySyncCurrentQueueSubtitle => 'グループキューをローカルで再生しているものに置き換えます';

  @override
  String get syncPlayLeaveGroup => 'グループを離れる';

  @override
  String get syncPlayGroupQueue => 'グループキュー';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => '今すぐプレイ';

  @override
  String get syncPlayCreateNewGroup => '新しいグループを作成する';

  @override
  String get syncPlayGroupName => 'グループ名';

  @override
  String get syncPlayDefaultGroupName => '私の SyncPlay グループ';

  @override
  String get syncPlayCreateGroup => 'グループの作成';

  @override
  String get syncPlayAvailableGroups => '利用可能なグループ';

  @override
  String get syncPlayNoGroupsAvailable => '利用可能なグループがありません';

  @override
  String get syncPlayJoinGroupQuestion => 'SyncPlay グループに参加しますか?';

  @override
  String get syncPlayJoinGroupWarning =>
      'SyncPlay グループに参加すると、現在の再生キューが置き換えられる場合があります。続く？';

  @override
  String get syncPlayJoin => '参加する';

  @override
  String get syncPlayStateIdle => 'アイドル状態';

  @override
  String get syncPlayStateWaiting => '待っている';

  @override
  String get syncPlayStatePaused => '一時停止中';

  @override
  String get syncPlayStatePlaying => '遊ぶ';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay アクセスが拒否されました';

  @override
  String get syncPlayAccessDeniedMessage =>
      'この SyncPlay グループ内の 1 つ以上の項目にアクセスできません。グループ所有者にライブラリの権限を確認するか、別のキューを選択するように依頼してください。';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable => '音声検索は利用できません。';

  @override
  String get dolbyVisionDirectPlayFailedTitle => 'Dolby Vision 直接再生に失敗しました';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'この Dolby Vision ストリームの直接再生を開始できませんでした。サーバートランスコードを使用して再試行しますか?';

  @override
  String get retryWithTranscode => 'トランスコードを使用して再試行します';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision サポートされていません';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'このデバイスは Dolby Vision コンテンツを直接デコードできません。 HDR10 フォールバックを使用するか、サーバーのトランスコーディングを要求します。';

  @override
  String get rememberMyChoice => '私の選択を覚えておいてください';

  @override
  String get playHdr10Fallback => 'HDR10 フォールバックを再生する';

  @override
  String get requestTranscode => 'トランスコードをリクエストする';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      'IAmParadox27 の「ホーム画面セクション」プラグインによって公開された行を検出します。以下で行を有効にして並べ替えることができます。';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'プラグインを報告している Jellyfin サーバーはまだありません。';

  @override
  String get kefinTweaksIntegrationDescription =>
      'ranaldsgift の「KefinTweaks」プラグインを介して構成された行を検出します。カスタム セクション、最近リリースされたセクション、再度監視されたセクション、季節限定セクション、最近ライブラリに追加されたセクションは、各 Jellyfin サーバー上の KefinTweaks 構成からミラーリングされます。';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'KefinTweaks を報告する Jellyfin サーバーはまだありません。';

  @override
  String get integrationOpenHomeSections => 'ホームセクションを開く';

  @override
  String get integrationOpenHomeSectionsSubtitle => '行の有効化、無効化、および並べ替え';

  @override
  String get integrationInstalledButDisabled => 'インストールされていますが無効になっています';

  @override
  String get integrationNotInstalled => 'インストールされていません';

  @override
  String integrationSectionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# sections',
      one: '# section',
    );
    return '$_temp0';
  }

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# rows discovered',
      one: '# row discovered',
    );
    return '$_temp0';
  }

  @override
  String get jellyseerr => 'Jellyseerr';

  @override
  String get seeAll => 'すべて見る';

  @override
  String get noItems => 'アイテムがありません';

  @override
  String get switchUser => 'ユーザーの切り替え';

  @override
  String get remoteControl => 'リモコン';

  @override
  String get mediaBarLoading => 'メディアバーを読み込み中...';

  @override
  String get mediaBarError => 'メディアバーの読み込みに失敗しました';

  @override
  String get offlineServerUnavailable => 'インターネットに接続されていますが、現在のサーバーは利用できません。';

  @override
  String get offlineNoInternet => 'あなたはオフラインです。ダウンロードコンテンツのみご利用いただけます。';

  @override
  String get offlineFileNotAvailable => 'ファイルが利用できません';

  @override
  String get offlineSwitchServer => 'スイッチサーバー';

  @override
  String get offlineSavedMedia => '保存されたメディア';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'リモート再生';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'デバイスボリューム';

  @override
  String get castVolumeUnavailable => '利用不可';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => 'オーディオ';

  @override
  String get subtitlesLabel => '字幕';

  @override
  String get pinConfirmTitle => 'PINの確認';

  @override
  String get pinSetTitle => '暗証番号を設定する';

  @override
  String get pinEnterTitle => 'PINを入力してください';

  @override
  String get pinReenterToConfirm => '確認のためPINを再入力してください';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => '間違ったPIN';

  @override
  String get pinMismatch => 'PIN が一致しません';

  @override
  String get pinForgot => 'PIN をお忘れですか?';

  @override
  String get pinClear => 'クリア';

  @override
  String get pinBackspace => 'バックスペース';

  @override
  String get quickConnectAuthorized => 'クイック接続リクエストが承認されました。';

  @override
  String get quickConnectInvalidOrExpired => 'クイック接続コードが無効か期限切れです。';

  @override
  String get quickConnectNotSupported => 'このサーバーではクイック接続がサポートされていません。';

  @override
  String get quickConnectAuthorizeFailed => 'クイック接続コードを認証できませんでした。';

  @override
  String get quickConnectDisabled => 'このサーバーではクイック接続が無効になっています。';

  @override
  String get quickConnectForbidden => 'お使いのアカウントはこのクイック接続リクエストを承認できません。';

  @override
  String get quickConnectNotFound => 'クイック接続コードが見つかりませんでした。新しいコードを試してください。';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'コードを入力してください';

  @override
  String get quickConnectAuthorize => '承認する';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => 'リモコン';

  @override
  String get remoteFailedToLoadSessions => 'セッションのロードに失敗しました';

  @override
  String get remoteNoSessions => '制御可能なセッションがありません';

  @override
  String get remoteStartPlayback => '別のデバイスで再生を開始する';

  @override
  String get unknownUser => '未知';

  @override
  String get unknownItem => '未知';

  @override
  String get remoteNothingPlaying => 'このセッションでは何も再生されていません';

  @override
  String get castingStarted => '選択したデバイスでキャストが開始されました';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices => '利用可能なリモート再生デバイスがありません。';

  @override
  String get noRemoteDevicesIos =>
      '利用可能なリモート再生デバイスがありません。\n\niOS では、AirPlay ターゲットがシミュレーターで使用できない場合があります。';

  @override
  String get trackActionPlayNext => '次にプレイ';

  @override
  String get trackActionAddToQueue => 'キューに追加';

  @override
  String get trackActionAddToPlaylist => 'プレイリストに追加';

  @override
  String get trackActionCancelDownload => 'ダウンロードのキャンセル';

  @override
  String get trackActionDeleteFromPlaylist => 'プレイリストから削除';

  @override
  String get trackActionMoveUp => '上に移動';

  @override
  String get trackActionMoveDown => '下に移動';

  @override
  String get trackActionRemoveFromFavorites => 'お気に入りから削除';

  @override
  String get trackActionAddToFavorites => 'お気に入りに追加';

  @override
  String get trackActionGoToAlbum => 'アルバムに移動';

  @override
  String get trackActionGoToArtist => 'アーティストに移動';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => 'ダウンロードしたファイルを削除しました';

  @override
  String get trackActionDeleteFileFailed => 'ダウンロードしたファイルを削除できませんでした';

  @override
  String get shuffleBy => 'シャッフルバイ';

  @override
  String get shuffleSelectLibrary => 'ライブラリの選択';

  @override
  String get shuffleSelectGenre => 'ジャンルを選択';

  @override
  String get shuffleLibrary => '図書館';

  @override
  String get shuffleGenre => 'ジャンル';

  @override
  String get shuffleNoLibraries => '利用可能な互換性のあるライブラリがありません。';

  @override
  String get shuffleNoGenres => 'このシャッフル モードに対応するジャンルは見つかりませんでした。';

  @override
  String get posterDisplayTitle => '画面';

  @override
  String get posterImageType => '画像の種類';

  @override
  String get imageTypePoster => 'ポスター';

  @override
  String get imageTypeThumbnail => 'サムネイル';

  @override
  String get imageTypeBanner => 'バナー';

  @override
  String get playlistAddFailed => 'プレイリストへの追加に失敗しました';

  @override
  String get playlistCreateFailed => 'プレイリストの作成に失敗しました';

  @override
  String get playlistNew => '新しいプレイリスト';

  @override
  String get playlistCreate => '作成する';

  @override
  String get playlistCreateNew => '新しいプレイリストを作成する';

  @override
  String get playlistNoneFound => 'プレイリストが見つかりません';

  @override
  String get addToPlaylist => 'プレイリストに追加';

  @override
  String get lyricsNotAvailable => '歌詞がありません';

  @override
  String get upNext => '次へ';

  @override
  String get playNext => '次にプレイ';

  @override
  String get stillWatchingContent => '再生が一時停止されました。まだ見ていますか？';

  @override
  String get stillWatchingStop => '停止';

  @override
  String get stillWatchingContinue => '続く';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'ライブテレビ';

  @override
  String get continueWatchingAndNextUp => '視聴を続けて次へ';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => '次のエピソード';

  @override
  String get moreFromThisSeason => '今シーズンのその他の作品';

  @override
  String get playerTooltipPlaybackSpeed => '再生速度';

  @override
  String get playerTooltipCastControls => 'キャストコントロール';

  @override
  String get playerTooltipPlaybackQuality => 'ビットレート';

  @override
  String get playerTooltipEnterFullscreen => '全画面表示に入る';

  @override
  String get playerTooltipExitFullscreen => '全画面表示を終了する';

  @override
  String get playerTooltipFloatOnTop => '上に浮く';

  @override
  String get playerTooltipExitFloatOnTop => '上部のフロートを無効にする';

  @override
  String get playerTooltipLockLandscape => 'ロックの風景';

  @override
  String get playerTooltipUnlockOrientation => '回転を許可する';

  @override
  String get playerTooltipPrevious => '前の';

  @override
  String get playerTooltipSeekBack => 'シークバック';

  @override
  String get playerTooltipSeekForward => '前を向く';

  @override
  String get contextMenuMarkWatched => '監視済みとしてマークする';

  @override
  String get contextMenuMarkUnwatched => '未視聴としてマークする';

  @override
  String get contextMenuAddToFavorites => 'お気に入りに追加';

  @override
  String get contextMenuRemoveFromFavorites => 'お気に入りから削除';

  @override
  String get contextMenuGoToSeries => 'シリーズへ';

  @override
  String get settingsAdministrationSubtitle => 'サーバー管理パネルにアクセスします';

  @override
  String get settingsAccountSecurity => 'アカウントとセキュリティ';

  @override
  String get settingsAccountSecuritySubtitle => '認証、PINコード、ペアレンタルコントロール';

  @override
  String get settingsPersonalization => 'パーソナライゼーション';

  @override
  String get settingsPersonalizationSubtitle => 'テーマ、ナビゲーション、ホーム行、ライブラリの表示設定';

  @override
  String get settingsDynamicContent => '動的コンテンツ';

  @override
  String get settingsDynamicContentSubtitle => 'メディアバーとビジュアルオーバーレイ';

  @override
  String get settingsPlaybackSyncplay => '再生と SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'オーディオ/ビデオ設定、字幕、ダウンロード、SyncPlay コントロール';

  @override
  String get settingsIntegrationsSubtitle => 'プラグインの同期、Seerr、評価など';

  @override
  String get settingsAboutSubtitle => 'アプリのバージョン、法的情報、クレジット';

  @override
  String get settingsAuthenticationSection => '認証';

  @override
  String get settingsSortServersBy => 'サーバーの並べ替え基準';

  @override
  String get settingsLastUsed => '最後に使用したもの';

  @override
  String get settingsAlphabetical => 'アルファベット順';

  @override
  String get settingsPrivacyAndSafetySection => 'プライバシーと安全性';

  @override
  String get settingsBlockedRatings => 'ブロックされた評価';

  @override
  String get settingsGeneralStyle => '一般的なスタイル';

  @override
  String get settingsGeneralStyleSubtitle => 'テーマのアクセント、背景、注目のインジケーター、テーマ音楽';

  @override
  String get settingsHomePage => 'ホームページ';

  @override
  String get settingsHomePageSubtitle => 'セクション、画像タイプ、オーバーレイ、メディア プレビュー';

  @override
  String get settingsLibrariesSubtitle => 'ライブラリの可視性、フォルダー ビュー、およびマルチサーバーの動作';

  @override
  String get settingsTwentyFourHourClock => '24時間時計';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      '時計が表示される場所では常に 24 時間形式を使用します';

  @override
  String get settingsShowShuffleButtonInNavigation => 'ナビゲーションバーにシャッフルボタンを表示する';

  @override
  String get settingsShowGenresButtonInNavigation => 'ナビゲーションバーにジャンルボタンを表示する';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'ナビゲーションバーにお気に入りボタンを表示する';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'ナビゲーション バーにライブラリ ボタンを表示する';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'ライブラリごとにホームページの表示を切り替えます。変更を有効にするには、Moonfin を再起動します。';

  @override
  String get settingsMediaBarAndLocalPreviews => 'メディアバーとローカルプレビュー';

  @override
  String get settingsVisualOverlays => 'ビジュアルオーバーレイ';

  @override
  String get settingsSeasonalSurprise => '季節のサプライズ';

  @override
  String get settingsMetadataAndRatings => 'メタデータと評価';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase は、追加の評価ソース、Seerr リクエスト、同期された設定などのサーバー側の統合を強化します。';

  @override
  String get settingsOfflineDownloads => 'オフラインダウンロード';

  @override
  String get settingsHigh => '高い';

  @override
  String get settingsLow => '低い';

  @override
  String get settingsCustomPath => 'カスタムパス';

  @override
  String get settingsEnterDownloadFolderPath => 'ダウンロードフォルダーのパスを入力してください';

  @override
  String get settingsConcurrentDownloads => '同時ダウンロード';

  @override
  String get settingsConcurrentDownloadsDescription => '一度にダウンロードするアイテムの最大数。';

  @override
  String get settingsAppInfo => 'アプリ情報';

  @override
  String get settingsReportAnIssue => '問題を報告する';

  @override
  String get settingsReportAnIssueSubtitle => 'GitHub で問題トラッカーを開きます';

  @override
  String get settingsJoinDiscord => 'Discord に参加する';

  @override
  String get settingsJoinDiscordSubtitle => 'コミュニティとチャットする';

  @override
  String get settingsJoinTheDiscord => 'Discord に参加する';

  @override
  String get settingsSupportMoonfin => 'Moonfin をサポート';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Donate a coffee to the developer';

  @override
  String get settingsLegal => '法律上の';

  @override
  String get settingsLicenses => 'ライセンス';

  @override
  String get settingsOpenSourceLicenseNotices => 'オープンソースライセンスに関する通知';

  @override
  String get settingsPrivacyPolicy => 'プライバシーポリシー';

  @override
  String get settingsPrivacyPolicySubtitle => 'Moonfin によるデータの処理方法';

  @override
  String get settingsCheckForUpdates => 'アップデートをチェックする';

  @override
  String get settingsCheckForUpdatesSubtitle => '最新の Moonfin リリースを確認してください';

  @override
  String get settingsPoweredByFlutter => 'フラッター搭載';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# license notices',
      one: '# license notice',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => '両方';

  @override
  String get settingsShuffleContentTypeFilter => 'シャッフル コンテンツ タイプ フィルター';

  @override
  String get settingsVideoPlaybackPreferences => 'ビデオ再生の設定';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'コアビデオエンジンとストリーミング品質設定';

  @override
  String get settingsAudioPreferences => 'オーディオ設定';

  @override
  String get settingsAudioPreferencesSubtitle => 'オーディオトラック、処理、およびパススルーオプション';

  @override
  String get settingsAutomationAndQueue => '自動化とキュー';

  @override
  String get settingsAutomationAndQueueSubtitle => '自動再生とシーケンス';

  @override
  String get settingsOfflineDownloadsSubtitle => 'ダウンロード品質、ストレージ制限、キューサイズ';

  @override
  String get settingsSyncplaySubtitle => 'グループセッションの同期ロジック';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      '特化したプレーヤー機能。オプションによっては再生の問題が発生する可能性があるため、使用には注意してください';

  @override
  String get settingsSkipIntrosAndOutros => 'イントロとアウトロをスキップしますか?';

  @override
  String get settingsMediaSegmentCountdown => 'Media Segment Countdown';

  @override
  String get settingsProgressBar => 'Progress Bar';

  @override
  String get settingsTimer => 'Timer';

  @override
  String get settingsNone => 'None';

  @override
  String get settingsPromptUser => 'ユーザーにプロンプ​​トを表示';

  @override
  String get settingsSkip => 'スキップ';

  @override
  String get settingsDoNothing => '何もしない';

  @override
  String get settingsMaxBitrateDescription =>
      'ストリーミングのビットレートに上限を設けます。このしきい値を超えるコンテンツは、適合するようにトランスコードされます。';

  @override
  String get settingsMaxResolutionDescription =>
      'プレーヤーが要求する最大解像度を制限します。高解像度のコンテンツはトランスコードされます。';

  @override
  String get settingsPlayerZoomDescription => '画面に合わせてビデオをどのように拡大縮小するか。';

  @override
  String get settingsPlaybackEngineAndroidTv => '再生エンジン (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Android TV デバイスのデフォルトの再生エンジンを選択します。変更は次の再生セッションに適用されます。';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (推奨)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (レガシー)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision フォールバック';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Vision デコードを行わないデバイスでの Dolby Vision タイトルの動作。';

  @override
  String get settingsAskEachTime => '毎回尋ねる';

  @override
  String get settingsPreferHdr10Fallback => 'HDR10 フォールバックを優先する';

  @override
  String get settingsPreferServerTranscode => 'サーバートランスコードを優先する';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision プロファイル 7 ダイレクト プレイ';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Dolby Vision プロファイル 7 拡張層ストリームを直接再生するかどうかを制御します。';

  @override
  String get settingsAutoAftkrtEnabled => '自動 (AFTKRT 有効)';

  @override
  String get settingsEnabledOnThisDevice => 'このデバイスで有効になっています';

  @override
  String get settingsDisabledPreferTranscode => '無効 (トランスコードを優先)';

  @override
  String get settingsResumeRewindDescription =>
      '(継続視聴またはメディア アイテム ページから) 再生を再開する場合、何秒巻き戻す必要がありますか?';

  @override
  String get settingsUnpauseRewindDescription =>
      '一時停止ボタンを押した後に再生を再開する場合、何秒戻しますか?';

  @override
  String get settingsSkipBackLengthDescription => '巻き戻しボタンを押した後に戻るまでの秒数。';

  @override
  String get settingsOneSecond => '1秒';

  @override
  String get settingsThreeSeconds => '3秒';

  @override
  String get settingsFortyFiveSeconds => '45秒';

  @override
  String get settingsSixtySeconds => '60秒';

  @override
  String get settingsSkipForwardLengthDescription => '早送りボタンを押してから何秒前にジャンプするか。';

  @override
  String get settingsBitstreamAc3ToExternalDecoder => 'ビットストリーム AC3 から外部デコーダへ';

  @override
  String get settingsCinemaMode => 'シネマモード';

  @override
  String get settingsCinemaModeSubtitle => '本編の前にトレーラー/プレロールを再生する';

  @override
  String get settingsNextUpDisplayDescription =>
      '拡張では、エピソードのアートワークと説明を含む完全なカードが表示されます。 Minimal は、コンパクトなカウントダウン オーバーレイを示します。無効にすると、プロンプトが完全に非表示になります。';

  @override
  String get settingsShort => '短い';

  @override
  String get settingsLong => '長さ';

  @override
  String get settingsVeryLong => 'とても長い';

  @override
  String get settingsVideoStartDelay => 'ビデオ開始遅延';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'ライブTVダイレクト';

  @override
  String get settingsLiveTvDirectSubtitle => 'ライブ TV の直接再生を有効にする';

  @override
  String get settingsOpenGroups => 'オープングループ';

  @override
  String get settingsOpenGroupsSubtitle => 'SyncPlay グループを作成、参加、または管理する';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay 有効';

  @override
  String get settingsSyncplayEnabledSubtitle => 'グループ監視機能を有効にする';

  @override
  String get settingsSyncplayButton => 'SyncPlay ボタン';

  @override
  String get settingsSyncplayButtonSubtitle => 'ナビゲーション バーに SyncPlay ボタンを表示します';

  @override
  String get settingsSyncplayAdvancedCorrection => '高度な補正';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle => 'きめ細かい同期ロジックを有効にする';

  @override
  String get settingsSyncplaySyncCorrection => '同期補正';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle => '同期を保つために再生を自動的に調整します';

  @override
  String get settingsSyncplaySpeedToSync => '同期までの速度';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle => '再生速度調整を使用して同期する';

  @override
  String get settingsSyncplaySkipToSync => '同期にスキップ';

  @override
  String get settingsSyncplaySkipToSyncSubtitle => 'シークを使用して同期する';

  @override
  String get settingsSyncplayMinimumSpeedDelay => '最小速度遅延';

  @override
  String get settingsSyncplayMaximumSpeedDelay => '最大速度遅延';

  @override
  String get settingsSyncplaySpeedDuration => '速度持続時間';

  @override
  String get settingsSyncplayMinimumSkipDelay => '最小スキップ遅延';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay 追加オフセット';

  @override
  String get onNow => '開催中';

  @override
  String get collections => 'コレクション';

  @override
  String get lastPlayed => '最後にプレイした時間';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Latest $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Autoplay Next Episode';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Automatically play the next episode when available.';

  @override
  String get skipSilenceTitle => 'Skip silence';

  @override
  String get skipSilenceSubtitle =>
      'Automatically skip silent audio segments when supported by the stream.';

  @override
  String get allowExternalAudioEffectsTitle => 'Allow external audio effects';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Allow equalizer and effects apps (e.g. Wavelet) to attach to Media3 playback sessions.';

  @override
  String get disableTunnelingTitle => 'Disable tunneling';

  @override
  String get disableTunnelingSubtitle =>
      'Force non-tunneled playback. Useful on devices with tunneling audio/video discontinuities.';

  @override
  String get enableTunnelingTitle => 'Enable tunneling';

  @override
  String get enableTunnelingSubtitle =>
      'Advanced. Routes audio and video through a coupled hardware path. Off by default because it causes audio/video dropouts on some devices.';

  @override
  String get mapDolbyVisionP7Title => 'Map Dolby Vision profile 7 to HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Play Dolby Vision profile 7 streams as HDR10-compatible HEVC on non-DV devices.';

  @override
  String get subtitlesUseEmbeddedStyles => 'Use embedded subtitle styles';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Apply colours, fonts, and positioning embedded in the subtitle track. Disable to use your caption style preferences instead.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Use embedded subtitle font sizes';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Apply font-size hints embedded in the subtitle track. Disable to use the subtitle size from your style preferences.';

  @override
  String get useDetailedSubHeadings => 'Use Detailed Sub-Headings';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Show detailed or minimal subrow on Library pages.';

  @override
  String get savedThemesDeleteDialogTitle => 'Delete saved theme?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Remove \"$themeName\" from this device cache?';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Deleted \"$themeName\" from this device.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Could not delete \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Saved themes';

  @override
  String get savedThemesDescription =>
      'These are themes downloaded from the Moonfin plugin for the current server. Deleting removes only this local copy.';

  @override
  String get savedThemesEmpty => 'No saved themes were found for this server.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Currently active';
  }

  @override
  String get savedThemesDeleteTooltip => 'Delete saved theme';

  @override
  String get savedThemesManageSubtitle =>
      'Manage downloaded plugin themes on this device';

  @override
  String get kefinTweaksTitle => 'KefinTweaks';

  @override
  String get homeScreenSectionsTitle => 'Home Screen Sections';

  @override
  String get themeEditor => 'Theme Editor';

  @override
  String get themeEditorSubtitle =>
      'Open the Moonfin Theme Editor in your browser';

  @override
  String get homeScreen => 'Home Screen';

  @override
  String get bottomBar => 'Bottom Bar';

  @override
  String get homeRowsStyleClassic => 'Classic';

  @override
  String get homeRowsStyleModern => 'Modern';

  @override
  String get homeRowsSection => 'Home Rows';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Classic keeps per-row image type and info overlay. Modern uses portrait-to-backdrop rows.';

  @override
  String get displayFavoritesRows => 'Display Favorites Rows';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Show Favorite Movies, Series, and other favorite rows in Home Sections.';

  @override
  String get favoritesRowSorting => 'Favorites Row Sorting';

  @override
  String get favoritesRowSortingDescription =>
      'Sort Favorites rows by date added, release date, alphabetically, and more.';

  @override
  String get displayCollectionsRows => 'Display Collections Rows';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Show Collections rows in Home Sections.';

  @override
  String get collectionsRowSorting => 'Collections Row Sorting';

  @override
  String get collectionsRowSortingDescription =>
      'Sort Collections rows by date added, release date, alphabetically, and more.';

  @override
  String get displayGenresRows => 'Display Genres Rows';

  @override
  String get displayGenresRowsSubtitle => 'Show Genres rows in Home Sections.';

  @override
  String get genresRowSorting => 'Genres Row Sorting';

  @override
  String get genresRowSortingDescription =>
      'Sort Genres rows by date added, release date, alphabetically, and more.';

  @override
  String get genresRowItems => 'Genres Row Items';

  @override
  String get genresRowItemsDescription =>
      'Show Movies, Series, or both in Genres rows.';

  @override
  String get appearance => 'Appearance';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'External player app';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Show app chooser when playback starts.';

  @override
  String get loadingInstalledPlayers => 'Loading installed players...';

  @override
  String get connection => 'Connection';

  @override
  String get audioTranscodeTarget => 'Audio Transcode Target';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Supported on this device';

  @override
  String get notSupportedOnThisDevice => 'Not Supported on this device';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) Passthrough';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Bitstream DTS:X (DTS UHD) to external decoder.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD with Atmos (JOC) Passthrough';

  @override
  String get mediaPlayerBehavior => 'Media Player Behavior';

  @override
  String get playbackEnhancements => 'Playback Enhancements';

  @override
  String get alwaysOn => 'Always on.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Replace Skip Outro with Next Up Display';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Show the Next Up overlay instead of the Skip Outro button.';

  @override
  String get playerRouting => 'Player Routing';

  @override
  String get preferSoftwareDecoders => 'Prefer software decoders';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Use FFmpeg (audio) and libgav1 (AV1) before hardware decoders. Disable if HDMI audio passthrough breaks.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Open video playback in your selected external app on Android TV.';

  @override
  String get automaticQueuing => 'Automatic Queuing';

  @override
  String get preferSdhSubtitles => 'Prefer SDH subtitles';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Prioritize SDH/CC subtitle tracks when auto-selecting.';

  @override
  String get webDiagnostics => 'Web diagnostics';

  @override
  String get webDiagnosticsTitle => 'Moonfin Web Diagnostics';

  @override
  String get webDiagnosticsIntro =>
      'Use this page to diagnose browser connectivity issues (CORS, mixed content, and discovery settings).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Detected Mixed-Content Failure';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Detected CORS/Preflight Failure';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin detected an HTTPS page trying to call an HTTP server URL. Browsers block this request before it reaches your server.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin detected a browser-level request failure that is commonly caused by missing CORS or preflight headers on the media server.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Target URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Detail: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'Current Runtime Context';

  @override
  String get webDiagnosticsOrigin => 'Origin';

  @override
  String get webDiagnosticsScheme => 'Scheme';

  @override
  String get webDiagnosticsPluginMode => 'Plugin Mode';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC Scan';

  @override
  String get webDiagnosticsForcedServerUrl => 'Forced Server URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Default Server URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'Discovery Proxy URL';

  @override
  String get notConfigured => 'not configured';

  @override
  String get webDiagnosticsMixedContent => 'Mixed Content';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'This page is loaded over HTTPS, but one or more configured URLs are HTTP. Browsers block HTTPS pages from calling HTTP APIs.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Fix: serve your media server or proxy endpoint via HTTPS, or load Moonfin over HTTP on trusted local networks only.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'No obvious mixed-content configuration detected from current runtime settings.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS Checklist';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Allow the browser origin in Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Include Authorization, X-Emby-Authorization, and X-Emby-Token in Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Expose Content-Range and Accept-Ranges for streaming and seek behavior.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Return 204 to OPTIONS preflight requests.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Example Header Snippet (nginx-style)';

  @override
  String get note => 'Note';

  @override
  String get webDiagnosticsNonWebNote =>
      'This diagnostics route is intended for web builds. If you are seeing this on another platform, these checks may not apply.';

  @override
  String get backToServerSelect => 'Back To Server Select';

  @override
  String get signOutAllUsers => 'Sign Out All Users';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Microphone permission is permanently denied. Enable it in system settings.';

  @override
  String get voiceSearchPermissionRequired =>
      'Microphone permission is required for voice search.';

  @override
  String get voiceSearchNoMatch => 'Did not catch that. Try again.';

  @override
  String get voiceSearchNoSpeechDetected => 'No speech detected.';

  @override
  String get voiceSearchMicrophoneError => 'Microphone error.';

  @override
  String get voiceSearchNeedsInternet => 'Voice search needs internet.';

  @override
  String get voiceSearchServiceBusy => 'Voice service is busy. Try again.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Microphone permission is permanently denied.';

  @override
  String get microphonePermissionDenied => 'Microphone permission is denied.';

  @override
  String get speechRecognitionUnavailable =>
      'Speech recognition is unavailable on this device.';

  @override
  String get openIosRoutePicker => 'Open iOS route picker';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay route picker is unavailable on this device.';

  @override
  String get videos => 'Videos';

  @override
  String get trailers => 'Trailers';

  @override
  String get programs => 'Programs';

  @override
  String get songs => 'Songs';

  @override
  String get photoAlbums => 'Photo Albums';

  @override
  String get photos => 'Photos';

  @override
  String get people => 'People';

  @override
  String get recentlyReleasedEpisodes => 'Recently Released Episodes';

  @override
  String get watchAgain => 'Watch Again';

  @override
  String get guestAppearances => 'Guest Appearances';

  @override
  String get appearancesSeerr => 'Appearances (Seerr)';

  @override
  String get watchWithGroup => 'Watch with group';

  @override
  String get errors => 'Errors';

  @override
  String get warnings => 'Warnings';

  @override
  String get disk => 'Disk';

  @override
  String get openInBrowser => 'Open in Browser';

  @override
  String get embeddedBrowserNotAvailable =>
      'Embedded browser is not available on this platform.';

  @override
  String get adminRestartServerConfirmation =>
      'Are you sure you want to restart the server?';

  @override
  String get adminShutdownServerConfirmation =>
      'Are you sure you want to shut down the server? You will need to restart it manually.';

  @override
  String get internal => 'Internal';

  @override
  String get idle => 'Idle';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'No users found';

  @override
  String get adminNoUsersMatchSearch => 'No users match your search';

  @override
  String get adminNoDevicesFound => 'No devices found';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'No devices match the current filters';

  @override
  String get passwordSet => 'Password set';

  @override
  String get noPasswordConfigured => 'No password configured';

  @override
  String get remoteAccess => 'Remote Access';

  @override
  String get localOnly => 'Local Only';

  @override
  String get adminMediaAnalyticsLoadFailed => 'Failed to load media analytics';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Combined analytics across all media libraries.';

  @override
  String get analyticsTopArtists => 'Top Artists';

  @override
  String get analyticsTopAuthors => 'Top Authors';

  @override
  String get analyticsTopContributors => 'Top Contributors';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Libraries',
      one: '1 Library',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'No indexed media totals are available for this selection yet.';

  @override
  String get analyticsLibraryDetails => 'Library Details';

  @override
  String get analyticsLibraryBreakdown => 'Library Breakdown';

  @override
  String get analyticsNoLibrariesAvailable => 'No libraries are available.';

  @override
  String get adminServerAdministrationTitle => 'Server Administration';

  @override
  String get adminServerPathData => 'Data';

  @override
  String get adminServerPathImageCache => 'Image Cache';

  @override
  String get adminServerPathCache => 'Cache';

  @override
  String get adminServerPathLogs => 'Logs';

  @override
  String get adminServerPathMetadata => 'Metadata';

  @override
  String get adminServerPathTranscode => 'Transcode';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'No server paths returned by this server.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% used';
  }

  @override
  String get userActivity => 'User Activity';

  @override
  String get systemEvents => 'System Events';

  @override
  String get needsAttention => 'Needs Attention';

  @override
  String get adminDrawerSectionServer => 'Server';

  @override
  String get adminDrawerSectionPlayback => 'Playback';

  @override
  String get adminDrawerSectionDevices => 'Devices';

  @override
  String get adminDrawerSectionAdvanced => 'Advanced';

  @override
  String get adminDrawerSectionPlugins => 'Plugins';

  @override
  String get adminDrawerSectionLiveTv => 'Live TV';

  @override
  String get homeVideos => 'Home Videos';

  @override
  String get mixedContent => 'Mixed Content';

  @override
  String get homeVideosAndPhotos => 'Home Videos & Photos';

  @override
  String get mixedMoviesAndShows => 'Mixed Movies & Shows';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'No recordings found';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'No image pages found inside .$extension archive.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Embedded renderer failed ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB renderer failed ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Missing local file for reader: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status while opening book data from $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'No readable book endpoint available';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Unsupported comic archive format: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'CBR extraction plugin is not available on this platform.';

  @override
  String get failedToExtractCbrArchive => 'Failed to extract .cbr archive.';

  @override
  String get cb7ExtractionUnavailable =>
      'CB7 extraction is not available on this platform.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'CB7 extraction plugin is not available on this platform.';

  @override
  String get closeGenrePanel => 'Close genre panel';

  @override
  String get loadingShuffle => 'Loading shuffle...';

  @override
  String get libraryShuffleLabel => 'LIBRARY SHUFFLE';

  @override
  String get randomShuffleLabel => 'RANDOM SHUFFLE';

  @override
  String get genresShuffleLabel => 'GENRES SHUFFLE';

  @override
  String get autoHdrSwitching => 'Auto HDR Switching';

  @override
  String get autoHdrSwitchingDescription =>
      'Automatically enable HDR for HDR video playback and restore display mode on exit.';

  @override
  String get whenFullscreen => 'When fullscreen';

  @override
  String get transcodingLimits => 'Transcoding Limits';
}
