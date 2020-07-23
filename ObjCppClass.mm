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

NAN_METHOD(Add) {
  uint32_t x = Nan::To<int32_t>(info[0]).FromJust();
  uint32_t y = Nan::To<int32_t>(info[1]).FromJust();

  SwiftClass *swiftClass = [[SwiftClass alloc] init];
  int result = [swiftClass addXWithX:x andY:y];

  info.GetReturnValue().Set(result);
}

NAN_MODULE_INIT(InitAll) {
  Set(target, New<String>("sayHello").ToLocalChecked(),
    GetFunction(New<FunctionTemplate>(SayHello)).ToLocalChecked());
  Set(target, New<String>("add").ToLocalChecked(),
    GetFunction(New<FunctionTemplate>(Add)).ToLocalChecked());
}

NODE_MODULE(InteropFramework, InitAll)

