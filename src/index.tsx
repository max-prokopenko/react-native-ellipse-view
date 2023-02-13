import React from 'react';
import {
  Platform,
  requireNativeComponent,
  StyleSheet,
  View,
  ViewStyle,
} from 'react-native';

type EllipseViewProps = {
  borderWidthParam: number | undefined;
  borderColorParam: string | undefined;
  backgroundColorParam: string | undefined;
  borderStyleParam: string | undefined;
  coeffParam: number | undefined;
};

const EllipseViewManager = requireNativeComponent<EllipseViewProps>(
  'EllipseView'
);

const EllipseView = (props: {
  children: React.ReactNode;
  style?: ViewStyle;
  borderRadius?: number;
  roundness?: number;
}) => {
  const containerStyle = Object.assign({}, props.style);
  const borderRadius = props.borderRadius ? props.borderRadius : 20;
  const coeffParam =
    props.roundness && props.roundness > 0 && props.roundness <= 1
      ? props.roundness
      : 0.45;

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
          borderStyleParam={props.style?.borderStyle}
          coeffParam={coeffParam}
        />
      </View>
    );
  } else {
    return (
      <View
        {...props}
        style={[
          props.style,
          styles.androidContainer,
          {
            borderRadius,
          },
        ]}
      />
    );
  }
};

const styles = StyleSheet.create({
  androidContainer: {
    overflow: 'hidden',
  },
});

export default EllipseView;
