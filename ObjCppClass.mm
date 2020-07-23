#include <nan.h>

#import "ObjCppClass.h"
#import "InteropFramework-Swift.h"

using v8::FunctionTemplate;
using v8::Object;
using v8::String;
using Nan::GetFunction;
using Nan::New;
using Nan::Set;

NAN_METHOD(SayHello) {
  SwiftClass *swiftClass = [[SwiftClass alloc] init];
  [swiftClass sayHello];
}

NAN_MODULE_INIT(InitAll) {
  Set(target, New<String>("sayHello").ToLocalChecked(),
    GetFunction(New<FunctionTemplate>(SayHello)).ToLocalChecked());
}

NODE_MODULE(TestFramework, InitAll)
