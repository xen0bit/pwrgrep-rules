// react-legacy-component: legacy lifecycles (componentWillMount and friends)
// run before render and break under async rendering; use componentDidMount
// or getDerivedStateFromProps instead. Only single-method classes match: the
// matcher cannot say "one method among others" in TypeScript (see the rule).
import React from 'react';

// ruleid: react-legacy-component
class WillMount extends React.Component {
  componentWillMount() {
    console.log('mounting');
  }
}

// ruleid: react-legacy-component
class WillReceive extends React.Component {
  componentWillReceiveProps() {
    console.log('receiving');
  }
}

// ruleid: react-legacy-component
class WillUpdate extends React.Component {
  componentWillUpdate() {
    console.log('updating');
  }
}

// ok: react-legacy-component
class DidMount extends React.Component {
  componentDidMount() {
    console.log('mounted');
  }
}

// ok: react-legacy-component
class Modern extends React.Component {
  render() {
    return null;
  }
}

// ok: react-legacy-component
class Constructed extends React.Component {
  constructor() {
    console.log('built');
  }
}
