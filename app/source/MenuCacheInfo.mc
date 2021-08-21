using Toybox.WatchUi;
using Toybox.Application.Storage;

using CompactLib.Ui;

class MenuCacheInfo extends Ui.CompactMenu {

    private var saved;

    function initialize(cache){
        CompactMenu.initialize(cache);
    }

    function build(){
        add(Rez.Strings.menuCacheNavigate, null, method(:callbackDummy));
        add(Rez.Strings.menuCacheHint, null, method(:callbackHint));

        if(saved == true){
            add(Rez.Strings.menuCacheDelete, null, method(:callbackDummy));
        }else{
            add(Rez.Strings.menuCacheSave, null, method(:callbackDummy));
        }
    }

    function getDummyLabel(){
        return "TODO";
    }

    function callbackDummy(){
        new Ui.CompactText(["Page 1", "Page 2"]).show();
    }

    function callbackHint(){
        new Ui.CompactText("This a very very very very very very very very looooooooooooong hint!").show();
    }
}