angular.module('articles_module')
    .controller('articlesCtrl',function ($scope, $articles_service, $stateParams) {
        $scope.articles = $articles_service.query();
        //$scope.articlesId = $articles_service.get({id: $stateParams.id});
    })
    .controller('articlesIdCtrl',function ($scope, $articles_service, $stateParams) {
        $scope.articlesId = $articles_service.get({id: $stateParams.id});

    }) //eliminar con presencia de un ALERT
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
        /*$scope.article = {};  
        $scope.saveArticle = function(article){
            //$articles_service.save({ "article": article });
            console.log(article) 
        }*/
        /*$scope.saveArticle = function(){
            var file = $scope.file.name;
            var title = $scope.title;
            var content = $scope.content;
            console.log(file);
            console.log(title);
            console.log(content);
            
        }*/     
        $scope.uploadPic = function(file) {
            file.upload = Upload.upload({
              url: 'https://localhost:3000/reciveci_api/public/uploads/article/image/',
              data: {image: file},
            });  
         }
        
    })
    /*.directive('uploaderModel',['$parse',function ($parse){
        return{
            restrict: 'A',
            link: function (scope, iElement, iAttrs){
                iElement.on("change",function(e){
                    $parse(iAttrs.uploaderModel).assign(scope,iElement[0].files[0]);
                })
            }
        }
    }])*/
    /*.service('upload',['$q',function ($q){
        this.saveArticle = function(title,content,file){
            var deferred = $q.defer();
            var formData = new FormData();
            formData.append("title",title);
            formData.append("content",content);
            formData.append("file",file);
            return $articles_service.save(formData,{
                headers: {
                    "content-type":undefined
                },
                transformRequest: formData
            }).success(function(res){
                deferred.resolve(res);
            }).error(function(msg, code){
                deferred.reject(msg);
            })
            return deferred.promise;
        }
    }])*/

   

   

