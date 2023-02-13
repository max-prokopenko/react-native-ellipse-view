import * as React from 'react';

import { StyleSheet, View, Image, TouchableOpacity } from 'react-native';
import EllipseView from '@lowkey/react-native-ellipse-view';

export default function App() {
  return (
    <View style={styles.container}>
      <TouchableOpacity>
        <EllipseView style={styles.ellipseView} roundness={0.45}>
          <Image source={require('./example.jpeg')} style={styles.big} />
        </EllipseView>
      </TouchableOpacity>
      <EllipseView style={styles.ellipseViewDahsed}>
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
    borderWidth: 5,
    borderColor: '#ff00ff',
    backgroundColor: '#ffa0f0',
  },
  ellipseViewDahsed: {
    marginTop: 10,
    borderWidth: 5,
    borderStyle: 'dashed',
    borderColor: '#ff00ff',
    backgroundColor: '#ffa0f0',
  },
  big: {
    width: 100,
    height: 100,
  },
});
