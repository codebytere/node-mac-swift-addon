const addon = require('./build/Release/InteropFramework.framework/Versions/A/InteropFramework.node')

// Print 'hello' to console.
addon.sayHello()

// Add two numbers together.
const result = addon.add(1, 2)
console.log(result) // 3

// Perform a key agreement and check results.
const keysEqual = addon.runKeyCheck()
console.log(keysEqual) // true
