package utils;

import lime.app.Application;

class UserCore {
    public static var username = checkUser();
    public static var developer = checkDev();
    public static var banned = checkBan();



    public static function list() {
        trace("Username : "
        + checkUser()
        + "\nDeveloper? : "
        + checkDev()
        + "\nBanned?"
        + checkBan());
    }


    public static function checkUser() {
        #if sys
		var env = Sys.environment();
		if (!env.exists("USERNAME")) {
			return "Player";
		}
		return env["USERNAME"];
		#else
		return "Player";
		#end
    }

    public static function checkDev():Bool {
        var http = new haxe.Http('https://raw.githubusercontent.com/XuelCrew/XuelOnline/main/XuelEngine-FNF/developerBadge.storage');

        http.onData = function(data:String) {
            for (i in data.split('\n')) {
                trace(i);

                if (i == '[$username]') {
                    return true;
                } else {
                    return false;
                }
            }

            return false;

            
        };

        http.onError = function(msg:String) {
            new Error("Couldn't connect to internet. Error : " + msg);
            
        };


        http.request();

        return false;
    }

    public static function checkBan():Bool {
        var http = new haxe.Http('https://raw.githubusercontent.com/XuelCrew/XuelOnline/main/XuelEngine-FNF/deathnote.storage');

        http.onData = function(data:String) {
            for (i in data.split('\n')) {
                if (i == '[$username]') {
                    return true;
                } else {
                    return false;
                }

            }

            return false;

            
        };

        http.onError = function(msg:String) {
            new Error("Couldn't connect to internet. Error : " + msg);
            
        };


        http.request();
        
        return false;
    }
}