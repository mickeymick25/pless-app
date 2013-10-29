# Behavior in order to enable Turbolinks Workaround. 
# More infos: http://railsapps.github.io/rails-google-analytics.html
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

(document).on 'page:change', ->
  if window._gaq?
    _gaq.push ['_trackPageview']
  else if window.pageTracker?
    pageTracker._trackPageview()