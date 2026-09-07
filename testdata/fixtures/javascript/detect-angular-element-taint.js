function fetch($http) {
  $http.get('/api').then(function (res) {
    // ruleid: detect-angular-element-taint
    angular.element('#out').html(res.data);
  });
}

function search($location) {
  // ruleid: detect-angular-element-taint
  angular.element('#out').html($location.search().q);
}

function linkStatic() {
  // ok: detect-angular-element-taint
  angular.element('#out').html('<b>static</b>');
}

function plain(x) {
  // ok: detect-angular-element-taint
  console.log(x);
}
