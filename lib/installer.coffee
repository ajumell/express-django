path = require("path")
fs = require("fs")

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

    setup_templates_dir: () ->
        root = @dirname
        template_dirs = @app.get "views"
        templates_dir = path.join(root, 'templates')
        dirs = [path.join(root, 'templates'), path.join(root, 'views')]
        for template_dir in dirs
            fs.exists template_dir, (exists) ->
                if exists
                    template_dirs.push templates_dir

module.exports = Installer