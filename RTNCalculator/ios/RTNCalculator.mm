// Obj-C impl
#import "RTNCalculator.h"
#import "Calculator.hpp"  // Import C++ header

@implementation RTNCalculator

RCT_EXPORT_MODULE()

- (void)add:(double)a b:(double)b resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    // NSNumber *result = [[NSNumber alloc] initWithInteger:a+b]; // Objective-C implementation
    double cppResult = calculator::Calculator::add(a, b); // C++ implementation
    NSNumber *result = @(cppResult);  // @() is shorthand for numberWithDouble
    resolve(result);
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeRTNCalculatorSpecJSI>(params);
}

@end