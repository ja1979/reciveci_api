angular
    .module('articles_module', ['ngResource', 'ui.router', 'templates'])
    .config(['$urlRouterProvider', '$stateProvider',function($urlRouterProvider, $stateProvider){
        $stateProvider
            .state('articles',{
              url:'/articles',
              templateUrl: 'articles/all_articles.html',
              controller: 'articlesCtrl'
            })
            .state('articles.id',{
                url:'/:id',
                views:{
                    "show-article":{
                        templateUrl: "articles/articleId.html",
                        controller: 'articlesIdCtrl'
                          }
                    }                
              })
            .state('categorias',{
                url:'/categorias',
                templateUrl: 'categorias/all_categorias.html'
              })
}])


