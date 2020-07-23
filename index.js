const addon = require('./build/Release/InteropFramework.framework/Versions/A/InteropFramework.node')

// Print 'hello' to console.
addon.sayHello()

const result = addon.add(1, 2)
console.log(result) // 3
