package states;

class BannedState extends MusicBeatState {
    var bg:FlxSprite;

    var banned:Alphabet;
    var desc:Alphabet;
    var support:Alphabet;


    var itemArray = [];

    override public function create() {
        super.create();

        bg = new FlxSprite().loadGraphic(Paths.image('menuBG'));
        add(bg);
        

        banned = new Alphabet(0,13, "You Are Banned!", true, false);
        banned.screenCenter(X);
        itemArray.push(banned);

        desc = new Alphabet(0, 23, "Hey, " + UserCore.username + " you have been banned.", false, false);
        desc.screenCenter(X);
        itemArray.push(desc);

        support = new Alphabet(0, 23*3, "To get unbanned submit an unban request press ENTER to open", false, false);
        support.screenCenter(X);
        itemArray.push(support);

        addAssets();
        
    }

    public function addAssets() {
        for (i in itemArray) {
            add(i);
        }
    }
}