//@ sourceMappingURL=express-django.map
// Generated by CoffeeScript 1.6.1
(function() {
  var Installer, add_routing, createApp, express, fs, path, route;

  createApp = void 0;

  express = require("express");

  Installer = require("./installer");

  fs = require("fs");

  path = require("path");

  add_routing = function(app) {};

  createApp = function() {
    var project;
    project = void 0;
    project = express();
    project.install = function(_arg) {
      var app, installer, stat, url;
      app = _arg.app, url = _arg.url;
      if (!fs.existsSync(app)) {
        app = require.resolve(app);
      } else {
        app = path.resolve(app);
      }
      stat = fs.lstatSync(app);
      if (stat.isFile()) {
        app = path.dirname(app);
      }
      return installer = new Installer({
        app: project,
        url: url,
        dirname: app
      });
    };
    return project;
  };

  route = function(name, pattern, fn) {
    fn.name = name;
    fn.pattern = pattern;
    return fn;
  };

  module.exports = {
    "View": require("./view"),
    "express": express,
    "new": createApp,
    "route": route
  };

}).call(this);
