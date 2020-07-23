import Foundation

@objc class SwiftClass: NSObject {
  @objc override init() {
    super.init()
  }

  @objc func sayHello() -> Void {
    print("hello")
  }

  @objc func addX(x: Int, andY y: Int) -> Int {
    return x + y
  }
}
