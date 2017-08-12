import { NativeModules, ToastAndroid, Platform } from 'react-native';

const { ToastManager } = NativeModules;

let Toast = ToastAndroid;

if (Platform.OS === 'ios') {
  Toast = ToastManager;
}

const module = Toast;
export default module;
