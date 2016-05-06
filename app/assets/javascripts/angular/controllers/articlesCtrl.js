angular.module('articles_module')
    .controller('articlesCtrl',function ($scope, $articles_service, $stateParams) {
        $scope.articles = $articles_service.query();
        //$scope.articlesId = $articles_service.get({id: $stateParams.id});
    })
    .controller('articlesIdCtrl',function ($scope, $articles_service, $stateParams) {
        $scope.articlesId = $articles_service.get({id: $stateParams.id});

    })
    // .controller('rmArticleCtrl', function ($scope, $articles_service, $stateParams, $window){
    //     $scope.removeArticle = function(article){
    //         var deleteUser = $window.confirm('Estas seguro?');
    //         if (deleteUser) {
    //           $articles_service.delete({id: article.id});
    //             $scope.articles = $articles_service.query();
    //         }
    //     }  
    // })
    .controller('rmArticleCtrl', function ($scope, $articles_service, $stateParams){
      $scope.removeArticle = function(article){
        $articles_service.delete({id: article.id});
        $scope.articles = $articles_service.query();            
      }  
    })
    .controller('newArticleCtrl',function ($scope, $articles_service){
        $scope.article = {};        
         $scope.saveArticle = function(article){
            //$articles_service.save({ "article": article });
            console.log(article)
        }        
    })

