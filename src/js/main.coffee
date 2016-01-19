malarkey = require('malarkey')
# Browserify entry point for the global.js bundle (yay CoffeeScript!)
$ = require 'jquery'
require 'browsernizr/test/touchevents'
require 'browsernizr/test/svg'
Modernizr = require 'browsernizr'
svg4everybody = require 'svg4everybody'


# ---
$ ->
  $('html').addClass 'ready'
  if Modernizr.touchevents
    $('html').addClass 'touch'
  else
    $('html').addClass 'no-touch'

  svg4everybody()


  elem = $('.js-am').get(0)
  opts = 
    typeSpeed: 50
    deleteSpeed: 50
    pauseDelay: 1000
    loop: false
    postfix: '!'
  m = malarkey(elem, opts)
    .pause()
    .pause()
    .pause()
    .pause()
    .delete()
    .type('web designer')
    .pause()
    .delete()
    .type('tech enthusiast')
    .pause()
    .delete()
    .type('world traveller')
    .pause()
    .delete()
    .type('web experimenter')
    .call(->
      $('.js-am').addClass 'finished'
      $('.l-fadein').addClass 'is-visible'
      $('.stage').addClass 'ready'
    )
  $('.js-corporate-trigger').on 'click', (e) ->
    e.preventDefault()
    $(this).addClass 'is-toggled'
    $('.js-experiments-trigger').addClass 'is-hidden'
    $('.js-corporate').addClass 'is-visible'
  $('.js-experiments-trigger').on 'click', (e) ->
    e.preventDefault()
    $(this).addClass 'is-toggled'
    $('.js-corporate-trigger').addClass 'is-hidden'
    $('.js-experiments').addClass 'is-visible'
  $('.js-back').on 'click', (e) ->
    e.preventDefault()
    $('.js-corporate').removeClass 'is-visible'
    $('.js-experiments').removeClass 'is-visible'
    $('.js-experiments-trigger').removeClass('is-toggled').removeClass 'is-hidden'
    $('.js-corporate-trigger').removeClass('is-toggled').removeClass 'is-hidden'

  $('.js-bat-trigger').hover (e) ->
    $('.bat_list').addClass 'is-visible'
  ,(e) ->
    $('.bat_list').removeClass 'is-visible'
