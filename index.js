'use strict';

// Require index.html so it gets copied to dist
require('./index.html');

require('!style!css!sass!bulma')
require('!style!css!sass!./styles/main.scss')

var Elm = require('./src/Main.elm');
var localStorage = require('local-storage');

var mountNode = document.getElementById('main');
var app = Elm.Main.embed(mountNode, { jwtToken: localStorage.get("jwtToken")});

// Local storage port
app.ports.getStorage.subscribe(key => {
    app.ports.storageValue.send([key, localStorage.get(key)]);
});

app.ports.setStorage.subscribe(tuple => {
    localStorage.set(tuple[0], tuple[1]);
});
