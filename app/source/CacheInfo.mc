using Toybox.Graphics;
using Toybox.WatchUi;

using CompactLib.Ui;

class CacheInfo extends Ui.CompactPager {

    var pager;

    function initialize(){
        add(new CacheInfoMainPage(), method(:selectCallback));
        add(new CacheInfoDetailPage(), null);

        CompactPager.initialize(Graphics.COLOR_WHITE, Graphics.COLOR_DK_GREEN);
    }

    function selectCallback() {
        new MenuCacheInfo("Church Micro IE 150-St Fin Barre's Cathedral, Cork").show();
    }
}

class CacheInfoMainPage extends Ui.Page {

    const MARGIN = 0.8;

    private var textArea;

    function initialize(){
        Page.initialize();
    }

    function onShow() {
        textArea = new WatchUi.TextArea({
            :text => "Church Micro IE 150-St Fin Barre's Cathedral, Cork",
            :color => Graphics.COLOR_WHITE,
            :font => [Graphics.FONT_MEDIUM, Graphics.FONT_SMALL, Graphics.FONT_XTINY],
            :locX => WatchUi.LAYOUT_HALIGN_CENTER,
            :locY => WatchUi.LAYOUT_VALIGN_CENTER,
            :justification => Graphics.TEXT_JUSTIFY_VCENTER | Graphics.TEXT_JUSTIFY_CENTER,
            :width=> System.getDeviceSettings().screenWidth*MARGIN,
            :height=> System.getDeviceSettings().screenHeight*MARGIN
        });
    }

    function onUpdate(dc) {
        textArea.draw(dc);
        dc.drawText(dc.getWidth()/  2,
                    30,
                    Graphics.FONT_XTINY,
                    "GC5XV9K",
                    Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_DK_GREEN);
    }
}

class CacheInfoDetailPage extends WatchUi.View {

    const MARGIN = 0.8;
    const GAUGE_SPACE = 5;

    private var textArea;

    function initialize() {
        View.initialize();
    }

    function onUpdate(dc) {
        drawGauge(dc, 2*dc.getHeight()/8, "Difficulty:", 5);
        drawGauge(dc, dc.getHeight()/2, "Terrain:", 3);
        drawGauge(dc, 6*dc.getHeight()/8, "Size:", 1);
    }

    function drawGauge(dc, y, text, value){
        dc.drawText(dc.getWidth()/  2,
                    y-16,
                    Graphics.FONT_XTINY,
                    text,
                    Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        var block = value;
        var margin = (dc.getWidth()-dc.getWidth()*MARGIN)/2;
        var size = (dc.getWidth()-margin*2-GAUGE_SPACE*5)/5;

        var x = margin;

        for (var i=0; i<block; i++){
            dc.fillRectangle(x, y, size, 10);
            x += size + GAUGE_SPACE;
        }
    }
}