import { requireNativeComponent, ViewStyle } from 'react-native';

type EllipseViewProps = {
  color: string;
  style: ViewStyle;
};

export const EllipseViewViewManager = requireNativeComponent<EllipseViewProps>(
  'EllipseViewView'
);

export default EllipseViewViewManager;
