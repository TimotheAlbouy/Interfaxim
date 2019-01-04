# Interfaxim

This project provides a XSL file (named `interfaxim.xsl`) that transforms a text encoding XML file into a HTML interactive facsimile.

*[Lisez en français][1]*

In order to get the transformation working, the XML file must respect the [TEI guidelines][2] strictly. Do not forget the namespace: `<TEI xmlns="http://www.tei-c.org/ns/1.0">...</TEI>`.

## Get started

There are 3 ways to use Interfaxim on your own text encoding file:

### Option 1: Use a XML editor like Oxygen

First, download the Interfaxim archive by clicking [here][3] and extract its file named `interfaxim.xsl`. Then, use a text editor that possesses a XSLT processor (like [Oxygen][4]) to transform your XML file with `interfaxim.xsl`. It will generate the HTML interactive facsimile of your text encoding file.

**Pros:** You can use almost every web browser available to open the generated HTML file, unlike the 2 other methods that require one of the compatible browsers listed in the **[Browser compatibility][5]** section. Besides, you can create interactive facsimiles offline.

**Cons:** You must have on your computer a XML editor equipped with a XSLT processor.

### Option 2: (On web browser) Use the Interfaxim file served on GitHub

Add the following tag after the `<?xml ... ?>` declaration in your XML file:

    <?xml-stylesheet
      type="text/xsl"
      href="https://raw.githubusercontent.com/TimotheAlbouy/Interfaxim/master/interfaxim.xsl"
    ?>

Then open the XML file in one of the compatible browsers (listed below) and *voilà*.

**Pros:** You don't have to download anything and you get the latest version of Interfaxim automatically.

**Cons:** You can only use this method on one of the compatible web browsers listed in the **[Browser compatibility][5]** section. Also, it requires an Internet connection for the first time, although it might be not necessary the following times because the XSL file may already be stored in your browser's cache.

### Option 3: (On web browser) Download Interfaxim locally

First, download the Interfaxim archive by clicking [here][3] and extract its file named `interfaxim.xsl`. Place it in the same folder as your XML file, then add this line in your XML file after the `<?xml ... ?>` declaration:

    <?xml-stylesheet type="text/xsl" href="interfaxim.xsl"?>

**Pros:** You can create interactive facsimiles offline.

**Cons:** You can only use this method on one of the compatible web browsers listed in the **[Browser compatibility][5]** section.

## Browser compatibility

:heavy_check_mark:: Full support; :x:: Not supported by default; :grey_exclamation:: Working but with display bugs

|       Firefox      | Chrome | Opera |  Internet Explorer |         Edge       |        Safari      |
|:------------------:|:------:|:-----:|:------------------:|:------------------:|:------------------:|
| :heavy_check_mark: |  :x:\* | :x:\* | :grey_exclamation: | :grey_exclamation: | :grey_exclamation: |

\* Due to [security concerns][6], Interfaxim can't work by default on the Chromium family browsers (**Google Chrome**, **Chromium**, **Opera**, ...). You can still run Interfaxim on these browsers if you launch them in `--allow-file-access-from-files` mode ([instructions here][7]).

You can notify us of other cross-browser compatibility problems in the [Issues][8] section.

  [1]: https://github.com/TimotheAlbouy/Interfaxim/blob/master/README.md
  [2]: http://www.tei-c.org/release/doc/tei-p5-doc/en/html/
  [3]: https://github.com/TimotheAlbouy/Interfaxim/blob/master/interfaxim.zip?raw=true
  [4]: https://www.oxygenxml.com/
  [5]: #browser-compatibility
  [6]: https://blog.chromium.org/2008/12/security-in-depth-local-web-pages.html
  [7]: http://www.chrome-allow-file-access-from-file.com/
  [8]: https://github.com/TimotheAlbouy/Interfaxim/issues
