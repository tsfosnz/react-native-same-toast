# react-native-same-toast

A toast native module wrapper for both Android and iOS.

This is exactly the same Toast usage by ToastAndroid, and support iOS.

The iOS module code coming from:

https://github.com/scalessec/Toast

The Android using ToastAndroid from react native.

## Usage

Install it by:

```
npm install react-native-same-toast
react-native link react-native-same-toast
```

It had the same API as ToastAndroid on react native docs.

```
import Toast from 'react-native-same-toast';

Toast.showWithGravity(message, Toast.SHORT, Toast.TOP);
```

That's it.
