import Foundation

@objc class SwiftClass: NSObject {
  @objc override init() {
    super.init()
  }

  @objc func sayHello() -> Void {
    print("hello")
  }
}
