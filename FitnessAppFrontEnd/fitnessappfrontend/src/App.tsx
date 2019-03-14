import React from 'react';
import './App.scss';
import { Provider } from 'react-redux';
import { store } from './redux/Store';
import MainComponent from './Main';

class App extends React.Component<any, any> {


  render() {
    const result = (
      <Provider store={store}>
        <MainComponent />
      </Provider>
    );
    return result;
  }
}

export default App;
