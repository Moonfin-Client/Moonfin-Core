/// What a caller asks for when it wants a whole item rather than a few values
/// off one, and what Jellyfin falls back to when a caller names nothing.
///
/// Trickplay is deliberately absent. A player asks the trickplay route for it
/// when the item doesn't carry it, so naming it here made every item fetch in
/// the app pay for an index almost none of them read.
const kDetailItemFields =
    'Chapters,MediaSources,MediaStreams,People,Overview,Genres,UserData,'
    'RecursiveItemCount,ChildCount,ParentLogoItemId,ParentLogoImageTag,'
    'DateCreated';

/// The same, plus the trickplay index, for a copy being stored to watch
/// offline. Nothing can go and fetch it once the item is off the network.
const kOfflineItemFields = '$kDetailItemFields,Trickplay';
