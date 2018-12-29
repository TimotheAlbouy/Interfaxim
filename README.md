# Interfaxim
This project provides a XSL file (named `interfaxim.xsl`) that transforms a text encoding XML file into a HTML interactive facsimile. In order to get the transformation working, the XML file must respect the TEI (Text Encoding Initiative) guidelines.

There a two ways to use Interfaxim on your own text encoding file:

1. Download Interfaxim locally

Download the Interfaxim XSL file by clicking [this link][1], and place it in the same folder than your XML file. Then add this line in this XML file after the `<?xml ... ?>` declaration:

    <?xml-stylesheet type="text/xsl" href="interfaxim.xsl"?>

**WARNING:** Due to [security concerns][2], this method is limited on certain browsers. On Google Chrome for instance, it doesn't work by default but you could still run it if you launch the browser in `--allow-file-access-from-files` mode ([instructions here][3]). Nonetheless, it works well for browsers like Firefox, Safari or Internet Explorer.

2. Use the Interfaxim file served here on GitHub

Just add this line after the `<?xml ... ?>` declaration in your XML file:

    <?xml-stylesheet type="text/xsl" href="https://raw.githubusercontent.com/TimotheAlbouy/Interfaxim/master/interfaxim.xsl"?>

This method is arguably the best one: you don't have to download anything, there's no cross-browser compatibility problem like in the first method and you always get the latest version of Interfaxim automatically. Of course, it requires an Internet connection for the first time, although this might not be necessary the following times because the XSL file may already be stored in your browser's cache.

  [1]: https://raw.githubusercontent.com/TimotheAlbouy/Interfaxim/master/interfaxim.xsl
  [2]: https://blog.chromium.org/2008/12/security-in-depth-local-web-pages.html
  [3]: http://www.chrome-allow-file-access-from-file.com/
