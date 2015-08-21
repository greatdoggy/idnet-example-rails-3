$ ->

  # Bind login clicks in links

  $('#popup-login').click (e) ->
   open_idnet_signin_signup('/auth/idnet')
   e.preventDefault()

  $('#smart-login').click (e) ->
    _idapi.push ['login']

  $('#sdk-login').click (e) ->
    ID.login()
    e.preventDefault()
  
  $('#popup-cert').click (e) ->
    ID.certification()
    e.preventDefault()

  $('#leaderboard-index').click (e) ->
    ID.leaderboard()
    e.preventDefault()