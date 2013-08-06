view = require("express/lib/view")
utils = require("express/lib/utils")
{join, basename, dirname, existsSync} = require('path')
fs = require("fs")

exists = fs.existsSync or existsSync
print = console.log

class View extends view
    lookup: (path) ->
        if @root instanceof Array
            # Make a backup for looping roots
            original = path
            ext = @ext
            roots = @root

            if utils.isAbsolute(path)
                return path  if exists(path)

            # <path>.<engine>
            for root in roots
                path = join(root, original)
                return path  if exists(path)

            # <path>/index.<engine>
            for root in roots
                path = join(root, original)
                path = join(dirname(path), basename(path, ext), "index" + ext)
                return path if exists(path)
        else return super(path)

module.exports = View