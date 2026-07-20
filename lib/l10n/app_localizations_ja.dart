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
  String get accountPreferences => 'アカウント設定';

  @override
  String get interfaceLanguage => '表示言語';

  @override
  String get systemLanguageDefault => 'システムのデフォルト';

  @override
  String get signIn => 'サインイン';

  @override
  String get empty => '空';

  @override
  String connectingToServer(String serverName) {
    return '$serverName に接続しています';
  }

  @override
  String get quickConnect => 'Quick Connect';

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
    return 'QuickConnect を利用できません: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect を利用できません ($status): $detail';
  }

  @override
  String get whosWatching => '誰が見てるの？';

  @override
  String get addUser => 'ユーザーの追加';

  @override
  String get selectServer => 'サーバーの選択';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin バージョン $version';
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
    return '「$serverName」をサーバー一覧から削除しますか?';
  }

  @override
  String get cancel => 'キャンセル';

  @override
  String get remove => '削除';

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
  String get detailScreenStyle => '詳細画面のスタイル';

  @override
  String get detailScreenStyleSubtitle =>
      'クラシックは従来の Moonfin の中央寄せレイアウトです。モダンはレスポンシブなシネマティックレイアウトです。';

  @override
  String get detailScreenStyleMoonfin => 'クラシック';

  @override
  String get detailScreenStyleModern => 'モダン';

  @override
  String get expandedTabs => 'タブの自動展開';

  @override
  String get expandedTabsSubtitle => 'タブを移動すると内容を自動的に表示します。オフにすると各タブを手動で開閉します。';

  @override
  String get showTechnicalDetails => '技術情報を表示しますか?';

  @override
  String get showTechnicalDetailsSubtitle => 'バナーの概要にコーデック、解像度、ストリーム情報を表示します';

  @override
  String get recommendationSystem => 'おすすめシステム';

  @override
  String get recommendationSystemSubtitle =>
      'Moonfin Recommends のローカルライブラリ用アルゴリズム、またはオンラインの TMDb 類似度指標を使用します。注: オンラインのおすすめには Seerr 連携が必要です。';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb 類似度';

  @override
  String get recommendationsApplyParentalRatingCap => '視聴年齢制限の上限を適用しますか?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Moonfin Recommends のおすすめを対象作品の視聴年齢制限で絞り込みます';

  @override
  String get interfaceStyle => 'インターフェーススタイル';

  @override
  String get interfaceStyleSubtitle =>
      '自動はお使いのデバイスに合わせます。Apple または Material を選ぶと外観を固定できます。';

  @override
  String get interfaceStyleAutomatic => '自動';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'グラスの品質';

  @override
  String get glassQualitySubtitle =>
      '自動はこのデバイスに最適なグラス効果を選びます。フルは本物のぼかしを使用し、軽量は GPU 負荷を抑えた軽いグラスを使用します。';

  @override
  String get glassQualityAuto => '自動';

  @override
  String get glassQualityFull => 'フル';

  @override
  String get glassQualityReduced => '軽量';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'アプリを再起動せずに Moonfin と Neon Pulse を切り替える';

  @override
  String get customThemeTitle => 'カスタムテーマ';

  @override
  String get customThemeSubtitle =>
      'カスタムテーマは Moonfin 全体の見た目を変更します。好みに合わせて選択してください。';

  @override
  String get keyboardPreferSystemIme => 'システムのキーボードを優先';

  @override
  String get keyboardPreferSystemImeDescription => '文字入力に標準でデバイスの入力方式を使用します';

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
  String get themeGlass => 'Glass';

  @override
  String get themeGlassSubtitle =>
      '流れるグラデーション背景、すりガラスの表面、Apple ブルーのアクセントを備えたリキッドグラス風スタイル';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      '太めのパレット、角張った枠線、くっきりしたドロップシャドウ、ピクセルフォントによるレトロなドット絵風スタイル';

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
    return '$target に接続できません';
  }

  @override
  String get exitApp => 'Moonfin を終了しますか?';

  @override
  String get exitAppConfirmation => '終了してもよろしいですか?';

  @override
  String get exit => '出口';

  @override
  String get gameMenu => 'メニュー';

  @override
  String get gamePaused => '一時停止中';

  @override
  String get gameSaveState => 'ステートセーブ';

  @override
  String get games => 'ゲーム';

  @override
  String get gameLoadState => 'ステートロード';

  @override
  String get gameFastForward => '早送り';

  @override
  String get gameEmulatorSettings => 'エミュレーター設定';

  @override
  String get gameNoCoreOptions => 'このコアには調整できる設定がありません。';

  @override
  String get gameHoldToOpenMenu => '長押しでメニューを開く';

  @override
  String get gamePlaybackUnsupported => 'このデバイスではまだゲームを実行できません。';

  @override
  String get noHomeRowsLoaded => 'ホーム行をロードできませんでした';

  @override
  String get noHomeRowsHint => 'アクティブなホームセクションを更新または削減してみてください。';

  @override
  String get retryHomeRows => 'ホーム行の再試行';

  @override
  String get guide => 'ガイド';

  @override
  String get recordings => '録画';

  @override
  String get schedule => 'スケジュール';

  @override
  String get series => 'シリーズ';

  @override
  String get noItemsFound => '項目が見つかりませんでした';

  @override
  String get home => 'ホーム';

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
  String get library => 'ライブラリ';

  @override
  String get displaySettings => '表示設定';

  @override
  String get allGenres => 'オールジャンル';

  @override
  String get noGenresFound => 'ジャンルが見つかりません';

  @override
  String failedToLoadFolderError(String error) {
    return 'フォルダーの読み込みに失敗しました: $error';
  }

  @override
  String get thisFolderIsEmpty => 'このフォルダは空です';

  @override
  String itemCountLabel(int count) {
    return '$count 件';
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
    return '$count 件';
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
    return '$name — ジャンル';
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
    return '$count 分前';
  }

  @override
  String hoursAgo(int count) {
    return '$count 時間前';
  }

  @override
  String daysAgo(int count) {
    return '$count 日前';
  }

  @override
  String get discoverySubjects => '発見の主題';

  @override
  String get pickDiscoverySubjects => 'Discover に表示する件名フィードを選択します。';

  @override
  String get apply => '適用';

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
    return '$count 作品';
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
  String get resume => '再開';

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
    return '$count 人の著者';
  }

  @override
  String genresCount(int count) {
    return '$count ジャンル';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% 完了';
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
    return '読書優先で並べた $count 作品。';
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
    return '$labelが見つかりません';
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
  String get watched => '視聴済み';

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
  String get latestBooks => '最新の書籍';

  @override
  String get latestAudiobooks => '最新のオーディオブック';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 冊',
      one: '1 冊',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => '書籍';

  @override
  String get bookFormatAudiobook => 'オーディオブック';

  @override
  String bookPercentRead(int percent) {
    return '$percent% 読了';
  }

  @override
  String bookTimeLeft(String time) {
    return '残り $time';
  }

  @override
  String get bookHeroRead => '読む';

  @override
  String get bookHeroListen => '聴く';

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
    return '$count セクション';
  }

  @override
  String firstPublished(int year) {
    return '初版 $year 年';
  }

  @override
  String get noOpenLibraryOverview => 'このタイトルの Open Library からはまだ概要が入手できません。';

  @override
  String get subjects => '科目';

  @override
  String get all => '全て';

  @override
  String booksCount(int count) {
    return '$count 冊';
  }

  @override
  String get couldNotLoadSubject => '現在この件名を読み込めませんでした。';

  @override
  String get audiobookDetails => 'オーディオブックの詳細';

  @override
  String authorsCountTitle(int count) {
    return '$count 人の著者';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 冊のオーディオブック',
      one: '1 冊のオーディオブック',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'トラックリスト';

  @override
  String get itemListPlaceholder => 'ここにアイテム一覧が表示されます';

  @override
  String get failedToLoad => 'ロードに失敗しました';

  @override
  String get delete => '削除';

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
  String get seasons => 'シーズン';

  @override
  String get chapters => '章';

  @override
  String get features => '特徴';

  @override
  String get movies => '映画';

  @override
  String get musicVideos => 'ミュージックビデオ';

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
    return 'ディスク $number';
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
    return '$year 年発行';
  }

  @override
  String get publicationDateUnknown => '発行日不明';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count シーズン',
      one: '1 シーズン',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return '$time に終了';
  }

  @override
  String get items => 'アイテム';

  @override
  String get extras => '特典';

  @override
  String get behindTheScenes => 'メイキング';

  @override
  String get deletedScenes => '未公開シーン';

  @override
  String get featurettes => 'フィーチャレット';

  @override
  String get interviews => 'インタビュー';

  @override
  String get scenes => 'シーン';

  @override
  String get shorts => '短編';

  @override
  String get trailers => '予告編';

  @override
  String timeRemaining(String time) {
    return '残り $time';
  }

  @override
  String endsIn(String time) {
    return '$time 後に終了';
  }

  @override
  String get view => 'ビュー';

  @override
  String get resumeReading => '読書を再開する';

  @override
  String get read => '読む';

  @override
  String resumeFrom(String position) {
    return '$position から再開';
  }

  @override
  String get play => '再生';

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
  String get trailer => '予告編';

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
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'プレイリストの名前を変更する';

  @override
  String get playlistName => 'プレイリスト名';

  @override
  String get deleteDownloadedAlbum => 'ダウンロードしたアルバムを削除する';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return '「$title」のダウンロード済みトラックを削除しますか?';
  }

  @override
  String get downloadedTracksDeleted => 'ダウンロードしたトラックが削除されました';

  @override
  String get downloadedTracksDeleteFailed => 'ダウンロードした一部のトラックが削除できませんでした';

  @override
  String get noTracksLoaded => 'トラックがロードされていません';

  @override
  String noItemsLoaded(String itemLabel) {
    return '$itemLabelが読み込まれていません';
  }

  @override
  String downloadingTitle(String title, int count) {
    return '$title をダウンロードしています ($count 件)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return '「$name」をサーバーから削除してもよろしいですか? この操作は取り消せません。';
  }

  @override
  String get itemDeleted => 'アイテムが削除されました';

  @override
  String get noPlayableTrailerFound => 'プレイ可能なトレーラーが見つかりません。';

  @override
  String unsupportedBookFormat(String extension) {
    return '対応していない書籍形式です: .$extension';
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
    return '字幕をダウンロードして選択しました: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      '字幕をダウンロードしました。 Jellyfin が項目を更新している間、表示されるまでに少し時間がかかる場合があります。';

  @override
  String noRemoteSubtitlesFound(String language) {
    return '$language のリモート字幕が見つかりませんでした。';
  }

  @override
  String get selectVersion => 'バージョンの選択';

  @override
  String versionNumber(int number) {
    return 'バージョン $number';
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
    return '$name ($quality) をダウンロードしています...';
  }

  @override
  String get deleteDownloadedFiles => 'ダウンロードしたファイルを削除する';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return '$typeLabelのローカルファイルを削除しますか?\n\nストレージの空き容量が増えます。あとで再ダウンロードできます。';
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
  String get directors => '監督';

  @override
  String get writer => '脚本';

  @override
  String get writers => '脚本家';

  @override
  String get studio => 'スタジオ';

  @override
  String studioMoreCount(int count) {
    return '他 $count 件';
  }

  @override
  String totalEpisodes(int count) {
    return '$count エピソード';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'エピソード $number';
  }

  @override
  String chapterNumber(int number) {
    return 'チャプター $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count トラック',
      one: '1 トラック',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count チャプター',
      one: '1 チャプター',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return '生誕 $date';
  }

  @override
  String died(String date) {
    return '没年 $date';
  }

  @override
  String age(int age) {
    return '$age 歳';
  }

  @override
  String get showLess => '表示を減らす';

  @override
  String get readMore => '続きを読む';

  @override
  String get shuffle => 'シャッフル';

  @override
  String get shuffleAllMusic => 'すべての音楽をシャッフル';

  @override
  String get carSignInPrompt => 'スマートフォンで Moonfin にサインインしてください';

  @override
  String get carServerUnreachable => 'サーバーに接続できません';

  @override
  String downloadsCount(int count) {
    return '$count ダウンロード';
  }

  @override
  String get perfectMatch => '完璧に一致';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'モノラル';

  @override
  String get stereo => 'ステレオ';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'リモート字幕の$actionには、このユーザーに Jellyfin の字幕管理権限が必要です。';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'リモート字幕の$actionを行うアイテムがサーバー上で見つかりませんでした。';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'リモート字幕の$actionに失敗しました: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'リモート字幕の$actionに失敗しました (HTTP $status)。';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'リモート字幕の$actionに失敗しました。';
  }

  @override
  String deleteSeriesFiles(String name) {
    return '「$name」のダウンロード済みエピソードすべて';
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
    return '$label の操作に失敗しました: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'キャストの音量を変更できませんでした: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label のコントロール';
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
    return '$label を停止';
  }

  @override
  String get queueIsEmpty => 'キューは空です';

  @override
  String trackNumber(int number) {
    return 'トラック $number';
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
    return '$seconds 秒';
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
  String get track => 'トラック';

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
    return '$protocol セッションエラー';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return '書籍の詳細の読み込みに失敗しました: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'アプリ内 EPUB レンダリングは、このプラットフォームではまだ利用できません。';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'この形式 (.$extension) はまだアプリ内で表示できません。';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'このプラットフォームでは、埋め込みドキュメントのレンダリングは利用できません。';

  @override
  String get couldNotOpenExternalViewer => '外部ビューアを開けませんでした。';

  @override
  String failedToOpenInAppReader(String error) {
    return 'アプリ内リーダーを開けませんでした: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return '$label にはすでにブックマークがあります。';
  }

  @override
  String bookmarkAdded(String label) {
    return 'ブックマークを追加しました: $label';
  }

  @override
  String get noBookmarksYet =>
      'まだブックマークはありません。\n読書中にブックマーク アイコンをタップして、位置を保存します。';

  @override
  String get noTableOfContentsAvailable => '目次がありません';

  @override
  String pageLabel(int number) {
    return '$number ページ';
  }

  @override
  String get position => '位置';

  @override
  String get bookReader => 'ブックリーダー';

  @override
  String formatExtension(String extension) {
    return '形式: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% 読了';
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
    return 'ズームをリセット (${zoom}x)';
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
    return '既読状態を更新できませんでした: $error';
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
    return 'このプラットフォームでは $extension ファイル用の組み込みドキュメントエンジンを利用できません。';
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
    return '番組表の読み込みに失敗しました: $error';
  }

  @override
  String get noChannelsFound => 'チャンネルが見つかりません';

  @override
  String get liveBadge => 'ライブ';

  @override
  String guideNextProgram(String time, String title) {
    return '次: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '残り $minutes 分';
  }

  @override
  String guideHoursLeft(int hours) {
    return '残り $hours 時間';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '残り $hours 時間 $minutes 分';
  }

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
  String get record => '録画予約';

  @override
  String get cancelRecordingAction => '録画をキャンセル';

  @override
  String get programSetToRecord => '番組の録画を予約しました';

  @override
  String get recordingCancelled => '録画をキャンセルしました';

  @override
  String get unableToCreateRecording => '録画を作成できません';

  @override
  String get watch => '視聴';

  @override
  String get close => '閉じる';

  @override
  String failedToPlayChannel(String name) {
    return '$name を再生できませんでした';
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
    return '「$name」の録画予約をキャンセルしますか?';
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
    return '「$name」の録画を停止しますか?';
  }

  @override
  String get failedToCancelSeriesRecording => 'シリーズ録画のキャンセルに失敗しました';

  @override
  String get searchThisLibrary => 'このライブラリを検索...';

  @override
  String get searchEllipsis => '検索...';

  @override
  String noResultsForQuery(String query) {
    return '「$query」に一致する結果はありません';
  }

  @override
  String searchFailedError(String error) {
    return '検索に失敗しました: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr アカウントの種類';

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
    return '「$name」とそのファイルを削除しますか?';
  }

  @override
  String tracksCount(int count) {
    return '$count トラック';
  }

  @override
  String get album => 'アルバム';

  @override
  String get playAlbum => 'アルバムを再生する';

  @override
  String failedToLoadAlbum(String error) {
    return 'アルバムの読み込みに失敗しました: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return '$name のダウンロード済みトラックはありません。';
  }

  @override
  String get season => 'シーズン';

  @override
  String get errorLoadingEpisodes => 'エピソードの読み込みエラー';

  @override
  String get noDownloadedEpisodes => 'ダウンロードされたエピソードはありません';

  @override
  String get deleteEpisode => 'エピソードの削除';

  @override
  String removeName(String name) {
    return '「$name」を削除しますか?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes 分';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'エピソード $number';
  }

  @override
  String get seriesNotFound => 'シリーズが見つかりません';

  @override
  String get errorLoadingSeries => 'シリーズの読み込みエラー';

  @override
  String get downloadedEpisodes => 'ダウンロードされたエピソード';

  @override
  String seasonNumber(int number) {
    return 'シーズン $number';
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
    return '$season のダウンロード済みエピソードをすべて削除しますか?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count エピソード',
      one: '1 エピソード',
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
    return 'ダウンロード済みの $count 件を削除しますか?';
  }

  @override
  String get musicAndAudiobooks => '音楽とオーディオブック';

  @override
  String get images => '画像';

  @override
  String get database => 'データベース';

  @override
  String ofStorageLimit(String limit) {
    return '/ 上限 $limit';
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
    return '$count 項目';
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
  String get themeMusicSettingsSubtitle => '詳細ページ、ホーム行、音量';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'ホームロウズのテーマ音楽';

  @override
  String get playWhenBrowsingHomeScreen => 'ホーム画面閲覧時に再生';

  @override
  String get loopThemeMusic => 'テーマ音楽をループ再生';

  @override
  String get loopThemeMusicSubtitle => '1 回だけ再生せずにトラックを繰り返します';

  @override
  String get detailsBackgroundBlur => '詳細背景ぼかし';

  @override
  String get detailsBackgroundOpacity => 'Details Background Opacity';

  @override
  String get detailsBackgroundOpacitySubtitle =>
      'Adjust amount of opacity on modern detail pages from light to dark.';

  @override
  String get opacityLightest => 'Lightest';

  @override
  String get opacityLight => 'Light';

  @override
  String get opacityMedium => 'Medium';

  @override
  String get opacityDark => 'Dark';

  @override
  String get opacityDarkest => 'Darkest';

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
  String get settingsScrollWheelAction => 'マウスホイール';

  @override
  String get settingsScrollWheelActionDescription =>
      '再生中に映像の上でマウスホイールを回したときの動作を選択します。';

  @override
  String get scrollWheelActionOff => 'オフ';

  @override
  String get scrollWheelActionSeek => 'シーク (前後移動)';

  @override
  String get scrollWheelActionVolume => '音量';

  @override
  String get playerTooltipVolume => '音量';

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
  String get fallbackAudioLanguage => '代替オーディオ言語';

  @override
  String get preferDefaultAudioTrack => '既定のオーディオトラックを優先';

  @override
  String get preferDefaultAudioTrackDescription =>
      '吹き替えよりもオリジナルのオーディオトラックを優先します。';

  @override
  String get preferAudioDescription => '音声解説トラックを優先';

  @override
  String get preferAudioDescriptionDescription => '通常のトラックよりも音声解説トラックを優先します。';

  @override
  String get transcodingAudio => 'トランスコード (オーディオ)';

  @override
  String get directStreamRemux => 'ダイレクトストリーム (リマックス)';

  @override
  String get transcodingBitrateOrResolution => 'トランスコード (ビットレートまたは解像度)';

  @override
  String get transcodingVideoAndAudio => 'トランスコード (映像とオーディオ)';

  @override
  String get transcodingVideo => 'トランスコード (映像)';

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
  String get settingsAudioOutputMode => 'オーディオ出力モード';

  @override
  String get settingsAudioOutputModeDescription =>
      'オーディオのデコード方法を選択します。AVR パススルーは Dolby / DTS のストリームをそのままレシーバーに送信し、自動またはダウンミックスは本体でデコードします。';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR パススルー';

  @override
  String get settingsAudioFallbackCodec => '代替オーディオコーデック';

  @override
  String get settingsAudioFallbackCodecDescription =>
      '元のストリームをダイレクト再生もパススルーもできない場合に、マルチチャンネルオーディオを変換する形式を選択します。';

  @override
  String get settingsAudioFallbackCodecAuto => '自動検出\n(推奨)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(既定)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(ロスレス)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(ステレオのみ)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(高効率)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(ロスレス)';

  @override
  String get settingsMaxAudioChannels => '最大オーディオチャンネル数';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'お使いのオーディオ環境の最大チャンネル数を設定します。この上限を超えるマルチチャンネルストリームはダウンミックスまたはトランスコードされます。';

  @override
  String get settingsMaxAudioChannelsAuto => '自動検出\n(ハードウェアの既定)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 モノラル';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 ステレオ';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 サラウンド';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 クアドラフォニック';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 サラウンド';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 サラウンド';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 サラウンド';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 サラウンド';

  @override
  String get settingsAudioPassthroughAdvanced => 'パススルー (詳細設定)';

  @override
  String get settingsAudioCodecPassthrough => 'コーデックパススルー';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'お使いの AVR または HDMI 出力先が対応している形式のみを有効にしてください。';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 パススルー';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos) パススルー';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS コアパススルー';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA パススルー';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD パススルー';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos パススルー';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Dolby Digital Plus (EAC3) を外部デコーダーにビットストリーム出力します。';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'EAC3 (JOC) の Dolby Atmos を外部デコーダーにビットストリーム出力します。';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'DTS-HD MA (DTS コアを含む) を外部デコーダーにビットストリーム出力します。';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Atmos メタデータ付きの Dolby TrueHD を外部デコーダーにビットストリーム出力します。';

  @override
  String get settingsDetectedAudioCapabilities => '検出されたオーディオ機能';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      '実行時の機能情報はまだ取得されていません。';

  @override
  String get settingsAudioRouteLabel => '出力経路';

  @override
  String get settingsAudioDecodeLabel => 'デコード';

  @override
  String get settingsAudioPassthroughLabel => 'パススルー';

  @override
  String get settingsAudioHdRoute => 'HD オーディオ対応の経路';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'スピーカー';

  @override
  String get settingsAudioRouteHeadphones => 'ヘッドホン';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => '診断情報';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'ビデオレベル';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'ビデオレンジ';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => '字幕コーデック';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs => '許可するオーディオコーデック';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS オーディオコーデック';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 オーディオコーデック';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif パススルー';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => '現在のオーディオ出力経路';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport => '経路の HD オーディオ対応状況';

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
    return '$value秒';
  }

  @override
  String get mediaQueuing => 'メディアキューイング';

  @override
  String get autoQueueNextEpisodes => '次のエピソードを自動キューに入れる';

  @override
  String get stillWatchingPrompt => 'プロンプトをまだ見ています';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return '$episodes エピソード / $hours 時間ごと';
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
  String get subtitleMode => '字幕モード';

  @override
  String get subtitleModeFlagged => 'フラグ付き';

  @override
  String get subtitleModeAlways => '常に表示';

  @override
  String get subtitleModeForeign => '外国語';

  @override
  String get subtitleModeForced => '強制';

  @override
  String get subtitleModeFlaggedDescription =>
      'メディアファイルのメタデータで「デフォルト」または「強制」とフラグが付いたトラックを再生します。';

  @override
  String get subtitleModeAlwaysDescription => '動画の再生開始時に、常に字幕を読み込んで表示します。';

  @override
  String get subtitleModeForeignDescription =>
      '既定のオーディオトラックが外国語の場合に、自動的に字幕をオンにします。';

  @override
  String get subtitleModeForcedDescription => '強制フラグが明示的に付いた字幕のみを読み込みます。';

  @override
  String get subtitleModeNoneDescription => '字幕の自動読み込みを完全に無効にします。';

  @override
  String get fallbackSubtitleLanguage => '代替字幕言語';

  @override
  String get subtitleStream => '字幕ストリーム';

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
    return '$profile プロファイルの設定を読み込みました。';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return '$profile プロファイルの設定を読み込めませんでした。';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'ローカル設定を $profile プロファイルに同期しました。';
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
  String get reportDownloadsActivity => 'サーバーにダウンロードを表示';

  @override
  String get reportDownloadsActivitySubtitle =>
      '変換済みダウンロードをサーバー管理者がダッシュボードで確認できるようにします';

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
  String get navbarAlwaysExpanded => 'ナビゲーションバーのラベルを常に表示';

  @override
  String get showSeerrButton => 'Seerr ボタンを表示';

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
  String get groupItemsIntoCollections => 'アイテムをコレクションにまとめる';

  @override
  String get hideCollectionAssociatedItems =>
      'ライブラリの閲覧時にコレクションに含まれるアイテムを非表示にします';

  @override
  String get groupItemsIntoCollectionsDialogTitle => 'ライブラリのグループ化について';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'この設定を使用するには、Jellyfin または Emby サーバーのライブラリの表示設定で「映画をコレクションにまとめる」または「番組をコレクションにまとめる」が有効になっていることを確認してください。';

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
    return '$count 件を選択中';
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
      'さまざまなメディアバーのスタイルから選択するか、メディアバーをオフにします。';

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
  String get trailerAudio => '予告編のオーディオ';

  @override
  String get enableTrailerAudio => 'メディアバーの予告編でオーディオを有効にします';

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
  String get fullScreenRows => 'ホーム行を拡大表示';

  @override
  String get fullScreenRowsDescription => '1 画面に表示するホーム行を 1 行に制限します';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => '行ごとの画像タイプ';

  @override
  String get perRowSettings => '行ごとの設定';

  @override
  String get autoLogin => '自動ログイン';

  @override
  String get lastUser => '最後のユーザー';

  @override
  String get currentUser => '現在のユーザー';

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
    return '$minutes 分';
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
  String get clockModeStatic => '固定';

  @override
  String get clockModeBouncing => 'バウンド';

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
  String get trakt => 'Trakt';

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
  String get pluginLabel => 'Moonbase プラグイン';

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
    return '$status\nバージョン: $version';
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
  String get seerrDiscoveryRows => 'Seerr のディスカバリー行';

  @override
  String get resetRowsToDefaults => '行をデフォルトにリセットする';

  @override
  String get enableSeerr => 'Seerr を有効にする';

  @override
  String get showSeerrInNavigation => 'ナビゲーションに Seerr を表示 (サーバープラグインが必要)';

  @override
  String get seerrUnavailable => 'サーバー プラグイン Seerr サポートが無効になっているため、使用できません。';

  @override
  String get nsfwFilter => 'NSFWフィルター';

  @override
  String get hideAdultContent => '結果内のアダルト コンテンツを非表示にする';

  @override
  String get seerrNotificationsSection => '通知';

  @override
  String get seerrNotifyNewRequestsTitle => '新規リクエストの通知';

  @override
  String get seerrNotifyNewRequestsSubtitle => '誰かがリクエストを送信したときに通知します';

  @override
  String get seerrNotifyLibraryAddedTitle => 'リクエストの更新';

  @override
  String get seerrNotifyLibraryAddedSubtitle => '承認、却下、ライブラリへの追加';

  @override
  String get seerrNotifyIssuesTitle => '問題の更新';

  @override
  String get seerrNotifyIssuesSubtitle => '新しい問題、返信、解決';

  @override
  String loggedInAs(String username) {
    return 'ログイン中: $username';
  }

  @override
  String get discoverRows => 'Seerr ディスカバリーページ';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Seerr のメインページに表示する行を有効にします。ドラッグして並べ替えられます。カスタムの並び順は Moonbase と同期されます。';

  @override
  String get discoverRowsDescription =>
      'Seerr のメインページに表示する行を有効にします。ドラッグして並べ替えられます。カスタムの並び順は Moonbase と同期されます。';

  @override
  String get enabled => '有効';

  @override
  String get hidden => '隠れた';

  @override
  String get aboutTitle => 'について';

  @override
  String versionValue(String version) {
    return 'バージョン $version';
  }

  @override
  String get openSourceLicenses => 'オープンソースライセンス';

  @override
  String get sourceCode => 'ソースコード';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

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
    return 'アップデートがあります: v$version';
  }

  @override
  String get updateNotifications => 'アップデート通知';

  @override
  String get showWhenUpdatesAvailable => 'アップデートが利用可能になったときに表示する';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version が利用可能です';
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
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => '画像キャッシュの上限';

  @override
  String get clearImageCache => '画像キャッシュを消去';

  @override
  String get imageCacheCleared => '画像キャッシュを消去しました';

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
  String seerrDownloadingPercent(int percent) {
    return 'ダウンロード中 · $percent%';
  }

  @override
  String get seerrImportingStatus => '取り込み中';

  @override
  String itemsCount(int count) {
    return '$count 件';
  }

  @override
  String get seerrSettings => 'Seerr 設定';

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
    return '$name がリクエスト';
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
    return '「$title」のリクエストをキャンセルしますか?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return '「$title」の $count 件のリクエストをキャンセルしますか?';
  }

  @override
  String get keep => '保つ';

  @override
  String get itemNotFoundInLibrary => 'Moonfin ライブラリにアイテムが見つかりません';

  @override
  String get errorSearchingLibrary => 'ライブラリ検索エラー';

  @override
  String budgetAmount(String amount) {
    return '製作費: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return '興行収入: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return '$typeをリクエスト';
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
  String get appearances => '出演作品';

  @override
  String get crewSection => 'クルー';

  @override
  String ageValue(int age) {
    return '$age 歳';
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
  String get failedStatus => '失敗';

  @override
  String get processingStatus => '処理中';

  @override
  String modifiedByName(String name) {
    return '$name が更新';
  }

  @override
  String get completedStatus => '完了';

  @override
  String get requestErrorDuplicate => 'このタイトルはすでにリクエスト済みです';

  @override
  String get requestErrorQuota => 'リクエストの上限に達しました';

  @override
  String get requestErrorBlocklisted => 'このタイトルはブロックリストに登録されています';

  @override
  String get requestErrorNoSeasons => 'リクエストできるシーズンがありません';

  @override
  String get requestErrorPermission => 'このリクエストを行う権限がありません';

  @override
  String get seerrRequestsTitle => 'リクエスト';

  @override
  String get seerrIssuesTitle => '問題';

  @override
  String get sortNewest => '新着順';

  @override
  String get sortLastModified => '更新順';

  @override
  String get noIssues => '問題はありません';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '映画のリクエスト残り $remaining / $limit 件';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'シーズンのリクエスト残り $remaining / $limit 件';
  }

  @override
  String partOfCollectionName(String name) {
    return '$name の一部';
  }

  @override
  String get viewCollection => 'コレクションを表示';

  @override
  String get requestCollection => 'コレクションをリクエスト';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total 本の映画 · $available 本が視聴可能';
  }

  @override
  String requestMoviesCount(int count) {
    return '$count 本の映画をリクエスト';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'リクエスト中 $current / $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return '$count 本の映画をリクエストしました';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return '$total 本中 $ok 本の映画をリクエストしました';
  }

  @override
  String get collectionAllRequested => 'すべての映画は視聴可能かリクエスト済みです';

  @override
  String get reportIssue => '問題を報告';

  @override
  String get issueTypeVideo => '映像';

  @override
  String get issueTypeAudio => 'オーディオ';

  @override
  String get whatsWrong => 'どのような問題ですか?';

  @override
  String get allEpisodes => '全エピソード';

  @override
  String get episode => 'エピソード';

  @override
  String get openStatus => '未解決';

  @override
  String get resolvedStatus => '解決済み';

  @override
  String get resolveAction => '解決にする';

  @override
  String get reopenAction => '再開する';

  @override
  String reportedByName(String name) {
    return '$name が報告';
  }

  @override
  String commentsCount(int count) {
    return '$count 件のコメント';
  }

  @override
  String get addComment => 'コメントを追加';

  @override
  String get deleteIssueConfirm => 'この問題を削除しますか?';

  @override
  String get submitReport => '報告を送信';

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
  String get seasonsLabel => 'シーズン';

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
  String get done => '完了';

  @override
  String get edit => '編集';

  @override
  String get encoding => 'エンコーディング';

  @override
  String get error => 'エラー';

  @override
  String get forward => '進む';

  @override
  String get general => '一般';

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
  String get next => '次へ';

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
  String get trickplay => 'Trickplay';

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
  String get adminDrawerLibraries => 'ライブラリ';

  @override
  String get adminDrawerDisplay => '表示';

  @override
  String get adminDrawerMetadata => 'メタデータ';

  @override
  String get adminDrawerNfo => 'NFO 設定';

  @override
  String get adminDrawerTranscoding => 'トランスコーディング';

  @override
  String get adminDrawerResume => '再開';

  @override
  String get adminDrawerStreaming => 'ストリーミング';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

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
    return '更新可能なプラグイン: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return '再起動が必要なプラグイン: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return '失敗したスケジュールタスク: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return '最近の警告/エラー件数: $count';
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
    return 'エラー: $error';
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
    return 'コマンドに失敗しました: $error';
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
  String get sessionForward => '早送り';

  @override
  String get sessionNext => '次へ';

  @override
  String get sessionVolumeDown => '音量 –';

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
  String get adminActivitySeverityAll => 'すべての重要度';

  @override
  String get adminActivityDateRange => '期間';

  @override
  String adminActivityLoadFailed(String error) {
    return 'アクティビティログの読み込みに失敗しました: $error';
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
    return 'デバイスを更新できませんでした: $error';
  }

  @override
  String get adminDeleteDevice => 'デバイスの削除';

  @override
  String get adminDeviceDeleted => 'デバイスが削除されました';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'デバイスを削除できませんでした: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'デバイス「$name」を削除しますか? このデバイスでは再度サインインが必要になります。';
  }

  @override
  String get adminDeleteAllDevices => 'すべてのデバイスを削除';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return '$count 台のデバイスを削除しますか? 対象のユーザーは再度サインインが必要になります。現在お使いのデバイスは影響を受けません。';
  }

  @override
  String get adminDevicesDeletedAll => 'デバイスを削除しました';

  @override
  String adminDevicesDeletedPartial(int count) {
    return '一部のデバイスを削除しました。$count 台は削除できませんでした。';
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
    return 'スキャンを開始できませんでした: $error';
  }

  @override
  String get adminRenameLibrary => 'ライブラリ名の変更';

  @override
  String get adminNewName => '新しい名前';

  @override
  String adminLibraryRenamed(String name) {
    return 'ライブラリの名前を「$name」に変更しました';
  }

  @override
  String adminRenameFailed(String error) {
    return '名前を変更できませんでした: $error';
  }

  @override
  String get adminDeleteLibrary => 'ライブラリの削除';

  @override
  String adminLibraryDeleted(String name) {
    return 'ライブラリ「$name」を削除しました';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'ライブラリを削除できませんでした: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'パスを追加できませんでした: $error';
  }

  @override
  String get adminRemovePath => 'パスの削除';

  @override
  String adminRemovePathConfirm(String path) {
    return 'このライブラリから「$path」を削除しますか?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'パスを削除できませんでした: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'ライブラリオプションが保存されました';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return '設定を保存できませんでした: $error';
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
  String get adminLibraryTabPaths => 'パス';

  @override
  String get adminLibraryTabOptions => 'オプション';

  @override
  String get adminLibraryTabDownloaders => 'ダウンローダー';

  @override
  String get adminLibMetadataSavers => 'メタデータの保存先';

  @override
  String get adminLibSubtitleDownloaders => '字幕ダウンローダー';

  @override
  String get adminLibLyricDownloaders => '歌詞ダウンローダー';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'メタデータダウンローダー: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return '画像取得元: $type';
  }

  @override
  String get adminLibNoDownloaders => 'このサーバーには、このライブラリ種別で利用できるダウンローダーがありません。';

  @override
  String get adminLibrarySectionGeneral => '一般';

  @override
  String get adminLibrarySectionMetadata => 'メタデータ';

  @override
  String get adminLibrarySectionEmbedded => '埋め込み情報';

  @override
  String get adminLibrarySectionSubtitles => '字幕';

  @override
  String get adminLibrarySectionImages => '画像';

  @override
  String get adminLibrarySectionSeries => 'シリーズ';

  @override
  String get adminLibrarySectionMusic => '音楽';

  @override
  String get adminLibrarySectionMovies => '映画';

  @override
  String get adminLibRealtimeMonitor => 'リアルタイム監視を有効にする';

  @override
  String get adminLibRealtimeMonitorHint => 'ファイルの変更を検出して自動的に処理します。';

  @override
  String get adminLibArchiveMediaFiles => 'アーカイブをメディアファイルとして扱う';

  @override
  String get adminLibEnablePhotos => '写真を表示する';

  @override
  String get adminLibSaveLocalMetadata => 'アートワークをメディアフォルダーに保存する';

  @override
  String get adminLibRefreshInterval => 'メタデータの自動更新';

  @override
  String get adminLibRefreshNever => 'しない';

  @override
  String get adminLibDefault => 'デフォルト';

  @override
  String get adminLibDisplayTitle => '表示';

  @override
  String get adminLibDisplaySection => 'ライブラリの表示';

  @override
  String get adminLibFolderView => '通常のメディアフォルダーを表示するフォルダービューを表示する';

  @override
  String get adminLibSpecialsInSeasons => '特別編を放送されたシーズン内に表示する';

  @override
  String get adminLibGroupMovies => '映画をコレクションにまとめる';

  @override
  String get adminLibGroupShows => '番組をコレクションにまとめる';

  @override
  String get adminLibExternalSuggestions => 'おすすめに外部コンテンツを表示する';

  @override
  String get adminLibDateAddedSection => '追加日の扱い';

  @override
  String get adminLibDateAddedLabel => '追加日として使用する日付';

  @override
  String get adminLibDateAddedImport => 'ライブラリにスキャンされた日付';

  @override
  String get adminLibDateAddedFile => 'ファイルが作成された日付';

  @override
  String get adminLibMetadataTitle => 'メタデータと画像';

  @override
  String get adminLibMetadataLangSection => '優先するメタデータの言語';

  @override
  String get adminLibChaptersSection => 'チャプター';

  @override
  String get adminLibDummyChapterDuration => 'ダミーチャプターの長さ (秒)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'チャプターがないメディア用に生成するチャプターの長さ。0 にすると無効になります。';

  @override
  String get adminLibChapterImageResolution => 'チャプター画像の解像度';

  @override
  String get adminLibNfoTitle => 'NFO 設定';

  @override
  String get adminLibNfoHelp =>
      'NFO メタデータは Kodi などのクライアントと互換性があります。設定は NFO メタデータを保存するすべてのライブラリに適用されます。';

  @override
  String get adminLibKodiUser => 'NFO ファイルに視聴データを保存するユーザー';

  @override
  String get adminLibSaveImagePaths => 'NFO ファイルに画像のパスを保存する';

  @override
  String get adminLibPathSubstitution => 'NFO の画像パスでパス置換を有効にする';

  @override
  String get adminLibExtraThumbs => 'extrafanart の画像を extrathumbs フォルダーにコピーする';

  @override
  String get adminLibNone => 'なし';

  @override
  String adminLibRefreshDays(int days) {
    return '$days 日';
  }

  @override
  String get adminLibEmbeddedTitles => '埋め込みタイトルを使用する';

  @override
  String get adminLibEmbeddedExtrasTitles => '特典に埋め込みタイトルを使用する';

  @override
  String get adminLibEmbeddedEpisodeInfos => '埋め込みのエピソード情報を使用する';

  @override
  String get adminLibAllowEmbeddedSubtitles => '埋め込み字幕を許可する';

  @override
  String get adminLibEmbeddedAllowAll => 'すべて許可';

  @override
  String get adminLibEmbeddedAllowText => 'テキストのみ';

  @override
  String get adminLibEmbeddedAllowImage => '画像のみ';

  @override
  String get adminLibEmbeddedAllowNone => 'なし';

  @override
  String get adminLibSkipIfEmbeddedSubs => '埋め込み字幕がある場合はダウンロードをスキップする';

  @override
  String get adminLibSkipIfAudioMatches =>
      'オーディオトラックがダウンロード言語と一致する場合はダウンロードをスキップする';

  @override
  String get adminLibRequirePerfectMatch => '字幕の完全一致を必須にする';

  @override
  String get adminLibSaveSubtitlesWithMedia => '字幕をメディアフォルダーに保存する';

  @override
  String get adminLibChapterImageExtraction => 'チャプター画像を抽出する';

  @override
  String get adminLibChapterImagesDuringScan => 'ライブラリのスキャン中にチャプター画像を抽出する';

  @override
  String get adminLibTrickplayExtraction => 'Trickplay画像の抽出を有効にする';

  @override
  String get adminLibTrickplayDuringScan => 'ライブラリのスキャン中にTrickplay画像を抽出する';

  @override
  String get adminLibSaveTrickplayWithMedia => 'Trickplay画像をメディアフォルダーに保存する';

  @override
  String get adminLibAutomaticSeriesGrouping => '複数のフォルダーに分かれたシリーズを自動的に統合する';

  @override
  String get adminLibSeasonZeroName => 'シーズン 0 の表示名';

  @override
  String get adminLibLufsScan => '音量正規化のための LUFS スキャンを有効にする';

  @override
  String get adminLibPreferNonstandardArtist => '非標準のアーティストタグを優先する';

  @override
  String get adminLibAutoAddToCollection => '映画を自動的にコレクションに追加する';

  @override
  String get adminLibraryNameRequired => 'ライブラリ名は必須です';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'ライブラリを作成できませんでした: $error';
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
    return '$name を無効にしますか? サインインできなくなります。';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return '$name を有効にしますか? 再びサインインできるようになります。';
  }

  @override
  String adminUserDisabled(String name) {
    return 'ユーザー「$name」を無効にしました';
  }

  @override
  String adminUserEnabled(String name) {
    return 'ユーザー「$name」を有効にしました';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'ユーザーポリシーを更新できませんでした: $error';
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
    return 'ユーザーを作成できませんでした: $error';
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
    return '保存できませんでした: $error';
  }

  @override
  String get adminPermissionsSaved => '権限が保存されました';

  @override
  String get adminPasswordsMismatch => 'パスワードが一致しません';

  @override
  String adminFailed(String error) {
    return '失敗しました: $error';
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
  String get adminParentalControl => 'ペアレンタルコントロール';

  @override
  String get adminMaxParentalRating => '許可する視聴年齢制限の上限';

  @override
  String get adminMaxParentalRatingHint =>
      'これより高いレーティングのコンテンツは、このユーザーには表示されません。';

  @override
  String get adminParentalRatingNone => 'なし';

  @override
  String get adminBlockUnratedItems => 'レーティング情報がない、または認識できないアイテムをブロックする';

  @override
  String get adminUnratedBook => '書籍';

  @override
  String get adminUnratedChannelContent => 'チャンネル';

  @override
  String get adminUnratedLiveTvChannel => 'ライブ TV';

  @override
  String get adminUnratedMovie => '映画';

  @override
  String get adminUnratedMusic => '音楽';

  @override
  String get adminUnratedTrailer => '予告編';

  @override
  String get adminUnratedSeries => '番組';

  @override
  String get adminAccessSchedules => 'アクセススケジュール';

  @override
  String get adminAccessSchedulesHint =>
      '以下のスケジュールの時間帯のみアクセスを許可します。スケジュールを設定しない場合は終日アクセスできます。';

  @override
  String get adminAddSchedule => 'スケジュールを追加';

  @override
  String get adminScheduleDay => '曜日';

  @override
  String get adminScheduleStart => '開始';

  @override
  String get adminScheduleEnd => '終了';

  @override
  String get adminDayEveryday => '毎日';

  @override
  String get adminDayWeekday => '平日';

  @override
  String get adminDayWeekend => '週末';

  @override
  String get adminDaySunday => '日曜日';

  @override
  String get adminDayMonday => '月曜日';

  @override
  String get adminDayTuesday => '火曜日';

  @override
  String get adminDayWednesday => '水曜日';

  @override
  String get adminDayThursday => '木曜日';

  @override
  String get adminDayFriday => '金曜日';

  @override
  String get adminDaySaturday => '土曜日';

  @override
  String get adminAllowedTags => '許可するタグ';

  @override
  String get adminAllowedTagsHint => 'これらのタグが付いたコンテンツのみを表示します。空欄にするとすべて許可されます。';

  @override
  String get adminBlockedTags => 'ブロックするタグ';

  @override
  String get adminBlockedTagsHint => 'これらのタグが付いたコンテンツは、このユーザーには表示されません。';

  @override
  String get adminAddTag => 'タグを追加';

  @override
  String get adminEnabledDevices => '有効なデバイス';

  @override
  String get adminEnabledChannels => '有効なチャンネル';

  @override
  String get adminAuthProvider => '認証プロバイダー';

  @override
  String get adminPasswordResetProvider => 'パスワードリセットプロバイダー';

  @override
  String get adminLoginAttemptsBeforeLockout => 'ロックアウトまでのログイン失敗回数の上限';

  @override
  String get adminLoginAttemptsHint => '0 で既定値、-1 でロックアウトを無効にします。';

  @override
  String get adminSyncPlayAccess => 'SyncPlay のアクセス権';

  @override
  String get adminSyncPlayCreateAndJoin => 'グループの作成と参加を許可する';

  @override
  String get adminSyncPlayJoin => 'グループへの参加を許可する';

  @override
  String get adminSyncPlayNone => 'アクセスなし';

  @override
  String get adminContentDeletionFolders => 'コンテンツの削除を許可する場所';

  @override
  String get adminResetPasswordWarning =>
      'これによりパスワードが削除されます。ユーザーはパスワードなしでログインできるようになります。';

  @override
  String adminServerReturnedHttp(int status) {
    return 'サーバーが HTTP $status を返しました';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return '$name を削除してもよろしいですか?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'ユーザー「$name」を削除しました';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'ユーザーを削除できませんでした: $error';
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
    return 'キーを作成できませんでした: $error';
  }

  @override
  String get adminKeyTokenMissing => 'サーバー応答にキートークンがありません';

  @override
  String get adminRevokeApiKey => 'APIキーを取り消す';

  @override
  String adminRevokeKeyConfirm(String name) {
    return '$name のキーを無効化しますか?';
  }

  @override
  String get adminApiKeyRevoked => 'APIキーが取り消されました';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'キーを無効化できませんでした: $error';
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
    return 'トークン: $token\\n作成日時: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'バックアップを作成';

  @override
  String get adminBackupInclude => 'バックアップに含める項目を選択してください。';

  @override
  String get adminBackupDatabase => 'データベース';

  @override
  String get adminBackupDatabaseAlways => '常に含まれます';

  @override
  String get adminBackupMetadata => 'メタデータ';

  @override
  String get adminBackupSubtitles => '字幕';

  @override
  String get adminBackupTrickplay => 'Trickplay画像';

  @override
  String get adminCreatingBackup => 'バックアップを作成しています...';

  @override
  String get adminBackupCreated => 'バックアップが正常に作成されました';

  @override
  String adminBackupCreateFailed(String error) {
    return 'バックアップを作成できませんでした: $error';
  }

  @override
  String get adminBackupPathMissing => 'サーバー応答にバックアップ パスがありません';

  @override
  String adminBackupManifest(String name) {
    return 'マニフェスト: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'マニフェストを読み込めませんでした: $error';
  }

  @override
  String get adminConfirmRestore => '復元の確認';

  @override
  String get adminRestoringBackup => 'バックアップを復元中...';

  @override
  String adminRestoreFailed(String error) {
    return 'バックアップを復元できませんでした: $error';
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
    return '$path に保存しました';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'ファイルを保存できませんでした: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return '$fileName を読み込めませんでした';
  }

  @override
  String get adminSearchInLog => 'ログ内検索';

  @override
  String get adminNoMatchingLines => '一致する行はありません';

  @override
  String adminTasksLoadFailed(String error) {
    return 'タスクの読み込みに失敗しました: $error';
  }

  @override
  String get adminNoScheduledTasks => 'スケジュールされたタスクが見つかりません';

  @override
  String get adminNoTasksMatchFilter => '現在のフィルターに一致するタスクはありません';

  @override
  String adminTaskStartFailed(String error) {
    return 'タスクを開始できませんでした: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'タスクを停止できませんでした: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'タスクの読み込みに失敗しました: $error';
  }

  @override
  String get adminRunNow => '今すぐ実行';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'トリガーを削除できませんでした: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'トリガーを追加できませんでした: $error';
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
    return '$hours 時間';
  }

  @override
  String get adminDayOfWeek => '曜日';

  @override
  String get adminSearchPlugins => 'プラグインを検索...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'プラグインを切り替えられませんでした: $error';
  }

  @override
  String get adminUninstallPlugin => 'プラグインのアンインストール';

  @override
  String adminUninstallPluginConfirm(String name) {
    return '「$name」をアンインストールしてもよろしいですか?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'プラグインをアンインストールできませんでした: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'パッケージをインストールできませんでした: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'アップデートをインストールできませんでした: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'プラグインの読み込みに失敗しました: $error';
  }

  @override
  String get adminNoPluginsMatchSearch => '検索に一致するプラグインはありません';

  @override
  String get adminNoPluginsInstalled => 'プラグインがインストールされていません';

  @override
  String adminInstallUpdate(String version) {
    return 'アップデートをインストール (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'カタログの読み込みに失敗しました: $error';
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
    return '「$name」はサーバーの再起動後に削除されます';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'アンインストールできませんでした: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return '「$name」を v$version に更新しています...';
  }

  @override
  String get adminMissingAuthToken => '設定を開けません: 認証トークンがありません。';

  @override
  String adminPluginLoadFailed(String error) {
    return 'プラグインの読み込みに失敗しました: $error';
  }

  @override
  String get adminPluginNotFound => 'プラグインが見つかりません';

  @override
  String adminPluginVersion(String version) {
    return 'バージョン $version';
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
    return '「$name」を削除してもよろしいですか?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'リポジトリを保存できませんでした: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'リポジトリの読み込みに失敗しました: $error';
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
    return 'プラグイン設定を読み込めません: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return '$uri を開けませんでした';
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
  String get adminTrickplaySaved => 'Trickplay 設定が保存されました';

  @override
  String get adminTrickplayLoadFailed => 'Trickplay 設定の読み込みに失敗しました';

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
  String get adminBaseUrlHint => '例: /jellyfin';

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
    return 'メタデータの読み込みに失敗しました: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'メタデータを保存できませんでした: $error';
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
    return 'メタデータを更新できませんでした: $error';
  }

  @override
  String get adminNoRemoteMatches => 'リモート一致が見つかりません';

  @override
  String get adminRemoteResults => 'リモート結果';

  @override
  String get adminRemoteMetadataApplied => 'リモートメタデータの適用';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'リモート検索に失敗しました: $error';
  }

  @override
  String get adminUpdateContentType => 'コンテンツタイプの更新';

  @override
  String get adminContentType => 'コンテンツタイプ';

  @override
  String get adminContentTypeUpdated => 'コンテンツタイプが更新されました';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'コンテンツ種別を更新できませんでした: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed => 'メタデータエディタのロードに失敗しました';

  @override
  String get adminNoPeopleEntries => '人のエントリーはありません';

  @override
  String get adminNoExternalIds => '使用可能な外部 ID がありません';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType 画像を更新しました';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return '画像をダウンロードできませんでした: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'サポートされていない画像形式です';

  @override
  String get adminImageReadFailed => '選択した画像の読み込みに失敗しました';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType 画像をアップロードしました';
  }

  @override
  String adminImageUploadFailed(String error) {
    return '画像をアップロードできませんでした: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return '$imageType 画像を削除';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType 画像を削除しました';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return '画像を削除できませんでした: $error';
  }

  @override
  String get adminAllProviders => 'すべてのプロバイダー';

  @override
  String get adminNoRemoteImages => 'リモートイメージが見つかりません';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'チューナーの検出に失敗しました: $error';
  }

  @override
  String get adminAddTuner => 'チューナーの追加';

  @override
  String get adminEditTuner => 'チューナーを編集';

  @override
  String get adminTunerTypeM3u => 'M3U チューナー';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'ファイルまたは URL';

  @override
  String get adminTunerIpAddress => 'チューナーの IP アドレス';

  @override
  String get adminTunerFriendlyName => '表示名';

  @override
  String get adminTunerUserAgent => 'ユーザーエージェント';

  @override
  String get adminTunerCount => '同時接続数の上限';

  @override
  String get adminTunerCountHelp => 'チューナーが同時に許可するストリームの最大数です。0 にすると無制限になります。';

  @override
  String get adminTunerFallbackBitrate => '代替の最大ストリーミングビットレート';

  @override
  String get adminTunerImportFavoritesOnly => 'お気に入りチャンネルのみを取り込む';

  @override
  String get adminTunerAllowHwTranscoding => 'ハードウェアトランスコードを許可する';

  @override
  String get adminTunerAllowFmp4 => 'fMP4 トランスコードコンテナーを許可する';

  @override
  String get adminTunerAllowStreamSharing => 'ストリームの共有を許可する';

  @override
  String get adminTunerEnableStreamLooping => 'ストリームのループを有効にする';

  @override
  String get adminTunerIgnoreDts => 'DTS を無視する';

  @override
  String get adminTunerReadAtNativeFramerate => '入力をネイティブのフレームレートで読み込む';

  @override
  String get adminEditProvider => 'プロバイダーを編集';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'ファイルまたは URL';

  @override
  String get adminXmltvMoviePrefix => '映画の接頭辞';

  @override
  String get adminXmltvMovieCategories => '映画のカテゴリー';

  @override
  String get adminXmltvCategoriesHelp => '複数のカテゴリーは縦棒 (|) で区切ってください。';

  @override
  String get adminXmltvKidsCategories => 'キッズのカテゴリー';

  @override
  String get adminXmltvNewsCategories => 'ニュースのカテゴリー';

  @override
  String get adminXmltvSportsCategories => 'スポーツのカテゴリー';

  @override
  String get adminSdUsername => 'ユーザー名';

  @override
  String get adminSdPassword => 'パスワード';

  @override
  String get adminSdCountry => '国';

  @override
  String get adminSdCountrySelect => '国を選択';

  @override
  String get adminSdPostalCode => '郵便番号';

  @override
  String get adminSdGetListings => '番組リストを取得';

  @override
  String get adminSdListings => '番組リスト';

  @override
  String get adminEnableAllTuners => 'すべてのチューナーを有効にする';

  @override
  String get adminTunerType => 'チューナーの種類';

  @override
  String get adminTunerAdded => 'チューナーを追加しました';

  @override
  String adminTunerAddFailed(String error) {
    return 'チューナーを追加できませんでした: $error';
  }

  @override
  String get adminAddGuideProvider => 'ガイドプロバイダーの追加';

  @override
  String get adminProviderType => 'プロバイダーの種類';

  @override
  String get adminProviderAdded => 'プロバイダーが追加されました';

  @override
  String adminProviderAddFailed(String error) {
    return 'プロバイダーを追加できませんでした: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'チューナーを削除できませんでした: $error';
  }

  @override
  String get adminTunerResetRequested => 'チューナーのリセットが要求されました';

  @override
  String adminTunerResetFailed(String error) {
    return 'チューナーをリセットできませんでした: $error';
  }

  @override
  String get adminTunerResetNotSupported => 'この種類のチューナーはリセットに対応していません。';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'プロバイダーを削除できませんでした: $error';
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
  String get adminMovieRecordingPath => '映画の録画先パス';

  @override
  String get adminGuideDays => '番組表データの日数';

  @override
  String get adminGuideDaysAuto => '自動';

  @override
  String adminGuideDaysValue(int days) {
    return '$days 日';
  }

  @override
  String get adminRecordingPostProcessor => '後処理アプリケーションのパス';

  @override
  String get adminRecordingPostProcessorArgs => '後処理の引数';

  @override
  String get adminSaveRecordingNfo => '録画の NFO メタデータを保存する';

  @override
  String get adminSaveRecordingImages => '録画の画像を保存する';

  @override
  String get adminLiveTvSectionTiming => 'タイミング';

  @override
  String get adminLiveTvSectionPaths => '録画先パス';

  @override
  String get adminLiveTvSectionPostProcessing => '後処理';

  @override
  String adminGuideDaysDisplay(String value) {
    return '番組表データ: $value';
  }

  @override
  String get adminRecordingSettingsSaved => '録音設定が保存されました';

  @override
  String adminSettingsSaveFailed(String error) {
    return '設定を保存できませんでした: $error';
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
    return 'マッピングを更新できませんでした: $error';
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
  String get adminRefreshGuideData => '番組表データを更新';

  @override
  String get adminGuideRefreshStarted => '番組表データの更新を開始しました';

  @override
  String get adminGuideRefreshUnavailable => 'このサーバーでは番組表の更新タスクを利用できません。';

  @override
  String get adminAddProvider => 'プロバイダーの追加';

  @override
  String get adminNoListingProviders => 'リストプロバイダーが構成されていません';

  @override
  String adminRecordingPathDisplay(String path) {
    return '録画先パス: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'シリーズのパス: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return '前の余裕時間: $minutes 分';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return '後の余裕時間: $minutes 分';
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
    return 'バックアップ $name を今すぐ復元しますか?';
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
  String get adminApply => '適用';

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
    return '$minutes 分前';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours 時間前';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$days 日前';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return '$fileName を読み込めませんでした';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count 件一致';
  }

  @override
  String get adminLogViewerNoMatches => '一致する行はありません';

  @override
  String get adminMetadataEditorTitle => 'メタデータエディター';

  @override
  String get adminMetadataIdentify => '識別';

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
    return '$imageType 画像を更新しました';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType 画像をアップロードしました';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType 画像を削除しました';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return '画像をダウンロードできませんでした: $error';
  }

  @override
  String get adminMetadataImageReadFailed => '選択した画像の読み込みに失敗しました';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return '画像をアップロードできませんでした: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return '$imageType 画像を削除';
  }

  @override
  String get adminMetadataDeleteImageContent => 'これにより、現在の画像がアイテムから削除されます。';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return '画像を削除できませんでした: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return '$imageType 画像を選択';
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
    return 'アップデートがあります: v$version';
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
    return 'アップデートをインストール (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults => '検索に一致するパッケージはありません';

  @override
  String get adminPluginsCatalogEmpty => '利用可能なパッケージはありません';

  @override
  String adminPluginsInstalling(String name) {
    return '「$name」をインストールしています...';
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
    return '$name の設定';
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
    return 'リポジトリの読み込みに失敗しました: $error';
  }

  @override
  String get adminReposRemoveTitle => 'リポジトリの削除';

  @override
  String adminReposRemoveConfirm(String name) {
    return '「$name」を削除してもよろしいですか?';
  }

  @override
  String get adminReposRemove => '削除';

  @override
  String adminReposSaveFailed(String error) {
    return 'リポジトリを保存できませんでした: $error';
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
  String get adminBrandingSplashUpload => '画像をアップロード';

  @override
  String get adminBrandingSplashUploaded => 'スプラッシュ画面を更新しました';

  @override
  String get adminBrandingSplashUploadFailed => 'スプラッシュ画面をアップロードできませんでした';

  @override
  String get adminBrandingSplashDeleted => 'スプラッシュ画面を削除しました';

  @override
  String get adminBrandingNoSplash => 'カスタムスプラッシュ画面はありません';

  @override
  String get adminPlaybackHwAccel => 'ハードウェアアクセラレーション';

  @override
  String get adminPlaybackHwAccelLabel => 'ハードウェアアクセラレーション';

  @override
  String get adminPlaybackEnableHwEncoding => 'ハードウェアエンコーディングを有効にする';

  @override
  String get adminPlaybackEnableHwDecoding => '以下のハードウェア デコードを有効にします。';

  @override
  String get adminPlaybackQsvDevice => 'QSV デバイス';

  @override
  String get adminPlaybackEnhancedNvdec => '拡張 NVDEC デコーダーを有効にする';

  @override
  String get adminPlaybackPreferNativeDecoder => 'システム標準のハードウェアデコーダーを優先する';

  @override
  String get adminPlaybackColorDepth => 'ハードウェアデコードの色深度';

  @override
  String get adminPlaybackColorDepth10Hevc => '10 ビット HEVC デコード';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10 ビット VP9 デコード';

  @override
  String get adminPlaybackColorDepth10HevcRext => 'HEVC RExt 8/10 ビットデコード';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'HEVC RExt 12 ビットデコード';

  @override
  String get adminPlaybackHwEncodingSection => 'ハードウェアエンコード';

  @override
  String get adminPlaybackAllowHevcEncoding => 'HEVC エンコードを許可する';

  @override
  String get adminPlaybackAllowAv1Encoding => 'AV1 エンコードを許可する';

  @override
  String get adminPlaybackIntelLowPowerH264 => 'Intel 低消費電力 H.264 エンコーダーを有効にする';

  @override
  String get adminPlaybackIntelLowPowerHevc => 'Intel 低消費電力 HEVC エンコーダーを有効にする';

  @override
  String get adminPlaybackToneMapping => 'トーンマッピング';

  @override
  String get adminPlaybackEnableTonemapping => 'トーンマッピングを有効にする';

  @override
  String get adminPlaybackEnableVppTonemapping => 'VPP トーンマッピングを有効にする';

  @override
  String get adminPlaybackEnableVtTonemapping => 'VideoToolbox トーンマッピングを有効にする';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'トーンマッピングのアルゴリズム';

  @override
  String get adminPlaybackTonemappingMode => 'トーンマッピングのモード';

  @override
  String get adminPlaybackTonemappingRange => 'トーンマッピングのレンジ';

  @override
  String get adminPlaybackTonemappingDesat => 'トーンマッピングの彩度低下';

  @override
  String get adminPlaybackTonemappingPeak => 'トーンマッピングのピーク';

  @override
  String get adminPlaybackTonemappingParam => 'トーンマッピングのパラメーター';

  @override
  String get adminPlaybackVppTonemappingBrightness => 'VPP トーンマッピングの明るさ';

  @override
  String get adminPlaybackVppTonemappingContrast => 'VPP トーンマッピングのコントラスト';

  @override
  String get adminPlaybackPresetsQuality => 'プリセットと画質';

  @override
  String get adminPlaybackEncoderPreset => 'エンコーダープリセット';

  @override
  String get adminPlaybackH264Crf => 'H.264 エンコードの CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) エンコードの CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => 'インターレース解除の方式';

  @override
  String get adminPlaybackDeinterlaceDoubleRate => 'インターレース解除時にフレームレートを 2 倍にする';

  @override
  String get adminPlaybackAudioSection => 'オーディオ';

  @override
  String get adminPlaybackEnableAudioVbr => 'オーディオの VBR エンコードを有効にする';

  @override
  String get adminPlaybackDownmixBoost => 'オーディオダウンミックスのブースト';

  @override
  String get adminPlaybackDownmixAlgorithm => 'ステレオダウンミックスのアルゴリズム';

  @override
  String get adminPlaybackMaxMuxingQueue => '多重化キューの最大サイズ';

  @override
  String get adminPlaybackAutoOption => '自動';

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
  String get adminRunningTasks => '実行中のタスク';

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
    return '毎日 $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return '毎週$day $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return '$durationごと';
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
      other: '$count 時間',
      one: '1 時間',
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
    return '$days 日前';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours 時間前';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes 分前';
  }

  @override
  String get adminActivityNow => '今';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes 分';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours 時間';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days 日';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$month/$day';
  }

  @override
  String get adminTrickplayDescription =>
      'シークプレビューのサムネイル用に Trickplay 画像の生成を設定します。';

  @override
  String get adminNetworkingPublicHttpsPort => 'パブリックHTTPSポート';

  @override
  String get adminNetworkingBaseUrl => 'ベース URL';

  @override
  String get adminNetworkingBaseUrlHint => '例: /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => '公開 HTTP ポート';

  @override
  String get adminNetworkingRequireHttps => 'HTTPS を必須にする';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'リモートからのリクエストをすべて HTTPS にリダイレクトします。サーバーに有効な証明書がない場合は効果がありません。';

  @override
  String get adminNetworkingCertPassword => '証明書のパスワード';

  @override
  String get adminNetworkingIpSettings => 'IP 設定';

  @override
  String get adminNetworkingEnableIpv4 => 'IPv4 を有効にする';

  @override
  String get adminNetworkingEnableIpv6 => 'IPv6 を有効にする';

  @override
  String get adminNetworkingAutoDiscovery => 'ポートの自動マッピングを有効にする';

  @override
  String get adminNetworkingLocalSubnets => 'LAN ネットワーク';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'ローカルネットワークとして扱う IP アドレスまたは CIDR サブネットを、カンマまたは改行で区切って入力します。';

  @override
  String get adminNetworkingPublishedUris => '公開サーバー URI';

  @override
  String get adminNetworkingPublishedUriHint =>
      'サブネットまたはアドレスを公開 URL に対応付けます (例: all=https://example.com)';

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
  String get adminPlaybackThrottleDelay => 'スロットリングの遅延 (秒)';

  @override
  String get adminPlaybackEnableSubtitleExtraction => '字幕のオンザフライ抽出を許可する';

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
    return 'コンテンツ種別を更新できませんでした: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => '低速応答しきい値 (ms)';

  @override
  String get adminGeneralEnableSlowResponse => '応答遅延の警告を有効にする';

  @override
  String get adminGeneralQuickConnect => 'Quick Connect を有効にする';

  @override
  String get adminGeneralSectionServer => 'サーバー';

  @override
  String get adminGeneralSectionMetadata => 'メタデータ';

  @override
  String get adminGeneralSectionPaths => 'パス';

  @override
  String get adminGeneralSectionPerformance => 'パフォーマンス';

  @override
  String get adminGeneralCachePath => 'キャッシュパス';

  @override
  String get adminGeneralMetadataPath => 'メタデータのパス';

  @override
  String get adminGeneralServerName => 'サーバー名';

  @override
  String get adminGeneralDisplayLanguage => '優先する表示言語';

  @override
  String get adminSettingsLoadFailed => '設定の読み込みに失敗しました';

  @override
  String get adminDiscover => '発見する';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'マッピングを更新できませんでした: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return '制限時間: $duration';
  }

  @override
  String get folders => 'フォルダー';

  @override
  String get libraries => 'ライブラリ';

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
      other: '# 人が参加中',
      one: '# 人が参加中',
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
    return 'アイテム $index';
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
    return '$userName が SyncPlay グループに参加しました';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName が SyncPlay グループから退出しました';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay アクセスが拒否されました';

  @override
  String get syncPlayAccessDeniedMessage =>
      'この SyncPlay グループ内の 1 つ以上の項目にアクセスできません。グループ所有者にライブラリの権限を確認するか、別のキューを選択するように依頼してください。';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return '$groupName と再生を同期しています';
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
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# 行を検出',
      one: '# 行を検出',
    );
    return '$_temp0';
  }

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
  String get offlineBannerTitle => 'オフラインです';

  @override
  String get offlineBannerSubtitle => 'ダウンロード済みの項目を表示しています';

  @override
  String get offlineBannerAction => 'ダウンロード';

  @override
  String get serverUnreachableBannerTitle => 'サーバーに接続できません';

  @override
  String get serverUnreachableBannerSubtitle => '復旧するまでダウンロード済みの項目を再生します';

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
    return 'キャストの操作に失敗しました: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind のコントロール';
  }

  @override
  String get castDeviceVolume => 'デバイスボリューム';

  @override
  String get castVolumeUnavailable => '利用不可';

  @override
  String castStopKind(String kind) {
    return '$kind を停止';
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
    return '$length 桁の PIN を入力してください';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return '$length 桁の PIN を入力してください';
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
  String get quickConnectAuthorized => 'Quick Connect のリクエストが承認されました。';

  @override
  String get quickConnectInvalidOrExpired => 'Quick Connect のコードが無効か期限切れです。';

  @override
  String get quickConnectNotSupported => 'このサーバーでは Quick Connect がサポートされていません。';

  @override
  String get quickConnectAuthorizeFailed => 'Quick Connect のコードを承認できませんでした。';

  @override
  String get quickConnectDisabled => 'このサーバーでは Quick Connect が無効になっています。';

  @override
  String get quickConnectForbidden =>
      'お使いのアカウントではこの Quick Connect リクエストを承認できません。';

  @override
  String get quickConnectNotFound =>
      'Quick Connect のコードが見つかりませんでした。新しいコードをお試しください。';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect に失敗しました: $message';
  }

  @override
  String get quickConnectEnterCode => 'コードを入力してください';

  @override
  String get quickConnectAuthorize => '承認する';

  @override
  String remoteCommandFailed(String error) {
    return 'コマンドに失敗しました: $error';
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
    return 'キャストを開始できませんでした: $error';
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
    return '$name をダウンロードしています...';
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
  String get shuffleLibrary => 'ライブラリ';

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
    return '$segmentをスキップ';
  }

  @override
  String get liveTv => 'ライブテレビ';

  @override
  String get continueWatchingAndNextUp => '視聴を続けて次へ';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'ダウンロード中 $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return '$fileName をダウンロードしています';
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
  String get playerTooltipPrevious => '前へ';

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
  String get contextMenuHideFromContinueWatching => '「視聴を続ける」から削除';

  @override
  String get contextMenuHideFromNextUp => '「次のエピソード」から削除';

  @override
  String get contextMenuAddToCollection => 'コレクションに追加';

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
  String get settingsConnectionSection => '接続';

  @override
  String get settingsAllowSelfSignedCerts => '自己署名証明書を許可する';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      '自己署名またはプライベート CA の TLS 証明書を使うサーバーを信頼します。ご自身が管理するサーバーでのみ有効にしてください。この設定はすべての接続で証明書の検証を無効にします。';

  @override
  String get settingsPrivacyAndSafetySection => 'プライバシーと安全性';

  @override
  String get settingsBlockedRatings => 'ブロックされた評価';

  @override
  String get settingsGeneralStyle => '一般的なスタイル';

  @override
  String get settingsGeneralStyleSubtitle => 'テーマのアクセント、背景、注目のインジケーター、テーマ音楽';

  @override
  String get settingsDetailsScreen => '詳細画面';

  @override
  String get settingsDetailsScreenSubtitle => 'スタイル、背景のぼかし、タブの動作';

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
  String get settingsShowSeerrButtonInNavigation =>
      'ナビゲーションバーに Seerr ボタンを表示します';

  @override
  String get settingsAlwaysExpandNavbarLabels => '上部ナビゲーションバーに文字ラベルを常に表示します';

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
  String get settingsSupportMoonfinSubtitle => '開発者にコーヒーを 1 杯おごる';

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
      other: '# 件のライセンス表記',
      one: '# 件のライセンス表記',
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
  String get settingsMediaSegmentCountdown => 'メディアセグメントのカウントダウン';

  @override
  String get settingsProgressBar => '進行状況バー';

  @override
  String get settingsTimer => 'タイマー';

  @override
  String get settingsNone => 'なし';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (旧方式)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (レガシー)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (推奨)';

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
  String recentlyReleasedLibraryName(String libraryName) {
    return '最近公開された$libraryName';
  }

  @override
  String get autoplayNextEpisode => '次のエピソードを自動再生';

  @override
  String get autoplayNextEpisodeSubtitle => '次のエピソードがある場合は自動的に再生します。';

  @override
  String get skipSilenceTitle => '無音部分をスキップ';

  @override
  String get skipSilenceSubtitle => 'ストリームが対応している場合、無音部分を自動的にスキップします。';

  @override
  String get allowExternalAudioEffectsTitle => '外部の音響エフェクトを許可';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'イコライザーやエフェクトのアプリ (Wavelet など) が Media3 の再生セッションに接続できるようにします。';

  @override
  String get disableTunnelingTitle => 'トンネリングを無効にする';

  @override
  String get disableTunnelingSubtitle =>
      'トンネリングを使わない再生を強制します。トンネリング時に音声と映像が途切れるデバイスで有効です。';

  @override
  String get enableTunnelingTitle => 'トンネリングを有効にする';

  @override
  String get enableTunnelingSubtitle =>
      '上級者向け。音声と映像を連携したハードウェア経路で処理します。一部のデバイスで音声や映像が途切れるため、既定ではオフです。';

  @override
  String get mapDolbyVisionP7Title => 'Dolby Vision プロファイル 7 を HEVC にマッピング';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Dolby Vision 非対応のデバイスで、プロファイル 7 のストリームを HDR10 互換の HEVC として再生します。';

  @override
  String get subtitlesUseEmbeddedStyles => '字幕に埋め込まれたスタイルを使用';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      '字幕トラックに埋め込まれた色、フォント、表示位置を適用します。オフにすると、ご自身の字幕スタイル設定が使用されます。';

  @override
  String get subtitlesUseEmbeddedFontSizes => '字幕に埋め込まれた文字サイズを使用';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      '字幕トラックに埋め込まれた文字サイズの指定を適用します。オフにすると、スタイル設定の字幕サイズが使用されます。';

  @override
  String get showMediaDetailsOnLibraryPage => 'メディアの詳細を表示';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'ライブラリページの上部に、選択中のアイテムの詳細を表示します。';

  @override
  String get hideBackdropsInLibraries => '閲覧中は背景画像を非表示にしますか?';

  @override
  String get useDetailedSubHeadings => '詳細な小見出しを使用';

  @override
  String get useDetailedSubHeadingsDescription =>
      'ライブラリページで詳細な小見出しを表示するか、簡易表示にするかを選びます。';

  @override
  String get savedThemesDeleteDialogTitle => '保存したテーマを削除しますか?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return '「$themeName」をこのデバイスのキャッシュから削除しますか?';
  }

  @override
  String get themeStore => 'テーマストア';

  @override
  String get themeStoreSubtitle => 'コミュニティのテーマを探して保存できます';

  @override
  String get themeStoreDescription => 'テーマを保存すると、他の保存済みテーマと同じように使用できます。';

  @override
  String get themeStoreEmpty => '現在利用できるテーマはありません。';

  @override
  String get themeStoreLoadFailed => 'テーマストアを読み込めませんでした。接続を確認してもう一度お試しください。';

  @override
  String get themeStoreSave => '保存';

  @override
  String get themeStoreSaveAndApply => '保存して適用';

  @override
  String get themeStoreSaved => '保存済み';

  @override
  String get themeStoreInvalidMessage => 'このテーマを読み込めませんでした。';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '「$themeName」を保存しました。';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '「$themeName」をこのデバイスから削除しました。';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '「$themeName」を削除できませんでした。';
  }

  @override
  String get savedThemesTitle => '保存したテーマ';

  @override
  String get savedThemesDescription =>
      '現在のサーバーの Moonfin プラグインからダウンロードしたテーマです。削除してもこのデバイス上のコピーが消えるだけです。';

  @override
  String get savedThemesEmpty => 'このサーバーの保存済みテーマは見つかりませんでした。';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • 現在使用中';
  }

  @override
  String get savedThemesDeleteTooltip => '保存したテーマを削除';

  @override
  String get savedThemesManageSubtitle => 'このデバイスにダウンロードしたプラグインのテーマを管理します';

  @override
  String get themeEditor => 'テーマエディター';

  @override
  String get themeEditorSubtitle => 'ブラウザーで Moonfin テーマエディターを開きます';

  @override
  String get homeScreen => 'ホーム画面';

  @override
  String get bottomBar => '下部バー';

  @override
  String get homeRowsStyleClassic => 'クラシック';

  @override
  String get homeRowsStyleModern => 'モダン';

  @override
  String get homeRowsSection => 'ホーム行';

  @override
  String get homeRowDisplay => 'ホーム行の表示';

  @override
  String get homeRowSections => 'ホーム行のセクション';

  @override
  String get homeRowToggles => 'ホーム行の切り替え';

  @override
  String get homeRowTogglesSubtitle => 'ライブラリごとのホーム行カテゴリーを有効または無効にします';

  @override
  String get homeRowTogglesDescription => '以下をオンにすると、ホームセクションに対応する行が表示されます。';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'クラシックは行ごとの画像タイプと情報オーバーレイを維持します。モダンは縦長から横長へ変化する行を使用します。';

  @override
  String get displayFavoritesRows => 'お気に入りの行を表示';

  @override
  String get displayFavoritesRowsSubtitle =>
      'お気に入りの映画やシリーズなどの行をホームセクションに表示します。';

  @override
  String get favoritesRowSorting => 'お気に入りの行の並び順';

  @override
  String get favoritesRowSortingDescription => 'お気に入りの行を追加日、公開日、名前順などで並べ替えます。';

  @override
  String get displayCollectionsRows => 'コレクションの行を表示';

  @override
  String get displayCollectionsRowsSubtitle => 'コレクションの行をホームセクションに表示します。';

  @override
  String get collectionsRowSorting => 'コレクションの行の並び順';

  @override
  String get collectionsRowSortingDescription =>
      'コレクションの行を追加日、公開日、名前順などで並べ替えます。';

  @override
  String get displayGenresRows => 'ジャンルの行を表示';

  @override
  String get displayGenresRowsSubtitle => 'ジャンルの行をホームセクションに表示します。';

  @override
  String get genresRowSorting => 'ジャンルの行の並び順';

  @override
  String get genresRowSortingDescription => 'ジャンルの行を追加日、公開日、名前順などで並べ替えます。';

  @override
  String get genresRowItems => 'ジャンルの行のアイテム';

  @override
  String get genresRowItemsDescription => 'ジャンルの行に映画、シリーズ、またはその両方を表示します。';

  @override
  String get displayPlaylistsRows => 'プレイリストの行を表示';

  @override
  String get displayPlaylistsRowsSubtitle => 'プレイリストの行をホームセクションに表示します。';

  @override
  String get playlistsRowSorting => 'プレイリストの行の並び順';

  @override
  String get playlistsRowSortingDescription => 'プレイリストの行を追加日、公開日、名前順などで並べ替えます。';

  @override
  String get displayAudioRows => 'オーディオの行を表示';

  @override
  String get displayAudioRowsSubtitle => 'オーディオの行をホームセクションに表示します。';

  @override
  String get audioRowsSorting => 'オーディオの行の並び順';

  @override
  String get audioRowsSortingDescription => 'オーディオの行を追加日、公開日、名前順などで並べ替えます。';

  @override
  String get audioPlaylists => 'オーディオのプレイリスト';

  @override
  String get appearance => '外観';

  @override
  String get layout => 'レイアウト';

  @override
  String get theme => 'テーマ';

  @override
  String get keyboard => 'キーボード';

  @override
  String get navButtons => 'ボタン';

  @override
  String get rendering => 'レンダリング';

  @override
  String get mpvConfiguration => 'MPV の設定';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => '外部プレイヤーアプリ';

  @override
  String get externalPlayerAppDescription => '外部プレイヤーを設定すると、長押しで再生する項目が有効になります';

  @override
  String get externalPlayerAskEachTimeSubtitle => '再生開始時にアプリの選択画面を表示します。';

  @override
  String get loadingInstalledPlayers => 'インストール済みのプレイヤーを読み込んでいます...';

  @override
  String get connection => '接続';

  @override
  String get audioTranscodeTarget => 'オーディオの変換先形式';

  @override
  String get passthrough => 'パススルー';

  @override
  String get supportedOnThisDevice => 'このデバイスで対応しています';

  @override
  String get notSupportedOnThisDevice => 'このデバイスでは対応していません';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) パススルー';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'DTS:X (DTS UHD) を外部デコーダーにビットストリーム出力します。';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD with Atmos (JOC) パススルー';

  @override
  String get mediaPlayerBehavior => 'メディアプレイヤーの動作';

  @override
  String get playbackEnhancements => '再生の拡張機能';

  @override
  String get alwaysOn => '常にオンです。';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      '「エンディングをスキップ」を「次のエピソード」表示に置き換える';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      '「エンディングをスキップ」ボタンの代わりに「次のエピソード」のオーバーレイを表示します。';

  @override
  String get playerRouting => 'プレイヤーの振り分け';

  @override
  String get preferSoftwareDecoders => 'ソフトウェアデコーダーを優先';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'ハードウェアデコーダーより先に FFmpeg (オーディオ) と libgav1 (AV1) を使用します。HDMI のオーディオパススルーが機能しない場合はオフにしてください。';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle => 'Android TV で、選択した外部アプリを使って動画を再生します。';

  @override
  String get automaticQueuing => '自動キュー追加';

  @override
  String get preferSdhSubtitles => 'SDH 字幕を優先';

  @override
  String get preferSdhSubtitlesSubtitle => '自動選択時に SDH / CC の字幕トラックを優先します。';

  @override
  String get webDiagnostics => 'Web 診断';

  @override
  String get webDiagnosticsTitle => 'Moonfin Web 診断';

  @override
  String get webDiagnosticsIntro =>
      'このページでは、ブラウザーの接続に関する問題 (CORS、混在コンテンツ、検出設定) を診断できます。';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      '混在コンテンツによるエラーを検出しました';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'CORS / プリフライトのエラーを検出しました';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin は、HTTPS のページから HTTP のサーバー URL を呼び出そうとしているのを検出しました。ブラウザーはこのリクエストをサーバーに届く前にブロックします。';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin はブラウザーレベルのリクエスト失敗を検出しました。多くの場合、メディアサーバー側で CORS やプリフライトのヘッダーが不足していることが原因です。';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return '対象 URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return '詳細: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => '現在の実行環境';

  @override
  String get webDiagnosticsOrigin => 'オリジン';

  @override
  String get webDiagnosticsScheme => 'スキーム';

  @override
  String get webDiagnosticsPluginMode => 'プラグインモード';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC スキャン';

  @override
  String get webDiagnosticsForcedServerUrl => '強制サーバー URL';

  @override
  String get webDiagnosticsDefaultServerUrl => '既定のサーバー URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => '検出プロキシの URL';

  @override
  String get notConfigured => '未設定';

  @override
  String get webDiagnosticsMixedContent => '混在コンテンツ';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'このページは HTTPS で読み込まれていますが、設定された URL に HTTP のものが含まれています。ブラウザーは HTTPS のページから HTTP の API を呼び出すことをブロックします。';

  @override
  String get webDiagnosticsMixedContentFix =>
      '対処法: メディアサーバーまたはプロキシのエンドポイントを HTTPS で公開するか、信頼できるローカルネットワークでのみ Moonfin を HTTP で読み込んでください。';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      '現在の実行時設定からは、明らかな混在コンテンツの構成は検出されませんでした。';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS チェックリスト';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Access-Control-Allow-Origin でブラウザーのオリジンを許可する。';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Access-Control-Allow-Headers に Authorization、X-Emby-Authorization、X-Emby-Token を含める。';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• ストリーミングとシークのために Content-Range と Accept-Ranges を公開する。';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• OPTIONS のプリフライトリクエストに 204 を返す。';

  @override
  String get webDiagnosticsHeaderSnippetTitle => 'ヘッダーの記述例 (nginx 形式)';

  @override
  String get note => '注意';

  @override
  String get webDiagnosticsNonWebNote =>
      'この診断ページは Web 版向けです。他のプラットフォームで表示されている場合、これらのチェックは当てはまらないことがあります。';

  @override
  String get backToServerSelect => 'サーバー選択に戻る';

  @override
  String get signOutAllUsers => 'すべてのユーザーをサインアウト';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'マイクの使用が完全に拒否されています。システム設定で許可してください。';

  @override
  String get voiceSearchPermissionRequired => '音声検索にはマイクの使用許可が必要です。';

  @override
  String get voiceSearchNoMatch => '聞き取れませんでした。もう一度お試しください。';

  @override
  String get voiceSearchNoSpeechDetected => '音声を検出できませんでした。';

  @override
  String get voiceSearchMicrophoneError => 'マイクのエラーです。';

  @override
  String get voiceSearchNeedsInternet => '音声検索にはインターネット接続が必要です。';

  @override
  String get voiceSearchServiceBusy => '音声サービスが混雑しています。もう一度お試しください。';

  @override
  String get microphonePermissionPermanentlyDenied => 'マイクの使用が完全に拒否されています。';

  @override
  String get microphonePermissionDenied => 'マイクの使用が拒否されています。';

  @override
  String get speechRecognitionUnavailable => 'このデバイスでは音声認識を利用できません。';

  @override
  String get openIosRoutePicker => 'iOS の出力先選択を開く';

  @override
  String get airPlayRoutePickerUnavailable =>
      'このデバイスでは AirPlay の出力先選択を利用できません。';

  @override
  String get videos => '動画';

  @override
  String get programs => '番組';

  @override
  String get songs => '曲';

  @override
  String get photoAlbums => 'フォトアルバム';

  @override
  String get photos => '写真';

  @override
  String get people => '人物';

  @override
  String get recentlyReleasedEpisodes => '最近公開されたエピソード';

  @override
  String get watchAgain => 'もう一度見る';

  @override
  String get guestAppearances => 'ゲスト出演';

  @override
  String get appearancesSeerr => '出演 (Seerr)';

  @override
  String get crewContributionsSeerr => 'スタッフとしての参加 (Seerr)';

  @override
  String get watchWithGroup => 'グループで視聴';

  @override
  String get errors => 'エラー';

  @override
  String get warnings => '警告';

  @override
  String get disk => 'ディスク';

  @override
  String get openInBrowser => 'ブラウザーで開く';

  @override
  String get embeddedBrowserNotAvailable => 'このプラットフォームでは組み込みブラウザーを利用できません。';

  @override
  String get adminRestartServerConfirmation => 'サーバーを再起動してもよろしいですか?';

  @override
  String get adminShutdownServerConfirmation =>
      'サーバーをシャットダウンしてもよろしいですか? 再起動は手動で行う必要があります。';

  @override
  String get internal => '内部';

  @override
  String get idle => '待機中';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'ユーザーが見つかりません';

  @override
  String get adminNoUsersMatchSearch => '検索条件に一致するユーザーはありません';

  @override
  String get adminNoDevicesFound => 'デバイスが見つかりません';

  @override
  String get adminNoDevicesMatchCurrentFilters => '現在のフィルターに一致するデバイスはありません';

  @override
  String get passwordSet => 'パスワード設定済み';

  @override
  String get noPasswordConfigured => 'パスワードが設定されていません';

  @override
  String get remoteAccess => 'リモートアクセス';

  @override
  String get localOnly => 'ローカルのみ';

  @override
  String get adminMediaAnalyticsLoadFailed => 'メディア統計の読み込みに失敗しました';

  @override
  String get analyticsCombinedAcrossLibraries => 'すべてのメディアライブラリを合計した統計です。';

  @override
  String get analyticsTopArtists => '人気のアーティスト';

  @override
  String get analyticsTopAuthors => '人気の著者';

  @override
  String get analyticsTopContributors => '主な貢献者';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ライブラリ',
      one: '1 ライブラリ',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals => 'この選択に対する索引済みメディアの集計はまだありません。';

  @override
  String get analyticsLibraryDetails => 'ライブラリの詳細';

  @override
  String get analyticsLibraryBreakdown => 'ライブラリの内訳';

  @override
  String get analyticsNoLibrariesAvailable => '利用できるライブラリがありません。';

  @override
  String get adminServerAdministrationTitle => 'サーバー管理';

  @override
  String get adminServerPathData => 'データ';

  @override
  String get adminServerPathImageCache => '画像キャッシュ';

  @override
  String get adminServerPathCache => 'キャッシュ';

  @override
  String get adminServerPathLogs => 'ログ';

  @override
  String get adminServerPathMetadata => 'メタデータ';

  @override
  String get adminServerPathTranscode => 'トランスコード';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned => 'このサーバーからサーバーパスが返されませんでした。';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% 使用中';
  }

  @override
  String get userActivity => 'ユーザーのアクティビティ';

  @override
  String get systemEvents => 'システムイベント';

  @override
  String get needsAttention => '要確認';

  @override
  String get adminDrawerSectionServer => 'サーバー';

  @override
  String get adminDrawerSectionPlayback => '再生';

  @override
  String get adminDrawerSectionDevices => 'デバイス';

  @override
  String get adminDrawerSectionAdvanced => '詳細設定';

  @override
  String get adminDrawerSectionPlugins => 'プラグイン';

  @override
  String get adminDrawerSectionLiveTv => 'ライブ TV';

  @override
  String get homeVideos => 'ホームビデオ';

  @override
  String get mixedContent => '混合コンテンツ';

  @override
  String get homeVideosAndPhotos => 'ホームビデオと写真';

  @override
  String get mixedMoviesAndShows => '映画と番組の混合';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => '録画が見つかりません';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return '.$extension アーカイブ内に画像ページが見つかりませんでした。';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return '組み込みレンダラーでエラーが発生しました ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB レンダラーでエラーが発生しました ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'リーダー用のローカルファイルが見つかりません: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return '$uri から書籍データを開く際に HTTP $status が返されました';
  }

  @override
  String get noReadableBookEndpointAvailable => '読み込み可能な書籍のエンドポイントがありません';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return '対応していないコミックアーカイブ形式です: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'このプラットフォームでは CBR 展開プラグインを利用できません。';

  @override
  String get failedToExtractCbrArchive => '.cbr アーカイブを展開できませんでした。';

  @override
  String get cb7ExtractionUnavailable => 'このプラットフォームでは CB7 の展開を利用できません。';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'このプラットフォームでは CB7 展開プラグインを利用できません。';

  @override
  String get closeGenrePanel => 'ジャンルパネルを閉じる';

  @override
  String get loadingShuffle => 'シャッフルを準備しています...';

  @override
  String get libraryShuffleLabel => 'ライブラリシャッフル';

  @override
  String get randomShuffleLabel => 'ランダムシャッフル';

  @override
  String get genresShuffleLabel => 'ジャンルシャッフル';

  @override
  String get autoHdrSwitching => 'HDR の自動切り替え';

  @override
  String get autoHdrSwitchingDescription =>
      'HDR 動画の再生時に自動的に HDR を有効にし、終了時に表示モードを元に戻します。';

  @override
  String get whenFullscreen => '全画面表示のとき';

  @override
  String get changeArtwork => 'アートワークを変更';

  @override
  String get missing => 'なし';

  @override
  String get transcodingLimits => 'トランスコードの制限';

  @override
  String get clearAllArtworkButton => 'すべてのアートワークを消去しますか?';

  @override
  String get clearAllArtworkWarning => 'ダウンロード済みのアートワークをすべて消去してもよろしいですか?';

  @override
  String get confirmClear => '消去の確認';

  @override
  String confirmClearMessage(String itemType) {
    return 'この$itemTypeを消去してもよろしいですか?';
  }

  @override
  String get uploadButton => 'アップロードしますか?';

  @override
  String get resolutionLabel => '解像度: ';

  @override
  String get onlyShowInterfaceLanguage => '表示言語のアートワークのみを表示';

  @override
  String get confirmClearAll => 'すべて消去の確認';

  @override
  String get imageUploadSuccess => '画像をアップロードしました!';

  @override
  String imageUploadFailed(String error) {
    return '画像をアップロードできませんでした: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return '画像を設定できませんでした: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return '画像を削除できませんでした: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'すべてのアートワークを消去できませんでした: $error';
  }

  @override
  String get yes => 'はい';

  @override
  String get posterCategory => 'ポスター';

  @override
  String get backdropsCategory => '背景画像';

  @override
  String get bannerCategory => 'バナー';

  @override
  String get logoCategory => 'ロゴ';

  @override
  String get thumbnailCategory => 'サムネイル';

  @override
  String get artCategory => 'アート';

  @override
  String get discArtCategory => 'ディスクアート';

  @override
  String get screenshotCategory => 'スクリーンショット';

  @override
  String get boxCoverCategory => 'ボックスカバー';

  @override
  String get boxRearCoverCategory => 'ボックス裏面カバー';

  @override
  String get menuArtCategory => 'メニューアート';

  @override
  String get confirmItemPoster => 'ポスター';

  @override
  String get confirmItemBackdrop => '背景画像';

  @override
  String get confirmItemBanner => 'バナー';

  @override
  String get confirmItemLogo => 'ロゴ';

  @override
  String get confirmItemThumbnail => 'サムネイル';

  @override
  String get confirmItemArt => 'アート';

  @override
  String get confirmItemDiscArt => 'ディスクアート';

  @override
  String get confirmItemScreenshot => 'スクリーンショット';

  @override
  String get confirmItemBoxCover => 'ボックスカバー';

  @override
  String get confirmItemBoxRearCover => 'ボックス裏面カバー';

  @override
  String get confirmItemMenuArt => 'メニューアート';

  @override
  String get resolutionAll => 'すべて';

  @override
  String get resolutionHigh => '高 (1080p 以上)';

  @override
  String get resolutionMedium => '中 (720p)';

  @override
  String get resolutionLow => '低 (720p 未満)';

  @override
  String get sources => '提供元';

  @override
  String get audiobookChapters => 'チャプター';

  @override
  String get audiobookBookmarks => 'ブックマーク';

  @override
  String get audiobookNotes => 'メモ';

  @override
  String get audiobookQueue => 'キュー';

  @override
  String get audiobookTimeline => 'タイムライン';

  @override
  String get audiobookTimelineEmpty => 'タイムラインは空です';

  @override
  String get audiobookWholeBook => '本全体';

  @override
  String get audiobookFocusedTimeline => '注目のタイムライン';

  @override
  String get audiobookExportBookmarks => 'ブックマークを書き出す';

  @override
  String get audiobookExportNotes => 'メモを書き出す';

  @override
  String get audiobookExportAll => 'すべて書き出す';

  @override
  String audiobookExportSuccess(String path) {
    return '$path に書き出しました';
  }

  @override
  String audiobookExportFailed(String error) {
    return '書き出しに失敗しました: $error';
  }

  @override
  String get audiobookLyrics => '歌詞';

  @override
  String get audiobookAddBookmark => 'ブックマークを追加';

  @override
  String get audiobookAddNote => 'メモを追加';

  @override
  String get audiobookEditNote => 'メモを編集';

  @override
  String get audiobookNoteHint => 'この場面のメモを書く';

  @override
  String get audiobookSleepTimer => 'スリープタイマー';

  @override
  String get audiobookSleepOff => 'オフ';

  @override
  String get audiobookSleepEndOfChapter => 'チャプターの終わり';

  @override
  String get audiobookSleepCustom => 'カスタム';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '残り $remaining';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 分',
      one: '1 分',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => '再生速度';

  @override
  String get audiobookRemainingTime => '残り';

  @override
  String get audiobookElapsedTime => '経過';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return '$seconds 秒戻る';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return '$seconds 秒進む';
  }

  @override
  String get audiobookPreviousChapter => '前のチャプター';

  @override
  String get audiobookNextChapter => '次のチャプター';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'チャプター $current / $total';
  }

  @override
  String get audiobookNoChapters => 'チャプターはありません';

  @override
  String get audiobookNoBookmarks => 'まだブックマークはありません';

  @override
  String get audiobookNoNotes => 'まだメモはありません';

  @override
  String audiobookBookmarkAdded(String position) {
    return '$position にブックマークを追加しました';
  }

  @override
  String get audiobookSpeedReset => '1.0x に戻す';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => '保存';

  @override
  String get audiobookCancel => 'キャンセル';

  @override
  String get audiobookDelete => '削除';

  @override
  String get subtitlePreferences => '字幕の設定';

  @override
  String get subtitlePreferencesDescription => '字幕モード、既定の言語、外観、描画方法を変更します。';

  @override
  String get subtitleRendering => '字幕の描画';

  @override
  String get displayOptions => '表示オプション';

  @override
  String get releaseDateAscending => '公開日 (古い順)';

  @override
  String get releaseDateDescending => '公開日 (新しい順)';

  @override
  String get groupContributions => '参加作品のグループ化';

  @override
  String get groupMultipleRoles => '複数の役割をまとめる';

  @override
  String get libraryWriteAccessWarningTitle => 'ライブラリの書き込み権限に関する警告';

  @override
  String get libraryWriteAccessHowToFix => '対処方法:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. サーバー上のメディアライブラリフォルダーに対して、Jellyfin のサービスユーザー (jellyfin や Docker の PUID/PGID など) に書き込み権限を付与してください。\n\n2. または、Jellyfin のダッシュボード -> ライブラリ でこのライブラリを編集し、「アートワークをメディアフォルダーに保存する」を無効にして、アートワークを Jellyfin の内部データベースに保存してください。';

  @override
  String get dismiss => '閉じる';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return '「$libraryName」ライブラリは、アートワークをメディアフォルダーに直接保存する設定になっています (「アートワークをメディアフォルダーに保存する」が有効です)。しかし Jellyfin が書き込みを確認したところ、次のディレクトリにファイルを書き込む権限がありませんでした:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Jellyfin がアートワークを更新できなかったようです。このライブラリは、アートワークをメディアフォルダーに直接保存する設定になっています (「アートワークをメディアフォルダーに保存する」が有効です)。このエラーは通常、Jellyfin サーバーのプロセスにメディアディレクトリへの書き込み権限がない場合に発生します。';

  @override
  String get externalLists => '外部リスト';

  @override
  String get replay => 'もう一度再生';

  @override
  String get fileInformation => 'ファイル情報';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'サイズ: $size  •  形式: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'すべてのオーディオトラック ($count) を表示';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'すべての字幕トラック ($count) を表示';
  }

  @override
  String get checkingDirectPlay => 'ダイレクト再生に対応しているか確認しています...';

  @override
  String get directPlayCapabilityLabel => 'ダイレクト再生の可否: ';

  @override
  String get forced => '強制';

  @override
  String get transcodeContainerNotSupported => 'コンテナー形式にプレイヤーが対応していません。';

  @override
  String get transcodeVideoCodecNotSupported => '映像コーデックに対応していません。';

  @override
  String get transcodeAudioCodecNotSupported => 'オーディオコーデックに対応していません。';

  @override
  String get transcodeSubtitleCodecNotSupported => '字幕形式に対応していません (焼き付けが必要です)。';

  @override
  String get transcodeAudioProfileNotSupported => 'オーディオのプロファイルに対応していません。';

  @override
  String get transcodeVideoProfileNotSupported => '映像のプロファイルに対応していません。';

  @override
  String get transcodeVideoLevelNotSupported => '映像のレベルに対応していません。';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'このデバイスは、この映像の解像度に対応していません。';

  @override
  String get transcodeVideoBitDepthNotSupported => '映像のビット深度に対応していません。';

  @override
  String get transcodeVideoFramerateNotSupported => '映像のフレームレートに対応していません。';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'ファイルのビットレートがプレイヤーのストリーミング上限を超えています。';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      '映像のビットレートがストリーミングの上限を超えています。';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'オーディオのビットレートがストリーミングの上限を超えています。';

  @override
  String get transcodeAudioChannelsNotSupported => 'このオーディオのチャンネル数に対応していません。';

  @override
  String get sortAlphabetical => '名前順';

  @override
  String get sortReleaseAscending => '公開順 (古い順)';

  @override
  String get sortReleaseDescending => '公開順 (新しい順)';

  @override
  String get sortCustomDragDrop => 'カスタム (ドラッグ＆ドロップ)';

  @override
  String get playlistSortOptions => 'プレイリストの並べ替え';

  @override
  String get resetSort => '並び順をリセット';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'S$season:E$episode をもう一度見る';
  }

  @override
  String get rewatchPlaylist => 'プレイリストをもう一度見る';

  @override
  String get noSubtitlesFound => '字幕が見つかりません。';

  @override
  String get adminControls => '管理者向け操作';

  @override
  String get impellerRendering => 'レンダリングエンジン (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller は Flutter の新しい GPU レンダラーで、アニメーションが滑らかになり、カクつきが減ります。一部の TV ボックスや古い GPU では表示の乱れや映像が黒くなることがあり、その場合はオフにしてください。自動はお使いのデバイスに最適な設定を選びます。適用するには Moonfin を再起動してください。';

  @override
  String get impellerAuto => '自動';

  @override
  String get impellerOn => 'オン';

  @override
  String get impellerOff => 'オフ';

  @override
  String get impellerRestartTitle => '再起動が必要です';

  @override
  String get impellerRestartMessage =>
      'レンダリングエンジンを変更するには Moonfin の再起動が必要です。アプリをいったん終了し、開き直すと適用されます。';

  @override
  String get impellerCloseNow => '今すぐアプリを終了';

  @override
  String get adminRefreshLibrary => 'ライブラリを更新';

  @override
  String get adminRefreshAllLibraries => 'すべてのライブラリを更新';

  @override
  String get adminRepoSortDateOldest => '追加日 (古い順)';

  @override
  String get adminRepoSortDateNewest => '追加日 (新しい順)';

  @override
  String get adminRepoSortNameAsc => '名前順 (A → Z)';

  @override
  String get adminRepoSortNameDesc => '名前順 (Z → A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'サーバー統計を読み込んでいます... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'ソースに合わせる';

  @override
  String get imdbTop250Movies => 'IMDb 映画トップ 250';

  @override
  String get imdbTop250TvShows => 'IMDb TV 番組トップ 250';

  @override
  String get imdbMostPopularMovies => 'IMDb 人気の映画';

  @override
  String get imdbMostPopularTvShows => 'IMDb 人気の TV 番組';

  @override
  String get imdbLowestRatedMovies => 'IMDb 低評価の映画';

  @override
  String get imdbTopEnglishMovies => 'IMDb 高評価の英語映画';
}
