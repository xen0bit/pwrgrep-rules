// react-props-in-state: copying a prop into state ignores every later update
// of that prop. Read the prop directly instead. (The rule reads the state
// initializer as text, hence the `<...>` shape below.)
import React from 'react';

class A extends React.Component {
  // ruleid: react-props-in-state
  state = {color: <div> this.props.color </div>}
  render() {
    return null;
  }
}

class B extends React.Component {
  constructor() {
    // ruleid: react-props-in-state
    this.state = {items: <ul> this.props.items </ul>};
  }
  render() {
    return null;
  }
}

class C extends React.Component {
  // ok: react-props-in-state
  state = {initial: <div> this.props.color </div>}
  render() {
    return null;
  }
}

class D extends React.Component {
  // ok: react-props-in-state
  state = {color: 'red'}
  render() {
    return null;
  }
}
