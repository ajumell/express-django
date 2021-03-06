path = require("path")
fs = require("fs")
express = require("express")

###
    1. Update viwes
    2. Update Static files / assets
    3. Update Template Context Processors

    4. Update Middlewares
    5. Update Models
    5. Update Controllers
###

class Installer
    constructor: ({@app, @url, @dirname}) ->
        @setup_templates_dir()
        @setup_routes()
        @setup_static()
        @setup_middlewares()

    setup_templates_dir: () ->
        root = @dirname
        template_dirs = @app.get "views"
        templates_dir = path.join(root, 'templates')
        dirs = [path.join(root, 'templates'), path.join(root, 'views')]
        for template_dir in dirs
            fs.exists template_dir, (exists) ->
                template_dirs.push templates_dir if exists

    setup_static: ->
        root = @dirname
        app = @app
        root = @dirname
        dirs = [path.join(root, 'templates'), path.join(root, 'views')]
        for static_dir in dirs
            fs.exists static_dir, (exists) ->
                app.use express.static(static_dir) if exists

    setup_routes: ->
        file_path = path.join(@dirname, "routes")
        return if not fs.existsSync(file_path + ".js")
        routes = require(file_path)
        if routes instanceof Array
            app = @app
            start = @url
            start = start + "/" if start[-1] is not "/"
            for route in routes
                app.all(start + route.pattern, route)

    setup_middlewares: ->
        file_path = path.join(@dirname, "middlewares" + ".js")
        return if not fs.existsSync(file_path)
        middlewares = require(file_path)
        if middlewares instanceof Array
            app = @app
            for middleware in middlewares
                app.use middleware


module.exports = Installer