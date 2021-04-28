import * as React from 'react';

import { StyleSheet, View, Image } from 'react-native';
import EllipseView from '@lowkey/react-native-ellipse-view';

export default function App() {
  return (
    <View style={styles.container}>
      <EllipseView style={styles.ellipseView}>
        <Image source={require('./example.jpeg')} style={styles.big} />
      </EllipseView>
      <EllipseView style={styles.ellipseView}>
        <View style={styles.big} />
      </EllipseView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#fff',
  },
  ellipseView: {
    marginTop: 10,
    borderWidth: 50,
    borderColor: '#ff00ff',
    backgroundColor: '#ffa0f0',
  },
  big: {
    width: 380,
    height: 380,
  },
});
