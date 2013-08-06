createApp = undefined
express = undefined
express = require("express")

createApp = ->
    project = undefined
    project = express()
    project.install = (app, url) ->
        app = require(app)  if app instanceof String
        app.install
            app:project
            url: url
    project

module.exports =
    Installer: require("./installer")
    View: require("./view")
    express: createApp