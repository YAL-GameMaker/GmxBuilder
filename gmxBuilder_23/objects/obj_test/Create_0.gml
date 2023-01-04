var spr = new Gmx("sprite");
spr.addIntChild("type", 0);
spr.addIntChild("xorig", 0);
spr.addIntChild("width", 16);
spr.addIntChild("height", 16);
var frames = spr.addEmptyChild("frames");
for (var i = 0; i < 5; i++) {
    var frame = frames.addTextChild("frame", "images\spr_test_" + string(i) + ".png");
    frame.setAttribute("index", i);
}

var file = file_text_open_write("spr_test.sprite.gmx");
file_text_write_string(file, spr.printWithHeader());
file_text_close(file);