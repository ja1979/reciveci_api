angular.module('articles_module')
    .controller('articlesCtrl',function ($scope, $articles_service) {
        $scope.articles = $articles_service.query();
		$scope.message= "hola mundo!!";
    })