import * as React from 'react';

import { StyleSheet, View, Image } from 'react-native';
import EllipseView from 'react-native-ellipse-view';

export default function App() {
  return (
    <View style={styles.container}>
      <EllipseView style={styles.ellipseView}>
        <Image source={require('./example.jpeg')} style={styles.smallAvatar} />
      </EllipseView>
      <EllipseView style={styles.ellipseView}>
        <Image source={require('./example.jpeg')} style={styles.mediumAvatar} />
      </EllipseView>
      <EllipseView style={styles.ellipseView}>
        <Image source={require('./example.jpeg')} style={styles.bigAvatar} />
      </EllipseView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'flex-start',
    paddingTop: 150,
    backgroundColor: '#fff',
  },
  box: {
    width: 400,
    height: 400,
    backgroundColor: 'green',
    opacity: 1,
  },
  box2: {
    ...StyleSheet.absoluteFillObject,
    width: 400,
    height: 400,
    backgroundColor: 'green',
    justifyContent: 'center',
    alignItems: 'center',
    opacity: 0,
  },
  ellipseView: {
    marginTop: 30,
  },
  smallAvatar: {
    width: 60,
    height: 60,
  },
  mediumAvatar: {
    width: 120,
    height: 120,
  },
  bigAvatar: {
    width: 220,
    height: 220,
  },
});
