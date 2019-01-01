<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs" version="1.0"
>
  <!-- xmlns:xml="http://www.tei-c.org/ns/1.0" -->
  <xsl:output method="html" 
    encoding="UTF-8" 
    doctype-public="-//W3C//DTD HTML 4.01//EN"
    doctype-system="http://www.w3.org/TR/html4/strict.dtd" 
    indent="yes"
  />

  <xsl:template match="/" name="interfaxim">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>Interfaxim</title>
        <style>
        body {
          font-family: 'Comic Sans MS', cursive, sans-serif;
        }

        .section-wrapper {
          position: relative;
        }

        .zone {
          position: absolute;
        }

        .zone span {
          position: relative;
          display: block;
          overflow-y: auto;
          visibility: hidden;
          background-color: white;
          font-family: Georgia, serif;
          padding: 0px 5px 0px 5px;
        }

        .zone:hover span {
          visibility: visible;
        }

        /* Original version */

        span.choice.orig span.choice.sic span.choice.abbr {
          color: red;
          display: none;
          padding: 0px 0px 0px 0px;
        }

        /* Regularized version */

        span.choice.reg span.choice.expan {
          color: green;
          padding: 0px 0px 0px 0px;
          display: inline;
        }

        /* Not shown */

        span.certainty {
          display: none;
        }
        </style>
      </head>
      <body>
        <h1 style="text-align: center;">Inter·faxim</h1>
        <div>
          <label><b>Version: </b></label>
          <label>Regularized</label>
          <input type="radio" name="version" onchange="changeVersion('rv')" checked="checked" />
          <label>Original</label>
          <input type="radio" name="version" onchange="changeVersion('ov')" />
        </div>
        <div>
          <label><b>Section:</b></label>
          <div class="tabs">
            <xsl:for-each select="//facsimile/surface">
              <button onclick="{concat('changeSection(', concat(position(), ')'))}">
                <xsl:value-of select="position()" />
              </button>
            </xsl:for-each>
          </div>
        </div>
        <xsl:for-each select="//facsimile/surface">
          <xsl:variable name="url" select="graphic/@url" />
          <div class="section-wrapper" data-section="{position()}">
            <img src="{$url}" />
            <div class="zone-list">
              <xsl:for-each select="zone">
                <xsl:variable name="left" select="@ulx" />
                <xsl:variable name="top" select="@uly" />
                <xsl:variable name="width" select="number(@lrx)-number(@ulx)" />
                <xsl:variable name="height" select="number(@lry)-number(@uly)" />
                <xsl:variable name="id" select="@xml:id" />
                <xsl:variable name="facs" select="concat('#',$id)" />
                <div class="zone" style="top: {$top}px; left: {$left}px; height: {$height}px; width: {$width}px;">
                  <span style="top: {$height}px;">
                    <xsl:apply-templates select="//seg[@facs=$facs]" />
                  </span>
                </div>
              </xsl:for-each>
            </div>
          </div>
        </xsl:for-each>
        <script>
        function changeVersion(ver) {
          let ovnodes = document.querySelectorAll(".sic, .orig, .abbr");
          let rvnodes = document.querySelectorAll(".reg, .expan");
          switch (ver) {
            case "ov":
              ovnodes.forEach(el => el.style.display = "inline");
              rvnodes.forEach(el => el.style.display = "none");
              break;
            case "rv":
              ovnodes.forEach(el => el.style.display = "none");
              rvnodes.forEach(el => el.style.display = "inline");
              break;
          }
        }

        function changeSection(sec) {
          let sections = document.querySelectorAll(".section-wrapper");
          sections.forEach(el => {
            if (el.dataset.section == sec)
              el.style.display = "inline-block";
            else el.style.display = "none";
          });
        }

        changeSection(1);
        </script>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="abbr">
    <span class="choice abbr"><xsl:apply-templates /></span>
  </xsl:template>

  <xsl:template match="expan">
    <span class="choice expan"><xsl:apply-templates /></span>
  </xsl:template>

  <xsl:template match="orig">
    <span class="choice orig"><xsl:apply-templates /></span>
  </xsl:template>

  <xsl:template match="sic">
    <span class="choice sic"><xsl:apply-templates /></span>
  </xsl:template>

  <xsl:template match="reg">
    <span class="choice reg"><xsl:apply-templates /></span>
  </xsl:template>

  <xsl:template match="certainty">
    <span class="certainty"><xsl:apply-templates /></span>
  </xsl:template>
</xsl:stylesheet>
