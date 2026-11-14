// Shared by every Apple target. tvOS calls this from NativeApplePlayerChannel, iOS
// and macOS from AetherVideoChannel.
import AetherEngine
import Foundation
import Security

/// The client certificates the engine and `MoonfinURLSession` present, each
/// only to the host it was imported for.
enum ClientIdentityStore {
    private static let lock = NSLock()
    private static var credentials: [String: URLCredential] = [:]

    /// Dart sends each certificate as a .p12 built for `SecPKCS12Import`.
    static func setClientCertificates(_ list: [[String: Any]]) {
        var imported: [String: URLCredential] = [:]
        for item in list {
            guard let host = item["host"] as? String,
                let p12 = (item["p12Base64"] as? String).flatMap({ Data(base64Encoded: $0) }),
                let password = item["password"] as? String,
                let credential = credential(p12: p12, password: password)
            else { continue }
            imported[host.lowercased()] = credential
        }
        lock.lock()
        credentials = imported
        lock.unlock()
        let snapshot = imported
        // Swift 6.2 can't infer a type when nil and this closure share a ternary.
        if snapshot.isEmpty {
            EngineTLS.clientCredentialProvider = nil
        } else {
            EngineTLS.clientCredentialProvider = { space in snapshot[space.host.lowercased()] }
        }
    }

    static func credential(forHost host: String) -> URLCredential? {
        lock.lock()
        defer { lock.unlock() }
        return credentials[host.lowercased()]
    }

    private static func credential(p12: Data, password: String) -> URLCredential? {
        var items: CFArray?
        let status = SecPKCS12Import(
            p12 as CFData,
            [kSecImportExportPassphrase as String: password] as CFDictionary,
            &items)
        guard status == errSecSuccess,
            let item = (items as? [[String: Any]])?.first,
            let identityValue = item[kSecImportItemIdentity as String],
            CFGetTypeID(identityValue as CFTypeRef) == SecIdentityGetTypeID()
        else { return nil }
        let identity = identityValue as! SecIdentity
        // The leaf comes from the identity, so only what issued it goes here.
        let chain = (item[kSecImportItemCertChain as String] as? [SecCertificate]) ?? []
        return URLCredential(
            identity: identity,
            certificates: chain.count > 1 ? Array(chain.dropFirst()) : nil,
            persistence: .forSession)
    }
}
