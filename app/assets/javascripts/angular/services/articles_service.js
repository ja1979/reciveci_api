angular.module('articles_module')
	.factory('$articles_service', [ '$resource', function($resource) {
	//return $resource('http://localhost:3000/api/v1/articles/:id',{id: "@id"});  
	return $resource('/api/v1/articles/:id',{id: "@id"},{'query': {method: 'GET', isArray: true },'save': {method:'POST',  headers: {'Content-Type': 'application/json'}}, 'post': {method:'POST',  headers: {'Content-Type': 'application/json'}}});  
  
} ])
