# CPP Turbomodules with Expo
1) Make sure Turbomodule folder exists
2) `npm install ./RTNCalculator`
3) Codegen script: `node node_modules/react-native/scripts/generate-codegen-artifacts.js --targetPlatform ios --path ./ --outputPath ./RTNCalculator/generated/`


### Notes
You need to use Objective-C++ (.mm) as a bridge between React Native's Objective-C world and C++ because React Native's iOS layer is built on Objective-C. Let me show the complete, exact modification:


#### Considerations when using C++
Import the C++ header with #import "Calculator.hpp"
Replace the direct calculation with a call to the C++ implementation:

with 
```objective-c
// NSNumber *result = [[NSNumber alloc] initWithInteger:a+b]; // Objective-C implementation
double cppResult = calculator::Calculator::add(a, b); // C++ implementation
NSNumber *result = @(cppResult);  // @() is shorthand for numberWithDouble
resolve(result);
```

For iOS you always need to:

Use .mm extension for files that mix Objective-C and C++
Bridge between Objective-C and C++ in these files
Keep pure C++ code in .cpp files
Use the Objective-C++ files to connect React Native's Objective-C layer with your C++ code

This is because:

React Native's iOS runtime is written in Objective-C
The JSI (JavaScript Interface) expects Objective-C objects
Native modules must conform to Objective-C protocols



#### Example Setup

```
RTNCalculator/
├── ios
│   ├── Calculator.cpp
│   ├── Calculator.hpp
│   ├── RTNCalculator.h
│   └── RTNCalculator.mm
├── js
│   └── NativeRTNCalculator.ts
├── generated (auto-generated with Codegen script)
├── package.json
└── rtn-calculator.podspec
```

## Launching Expo app

1. Install dependencies (if you haven't already)

   ```bash
   npm install
   ```

2. Start the app

   ```bash
    npx expo run:ios
   ```