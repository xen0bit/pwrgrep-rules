app.config(function($sceProvider) {
  // ruleid: detect-angular-sce-disabled
  $sceProvider.enabled(false);
});

app.config(function($sceProvider) {
  // ruleid: detect-angular-sce-disabled
  $sceProvider.enabled(false);
});

app.config(function($sceProvider) {
  // ruleid: detect-angular-sce-disabled
  $sceProvider.enabled(false);
});

app.config(function($sceProvider) {
  // ok: detect-angular-sce-disabled
  $sceProvider.enabled(true);
});

app.config(function($sceProvider) {
  // ok: detect-angular-sce-disabled
  $sceProvider.enabled();
});

function plain() {
  // ok: detect-angular-sce-disabled
  console.log('nothing disabled here');
}
