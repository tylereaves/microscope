@Posts = new Meteor.Collection "posts"

Meteor.methods
  post: (postAttributes) ->
    user = Meteor.user()
    postWithSameLink = Posts.findOne
      url: postAttributes.url

    if !user
      throw new Meteor.Error 401, "You need to login first"

    if !postAttributes.title
      throw new Meteor.Error 422, "Please fill in a title"

    if postAttributes && postWithSameLink
      throw new Meteor.Error 302, "This link has already been posted", postWithSameLink._id

    post = _.extend(_.pick(postAttributes, 'url', 'title', 'message'),
      userId: user._id,
      author: user.username,
      submitted: new Date().getTime())

    Posts.insert(post)
