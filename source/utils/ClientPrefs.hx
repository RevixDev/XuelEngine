package utils;

class ClientPrefs {
    public static var antialiasing:Dynamic = null;
    public static var antialiasing_default = true;

    public static function loadSettings() {
        if (FlxG.save.data.coolGraphics != null) {
            antialiasing = FlxG.save.data.coolGraphics;
        } else {
            FlxG.save.data.coolGraphics = antialiasing_default;
            antialiasing = FlxG.save.data.coolGraphics;
        }
    }
}