app.controller('MainCtrl', function($scope, $sce) {
  // ruleid: detect-angular-translateprovider-translations-method
  $translateProvider.translations('en', { HELLO: 'hi' });
  // ruleid: detect-angular-translateprovider-translations-method
  $translateProvider.translations('de', { HELLO: 'hallo' });
  // ruleid: detect-angular-translateprovider-translations-method
  $translateProvider.translations('fr', { HELLO: 'bonjour' });
  // ok: detect-angular-translateprovider-translations-method
  $translateProvider.preferredLanguage('en');
  // ok: detect-angular-translateprovider-translations-method
  $translate.use('en');
  // ok: detect-angular-translateprovider-translations-method
  console.log('no translations here');
});
