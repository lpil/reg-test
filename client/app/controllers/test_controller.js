'use strict';

function TestController($scope, $http) {

  /**
   * Submit a regex and subject to the server for testing.
   *
   * Splits the subject on newline if $scope.split is true
   *
   * Side effect: Updates the scope with the results or error from server
   *
   * @param {string} regex - The regex to test
   * @param {string} subject - The string on which to run the regex
   */
  const test = function test(regex, subject) {
    if ($scope.split) {
      subject = subject.split('\n').filter(x => x !== '');
    }
    const args = {
      regex: regex,
      subject: subject
    };
    $http.post('/test', args)
      .success(data => $scope.results = data)
      .error(data => console.log(data));
  };


  this.scope = $scope;

  $scope.test    = test;
  $scope.split   = true;
  $scope.regex   = '';
  $scope.subject = '';
  $scope.results = undefined;
}

export { TestController };
