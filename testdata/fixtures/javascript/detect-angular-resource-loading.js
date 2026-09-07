app.config(function($sceDelegateProvider) {
  // ruleid: detect-angular-resource-loading
  $sceDelegateProvider.resourceUrlWhitelist(['self', 'https://example.com/**']);
});

app.config(function($sceDelegateProvider) {
  // ruleid: detect-angular-resource-loading
  $sceDelegateProvider.resourceUrlWhitelist(['**']);
});

app.config(function($sceDelegateProvider) {
  // ruleid: detect-angular-resource-loading
  $sceDelegateProvider.resourceUrlWhitelist(['https://**.example.com/x']);
});

app.config(function($sceDelegateProvider) {
  // ok: detect-angular-resource-loading
  $sceDelegateProvider.resourceUrlWhitelist(['self']);
});

app.config(function($sceDelegateProvider) {
  // ok: detect-angular-resource-loading
  $sceDelegateProvider.resourceUrlWhitelist(['self', 'https://example.com/x']);
});

app.config(function($sceDelegateProvider) {
  // ok: detect-angular-resource-loading
  $sceDelegateProvider.resourceUrlWhitelist([]);
});
