angular
    .module('articles_module', ['ngResource','ngRoute'])
    .config(function ($routeProvider, $locationProvider) {
        $routeProvider
            .when('/', {
                templateUrl: 'app/views/api_articles/index.html',
                controller: 'articlesCtrl'
            })
            .when('/articles', {
                templateUrl: 'app/views/api_articles/index.html',
                controller: 'articlesCtrl'
            });
        $locationProvider.html5Mode(true);
    });
