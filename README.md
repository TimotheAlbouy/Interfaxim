# Interfaxim

This project provides a XSL file (named `interfaxim.xsl`) that transforms a text encoding XML file into a HTML interactive facsimile.

In order to get the transformation working, the XML file must respect the [TEI guidelines][1] strictly. Do not forget the namespace: `<TEI xmlns="http://www.tei-c.org/ns/1.0">...</TEI>`.

There are two ways to use Interfaxim on your own text encoding file:

### Option 1: Use the Interfaxim file served on GitHub

Just add this tag after the `<?xml ... ?>` declaration in your XML file:

    <?xml-stylesheet
      type="text/xsl"
      href="https://raw.githubusercontent.com/TimotheAlbouy/Interfaxim/master/interfaxim.xsl"
    ?>

This method is arguably the best one: you don't have to download anything and you always get the latest version of Interfaxim automatically. Of course, it requires an Internet connection for the first time, although this might not be necessary the following times because the XSL file may already be stored in your browser's cache.

### Option 2: Download Interfaxim locally

Download an archive by clicking on [this link][5] and extract it to get the Interfaxim XSL file. Place it in the same folder as your XML file, then add this line in this XML file after the `<?xml ... ?>` declaration:

    <?xml-stylesheet type="text/xsl" href="interfaxim.xsl"?>

The only advantage of this method is that it allows you to work offline.

## Browser compatibility

|       Firefox      | Chrome | Opera | Internet Explorer |       Edge      |      Safari     |
|:------------------:|:------:|:-----:|:-----------------:|:---------------:|:---------------:|
| :heavy_check_mark: |  :x:\* | :x:\* |      :x:\*\*      | :grey_question: | :grey_question: |

\* Due to [security concerns][2], Interfaxim can't work by default on the Chromium family browsers (**Google Chrome**, **Chromium**, **Opera**, ...). You can still run Interfaxim on these browsers if you launch them in `--allow-file-access-from-files` mode ([instructions here][3]).
\*\* Interfaxim can't work on **Internet Explorer** because of a lack of XSLT support.

You can notify us of other cross-browser compatibility issues in the [Issues][4] section.

  [1]: http://www.tei-c.org/release/doc/tei-p5-doc/en/html/
  [2]: https://blog.chromium.org/2008/12/security-in-depth-local-web-pages.html
  [3]: http://www.chrome-allow-file-access-from-file.com/
  [4]: https://github.com/TimotheAlbouy/Interfaxim/issues
  [5]: https://github.com/TimotheAlbouy/Interfaxim/blob/master/interfaxim.zip?raw=true
