Router.configure
  layoutTemplate: 'layout',
  loadingTemplate: 'loading',
  waitOn: ->
    Meteor.subscribe('posts')

Router.map ->
  this.route 'postsList',
    path: '/'
  this.route 'postPage',
    path: '/posts/:_id',
    data: ->
      Posts.findOne(this.params._id)
  this.route 'postSubmit',
    path: '/submit'

requireLogin = ->
  if !Meteor.user()
    render(if Meteor.loggingIn() then @loadingTemplate else 'accessDenied')
    @stop()

Router.before requireLogin,
  only: 'postSubmit'
