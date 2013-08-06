var createApp, express;

express = require("express");

createApp = function () {
    var project;
    project = express();
    project.install = function (app) {
        if (app instanceof String) {
            app = require(app);
        }
        return app.install(project);
    };
    return project;
};


module.exports = {
    Installer: require("./installer"),
    View: require("./view"),
    express: createApp
};