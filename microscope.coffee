"Welcome to microscope."

Template.hello.events "click input": ->

  # template data, if any, is available in 'this'
  console.log "You pressed the button"  if console?
  return

if Meteor.isServer
  Meteor.startup ->


# code to run on server at startup