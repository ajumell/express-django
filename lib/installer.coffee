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
        try
            urls = require("routes")
            if urls instanceof Array
                app = @app
                start = @url
                start = start + "/" if start[-1] is not "/"
                for url in urls
                    app.all(start + url.pattern, url.view)


module.exports = Installer