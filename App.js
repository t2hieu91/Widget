import React from 'react';
import {Text, NativeModules} from 'react-native';

const SharedStorage = NativeModules.SharedStorage;
export default class Root extends React.Component {
  componentDidMount() {
    SharedStorage.set(JSON.stringify({title: 'Data from React Native App'}));
  }

  render() {
    return (
      <>
        <Text>React Native App</Text>
      </>
    );
  }
}
