'use strict';

(function(angular) {

  function LeaderboardApi($resource) {
    return $resource('/api/v1/leaderboards/:leaderboard_id',
      { leaderboard_id: "@leaderboard_id" },
      {
        fetchUsers: {
          method: 'GET',
          params: {
            leaderboard_id: '@leaderboard_id'
          },
          url: '/api/v1/leaderboards/:leaderboard_id/users',
          isArray: true 
        },

        createUser: {
          method: 'POST',
          params: {
            leaderboard_id: '@leaderboard_id',
          },
          url: '/api/v1/leaderboards/:leaderboard_id/users',
          isArray: false 
        },

        updateUser: {
          method: 'PATCH',
          params: {
            leaderboard_id: '@leaderboard_id',
            id: '@id'
          },
          url: '/api/v1/leaderboards/:leaderboard_id/users/:id',
          isArray: false 
        },

        deleteUser: {
          method: 'DELETE',
          params: {
            leaderboard_id: '@leaderboard_id',
            id: '@id'
          },
          url: '/api/v1/leaderboards/:leaderboard_id/users/:id',
          isArray: false 
        }
      });

  }

  LeaderboardApi.$inject = ['$resource'];

  function leaderCtr($scope, LeaderboardApi) {
    var leaderboards = LeaderboardApi.query();
    $scope.leaderboards = [];
    leaderboards.$promise.then(function(data) {
      angular.forEach(data, function(item) {
        $scope.leaderboards.push(item);
      });
    }, function(data) {
      //if error then...
    });

  }

  leaderCtr.$inject = ['$scope', 'LeaderboardApi'];

  function userCtr($scope, $routeParams, usersData, LeaderboardApi) {
    $scope.users = [];
    $scope.sortType = 'games_won';

    for (var i=0; i<usersData.length; i++) {
      //orderBy treats numbers as strings if you don't convert to float first
      usersData[i].games_won = parseFloat(usersData[i].games_won); 
      usersData[i].games_lost = parseFloat(usersData[i].games_lost);
      usersData[i].win_loss_ratio = parseFloat(usersData[i].win_loss_ratio);
      $scope.users.push(usersData[i]);
    }

    $scope.setSortType = function(type) {
      $scope.sortType = type;
    };

    $scope.changeGamesWonLost = function(user, type, $event) {
      $event.preventDefault();
      if (type=='won') {
        user.games_won += 1;
      }
      else if (type=='lost') {
        user.games_lost += 1;
      }
      user.win_loss_ratio = user.games_won / user.games_lost;
      LeaderboardApi.updateUser(user); 
    }

    $scope.deleteUser = function(user, idx, $event) {
      $event.preventDefault();
      LeaderboardApi.deleteUser(user);
      $scope.users.splice(idx, 1);
    }

    $scope.addPlayer = function(playerName) {
      var user_params = { name: playerName, leaderboard_id: $routeParams.leaderboard_id, games_won: 0, games_lost: 0, win_loss_ratio: 0 };
      var user = LeaderboardApi.createUser(user_params);
      $scope.users.push(user);
    }
  }

  userCtr.$inject = ['$scope', '$routeParams', '$usersData', 'LeaderboardApi'];

  var leaderApp = angular.module('leaderApp', ['ngResource', 'ngRoute', 'templates']);
  leaderApp.controller('leaderCtr', ['$scope', 'LeaderboardApi', leaderCtr]);
  leaderApp.factory('LeaderboardApi', ['$resource', LeaderboardApi]);
  leaderApp.controller('userCtr', ['$scope', '$routeParams', 'usersData', 'LeaderboardApi', userCtr]);

  leaderApp.config(['$routeProvider', function($routeProvider) {
    $routeProvider
    .when('/',  {
      templateUrl: 'leaderboards.html',
      controller: 'leaderCtr'
    })
    .when('/leaderboards/:leaderboard_id/users', {
      templateUrl: 'users.html',
      controller: 'userCtr',
      resolve: {
        usersData: ['LeaderboardApi', '$route',function(LeaderboardApi, $route) {
          var users = [];
          return LeaderboardApi.fetchUsers({ leaderboard_id: $route.current.params.leaderboard_id }).$promise.then(function(data) {
            angular.forEach(data, function(item) {
              users.push(item);
            });
            return users;
          });
        }]
      },
    })
  }]);
})(angular);
