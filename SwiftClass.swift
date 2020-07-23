import Foundation
import CryptoKit

@objc class SwiftClass: NSObject {
  @objc override init() {
    super.init()
  }

  // Function demonstrating usage of a Swift-only API.
  @objc func runKeyCheck() -> Bool {
    let protocolSalt = "Shelley Swift Node.js Addon".data(using: .utf8)!

    let onePrivateKey = P256.KeyAgreement.PrivateKey()
    let onePublicKey = onePrivateKey.publicKey

    let twoPrivateKey = P256.KeyAgreement.PrivateKey()
    let twoPublicKey = twoPrivateKey.publicKey

    let oneSharedSecret = try! onePrivateKey.sharedSecretFromKeyAgreement(with: twoPublicKey)

    let oneSymmetricKey = oneSharedSecret.hkdfDerivedSymmetricKey(using: SHA256.self,
                                                                      salt: protocolSalt,
                                                                      sharedInfo: Data(),
                                                                      outputByteCount: 32)

    let twoSharedSecret = try! twoPrivateKey.sharedSecretFromKeyAgreement(with: onePublicKey)

    let twoSymmetricKey = twoSharedSecret.hkdfDerivedSymmetricKey(using: SHA256.self,
                                                                  salt: protocolSalt,
                                                                  sharedInfo: Data(),
                                                                  outputByteCount: 32)
    return twoSymmetricKey == oneSymmetricKey
  }

  @objc func sayHello() -> Void {
    print("hello")
  }

  @objc func addX(x: Int, andY y: Int) -> Int {
    return x + y
  }
}
