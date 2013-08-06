createApp = undefined
express = undefined
express = require("express")

install = (app, url) ->
    app = require(app)  if app instanceof String
    app.install
        app: project
        url: url

add_routing = (app) ->

createApp = () ->
    project = undefined
    project = express()
    project.install = install
    project

module.exports =
    Installer: require("./installer")
    View: require("./view")
    express: createApp