angular.module('articles_module')
	.factory('$articles_service', [ '$resource', function($resource) {
	//return $resource('http://localhost:3000/api/v1/articles/:id',{id: "@id"});  
	return $resource('http://localhost:3000/api/v1/articles/:id',{id: "@id"},{'query': {method: 'GET', isArray: true }, 'get': {method: 'GET', isArray: false}});  
  
} ])
