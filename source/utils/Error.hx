package utils;

import lime.app.Application;

class Error {
    public function new(err:String) {
        Application.current.window.alert(err);
    }
}