angular.module('articles_module')
    .controller('articlesCtrl',function ($scope, $articles_service, $stateParams) {
        $scope.articles = $articles_service.query();
    })
    .controller('articlesIdCtrl',function ($scope, $articles_service, $stateParams) {
        $scope.articlesId = $articles_service.get({id: $stateParams.id});

  		$scope.remove_article = function(article){
  			$articles_service.delete({id: article.id});
  			//console.log(article);
  		}	
    })