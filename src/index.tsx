import React from 'react';
import {
  Platform,
  requireNativeComponent,
  View,
  ViewStyle,
} from 'react-native';

type EllipseViewProps = {
  borderWidthParam: number | undefined;
  borderColorParam: string | undefined;
  backgroundColorParam: string | undefined;
};

const EllipseViewManager = requireNativeComponent<EllipseViewProps>(
  'EllipseView'
);

const EllipseView = (props: {
  children: React.ReactNode;
  style?: ViewStyle;
}) => {
  const containerStyle = Object.assign({}, props.style);

  if (Platform.OS === 'ios') {
    // Cleanup the container styles
    delete containerStyle.backgroundColor;
    delete containerStyle.borderWidth;
    delete containerStyle.borderColor;

    return (
      <View style={containerStyle}>
        <EllipseViewManager
          children={props.children}
          borderWidthParam={props.style?.borderWidth}
          borderColorParam={props.style?.borderColor}
          backgroundColorParam={props.style?.backgroundColor}
        />
      </View>
    );
  } else {
    return <View {...props} />;
  }
};

export default EllipseView;
