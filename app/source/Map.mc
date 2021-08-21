using Toybox.WatchUi;
using Toybox.Position;
using Toybox.System;

class Map extends WatchUi.MapTrackView {

    var offset = 0.0004;

    function initialize() {

        MapTrackView.initialize();

        Position.enableLocationEvents(Position.LOCATION_CONTINUOUS, method(:onPosition));

        setPosition([51.903614, -8.468399]);
        setScreenVisibleArea(0, 0, System.getDeviceSettings().screenWidth, System.getDeviceSettings().screenHeight);
        setMapMode(WatchUi.MAP_MODE_PREVIEW);
    }

    function onPosition(info) {
        var myLocation = info.position.toDegrees();
        System.println("Latitude: " + myLocation[0]); // e.g. 38.856147
        System.println("Longitude: " + myLocation[1]); // e.g -94.800953
    }

    function setPosition(position){
        var top_left = new Position.Location({:latitude => position[0] + offset, :longitude => position[1] - offset, :format => :degrees});
        var bottom_right = new Position.Location({:latitude => position[0] - offset, :longitude => position[1] + offset, :format => :degrees});
        setMapVisibleArea(top_left, bottom_right);
        WatchUi.requestUpdate();
    }
}

class MapDelegate extends WatchUi.BehaviorDelegate
{
    var mView;

    function initialize(view) {
        BehaviorDelegate.initialize();
        mView = view;
    }

    function onBack() {
        if(mView.getMapMode() == WatchUi.MAP_MODE_PREVIEW) {
            WatchUi.popView(WatchUi.SLIDE_UP);
        } else {
            mView.setMapMode(WatchUi.MAP_MODE_PREVIEW);
        }
        return true;
    }

    function onMenu() {
        new MenuMain().show();
    }

    function onSelect() {
        mView.setMapMode(WatchUi.MAP_MODE_BROWSE);
        return true;
    }
}
