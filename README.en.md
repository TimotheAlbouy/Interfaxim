# Interfaxim

This project provides a XSL file (named `interfaxim.xsl`) that transforms a text encoding XML file into a HTML interactive facsimile.

*[Lisez en français][1]*

In order to get the transformation working, the XML file must respect the [TEI guidelines][2] strictly. Do not forget the namespace: `<TEI xmlns="http://www.tei-c.org/ns/1.0">...</TEI>`.

## Get started

There are 3 ways to use Interfaxim on your own text encoding file:

### Option 1: Use a XML editor like Oxygen

First, download the Interfaxim archive by clicking **[here][3]** and extract its file named `interfaxim.xsl`. Then, use a text editor that possesses a XSLT processor (like **[Oxygen][4]**) to transform your XML file with `interfaxim.xsl`. It will generate an HTML file that can be opened on almost every browser and that contains the interactive facsimile of your text encoding file.

**Pros:** You can use almost every web browser available to open up the generated HTML file, unlike the 2 other methods that require one of the compatible browsers listed in the **[Browser compatibility][5]** section. Besides, you can create interactive facsimiles without Internet connection.

**Cons:** You must download on your computer a XML editor (like **[Oxygen][4]** for instance) if you don't already have one.

### Option 2: (On web browser) Use the Interfaxim file served on GitHub

Add the following tag after the `<?xml ... ?>` declaration in your XML file:

    <?xml-stylesheet
      type="text/xsl"
      href="https://raw.githubusercontent.com/TimotheAlbouy/Interfaxim/master/interfaxim.xsl"
    ?>

Finally, open up the XML file on one of the compatible browsers ([listed below][5]) and *voilà*.

**Pros:** You don't have to download anything and you get the latest version of Interfaxim automatically.

**Cons:** You can only use this method on one of the compatible web browsers listed in the **[Browser compatibility][5]** section. Also, it requires an Internet connection for the first time, although it might be not necessary the following times because the XSL file may already be stored in your browser's cache.

### Option 3: (On web browser) Download Interfaxim locally

First, download the Interfaxim archive by clicking **[here][3]** and extract its file named `interfaxim.xsl`. Place it in the same folder as your XML file, then add this line in your XML file after the `<?xml ... ?>` declaration:

    <?xml-stylesheet type="text/xsl" href="interfaxim.xsl"?>

Finally, open up the XML file on one of the compatible browsers ([listed below][5]) and *voilà*.

**Pros:** You can create interactive facsimiles without Internet connection.

**Cons:** You can only use this method on one of the compatible web browsers listed in the **[Browser compatibility][5]** section.

## Browser compatibility

This section concerns you only if you choose **[Option 2][7]** or **[Option 3][8]**, but not if you choose **[Option 1][6]**.

:heavy_check_mark:: **Full support** — :x:: **Not supported by default** — :grey_exclamation:: **Working but with display bugs**

|       Firefox      | Chrome | Opera |  Internet Explorer |         Edge       |        Safari      |
|:------------------:|:------:|:-----:|:------------------:|:------------------:|:------------------:|
| :heavy_check_mark: |  :x:\* | :x:\* | :heavy_check_mark: | :heavy_check_mark: | :grey_exclamation: |

\* Due to [security concerns][9], the Chromium family browsers (**Google Chrome**, **Chromium**, **Opera**, ...) don't allow by default local XSLT transformations, thus making Interfaxim ineffective. But you can bypass this limitation by launching these browsers in `--allow-file-access-from-files` mode ([instructions here][10]).

You can notify us of other cross-browser compatibility problems in the [Issues][11] section.

  [1]: README.md
  [2]: http://www.tei-c.org/release/doc/tei-p5-doc/en/html/
  [3]: interfaxim.zip?raw=true
  [4]: https://www.oxygenxml.com/
  [5]: #browser-compatibility
  [6]: #option-1-use-a-xml-editor-like-oxygen
  [7]: #option-2-on-web-browser-use-the-interfaxim-file-served-on-github
  [8]: #option-3-on-web-browser-download-interfaxim-locally
  [9]: https://blog.chromium.org/2008/12/security-in-depth-local-web-pages.html
  [10]: http://www.chrome-allow-file-access-from-file.com/
  [11]: https://github.com/TimotheAlbouy/Interfaxim/issues
