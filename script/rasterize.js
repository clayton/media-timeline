var page = require('webpage').create(),
    address, png_out, html_out, size, page_source;
var fs = require('fs');


if (phantom.args.length < 3 || phantom.args.length > 4) {
    console.log('Usage: rasterize.js URL png-filename html-filename');
    phantom.exit();
} else {
    address = phantom.args[0];
    png_out = phantom.args[1];
    html_out = phantom.args[2];
    page.viewportSize = { width: 1024, height: 768 };
    page.open(address, function (status) {
        if (status !== 'success') {
            console.log('Unable to load the address!');
        } else {
            window.setTimeout(function(){
                page.sendEvent("click", 0,0);
            }, 1000);

            window.setTimeout(function () {
                page.render(png_out);
                page_source = page.evaluate(function () {
                    return document.getElementsByTagName('html')[0].innerHTML
                });
                fs.write(html_out, page_source, "w");
                phantom.exit();
            }, 500);
        }
    });
}