require('monaco-editor');

monaco.languages.registerHoverProvider('javascript', {
  provideHover: function (model, position) {
    // ruleid: monaco-hover-htmlsupport
    return {range: new monaco.Range(1, 1, 1, 1), contents: [{value: model.getValue(), supportHtml: true}]};
  }
});

monaco.languages.registerHoverProvider('python', {
  provideHover: function (model, position) {
    // ruleid: monaco-hover-htmlsupport
    return {range: pos.range, contents: [{value: model.getText(), isTrusted: true}]};
  }
});

monaco.languages.registerHoverProvider('go', {
  provideHover: function (model, position) {
    // ok: monaco-hover-htmlsupport
    return {range: pos.range, contents: [{value: 'static'}]};
  }
});

function plainHover(text) {
  // ok: monaco-hover-htmlsupport
  return {value: text, supportHtml: false};
}
