using Toybox.WatchUi;
using Toybox.Application.Storage;

using CompactLib.Ui;

class MenuMain extends Ui.CompactMenu {

    function initialize(){
        CompactMenu.initialize(Rez.Strings.AppName);
    }

    function build(){
        add(Rez.Strings.menuMainSaved, null, method(:callbackDummy));
        add(Rez.Strings.menuMainNearby, null, method(:callbackDummy));
        add(Rez.Strings.menuMainSearch, null, method(:callbackDummy));
        add(Rez.Strings.menuMainLists, null, method(:callbackDummy));
        add(Rez.Strings.menuMainSettings, null, method(:callbackSettings));
    }

    function callbackDummy(){
        new CacheInfo().show();
    }

    // Settings
    function callbackSettings() {
        // var settings = new Settings();
        // settings.show();
    }
}