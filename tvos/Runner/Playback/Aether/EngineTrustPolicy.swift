// Shared by every Apple target. tvOS calls this from AppleTvVideoChannel, iOS
// and macOS from AetherVideoChannel, and the policy is the same either way.
import AetherEngine
import Foundation

/// Turns the host preference into the engine's per origin trust answer.
///
/// The preference is one switch, but `EngineTLS` asks about the origin a
/// handshake came from. Dart sends the hosts it is configured for, so a self
/// signed server on the LAN is accepted without relaxing a second server that
/// has a real certificate. An empty list means Dart did not know its hosts yet,
/// and answering yes there is better than failing playback for someone who
/// opted in.
enum EngineTrustPolicy {
    static func evaluator(from args: [String: Any])
        -> (@Sendable (URLProtectionSpace) -> Bool)?
    {
        guard (args["enabled"] as? Bool) == true else { return nil }
        let hosts = Set((args["hosts"] as? [String] ?? []).map { $0.lowercased() })
        guard !hosts.isEmpty else { return { _ in true } }
        return { hosts.contains($0.host.lowercased()) }
    }
}
