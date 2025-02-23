cd ios
pod deintegrate  # Clean existing pods
pod cache clean --all  # Clean pod cache
rm -rf Pods/  # Remove Pods directory
# rm -rf ~/Library/Developer/Xcode/DerivedData/*  # Clean derived data
pod install  # Reinstall all pods