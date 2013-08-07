createApp = undefined
express = undefined
express = require("express")
Installer = require("./installer")
fs = require("fs")
path = require("path")

add_routing = (app) ->

createApp = () ->
    project = undefined
    project = express()
    project.install = ({app, url}) ->
        if not fs.existsSync app
            app = require.resolve(app)
        else
            app = path.resolve(app)

        stat = fs.lstatSync(app)
        if stat.isFile()
            app = path.dirname(app)

        installer = new Installer
            app: project
            url: url
            dirname: app
    project

route = (name, pattern, fn) ->
    fn.name = name
    fn.pattern = pattern
    return fn

module.exports =
    Installer: require("./installer")
    View: require("./view")
    express: express
    new: createApp
    route: route