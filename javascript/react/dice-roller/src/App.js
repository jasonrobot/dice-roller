import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

class DiceRoller extends Component {
  render() {
    return (
      <div id="dice-app">
        <div>
          Enter options:
        </div>
        <input id="in" type="text" />
        <button type="button">Roll!</button>
        <div id="results">no results yet</div>
      </div>
    );
  }
}

class App extends Component {
  render() {
    return (
      <div className="App">
        <DiceRoller />
      </div>
    );
  }
}

export default App;
