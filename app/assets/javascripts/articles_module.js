angular
    .module('articles_module', ['ngResource', 'ui.router', 'templates'])
    .config(['$urlRouterProvider', '$stateProvider',function($urlRouterProvider, $stateProvider){
        $stateProvider
            .state('/',{
                url:'/',
                templateUrl: 'all_articles.html',
                controller: 'articlesCtrl'
            })
            .state('pag2',{
                url:'/pag2',
                templateUrl: 'id_article.html'
            })
    }])


