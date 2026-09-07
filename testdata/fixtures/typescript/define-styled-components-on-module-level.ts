// define-styled-components-on-module-level: a styled component declared
// inside a component is rebuilt on every render. Define it at module level.
// The rule only sees unexported functions and classes (see the rule header),
// so the fixture keeps them that way.
import styled from 'styled-components';

const Title = styled.h1`
  color: red;
`;

function Card() {
  // ruleid: define-styled-components-on-module-level
  const Box = styled.div`
    padding: 4px;
  `;
  return Box;
}

function Item(text: string) {
  // ruleid: define-styled-components-on-module-level
  const Wrap = styled('span')`
    margin: 2px;
  `;
  return Wrap;
}

class Panel {
  build() {
    // ruleid: define-styled-components-on-module-level
    const Frame = styled.section`
      border: 0;
    `;
    return Frame;
  }
}

// ok: define-styled-components-on-module-level
const Foot = styled.footer`
  color: gray;
`;

// ok: define-styled-components-on-module-level
const Nav = styled.nav`
  display: flex;
`;
