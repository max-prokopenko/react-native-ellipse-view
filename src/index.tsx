import React from 'react';
import {
  Platform,
  requireNativeComponent,
  View,
  ViewStyle,
} from 'react-native';

type EllipseViewProps = {};

const EllipseViewManager = requireNativeComponent<EllipseViewProps>(
  'EllipseView'
);

const EllipseView = (props: {
  children: React.ReactNode;
  style?: ViewStyle;
}) => {
  if (Platform.OS === 'ios') {
    return <EllipseViewManager {...props} />;
  } else {
    return <View {...props} />;
  }
};

export default EllipseView;
