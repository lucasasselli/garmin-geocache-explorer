using Toybox.Application;
using Toybox.WatchUi;

class GeocacheExplorerApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function onStart(state) {
    }

    function onStop(state) {
    }

    function getInitialView() {
        var view = new Map();
        return [ view, new MapDelegate(view)];
    }

}
