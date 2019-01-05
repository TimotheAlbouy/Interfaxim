<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:n="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="xs" version="1.0"
>
  <xsl:output method="html" 
    encoding="UTF-8" 
    doctype-public="-//W3C//DTD HTML 4.01//EN"
    doctype-system="http://www.w3.org/TR/html4/strict.dtd" 
    indent="yes"
  />

  <xsl:template match="/" name="interfaxim">
    <xsl:apply-templates select="//n:TEI" />
  </xsl:template>

  <xsl:template match="n:TEI">
    <html>
      <head>
        <meta charset="UTF-8" />
        <meta name="title" content="Inter·faxim" />
        <meta name="author" content="Timothé &amp; Ségolène ALBOUY" />
        <meta name="description" content="Interactive facsimile" />
        <meta name="keywords" content="XSLT,XML,TEI" />
        <title><xsl:value-of select="//n:teiHeader/n:fileDesc/n:titleStmt/n:title" /></title>
        <style>
        h1 {
          font-family: 'Comic Sans MS', cursive, sans-serif;
          text-align: center;
        }

        body {
          font-family: Georgia, serif;
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

        /* Original version (ov) */

        span.choice.orig, span.choice.sic, span.choice.abbr {
          color: crimson;
          display: none;
          padding: 0px 0px 0px 0px;
        }

        /* Regularized version (rv) */

        span.choice.reg, span.choice.expan, span.choice.corr {
          color: mediumseagreen;
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
        <h1><xsl:value-of select="//n:teiHeader/n:fileDesc/n:titleStmt/n:title" /></h1>
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
            <xsl:for-each select="//n:facsimile/n:surface">
              <button onclick="{concat('changeSection(', position(), ')')}">
                <xsl:value-of select="position()" />
              </button>
            </xsl:for-each>
          </div>
        </div>
        <xsl:for-each select="//n:facsimile/n:surface">
          <xsl:variable name="url" select="n:graphic/@url" />
          <div class="section-wrapper" data-section="{position()}">
            <img src="{$url}" />
            <div class="zone-list">
              <xsl:for-each select="n:zone">
                <xsl:variable name="left" select="@ulx" />
                <xsl:variable name="top" select="@uly" />
                <xsl:variable name="width" select="number(@lrx)-number(@ulx)" />
                <xsl:variable name="height" select="number(@lry)-number(@uly)" />
                <xsl:variable name="id" select="@xml:id" />
                <xsl:variable name="facs" select="concat('#', $id)" />
                <div class="zone" style="top: {$top}px; left: {$left}px; height: {$height}px; width: {$width}px;">
                  <span style="top: {$height}px;">
                    <xsl:apply-templates select="//n:seg[@facs=$facs]" />
                  </span>
                </div>
              </xsl:for-each>
            </div>
          </div>
        </xsl:for-each>
        <script>
        function changeVersion(ver) {
          var ovnodes = document.querySelectorAll(".sic, .orig, .abbr");
          var rvnodes = document.querySelectorAll(".reg, .expan, .corr");
          if (ver === "ov") {
            for (var i = 0; i &lt; ovnodes.length; i++) {
              var el = ovnodes[i];
              el.style.display = "inline";
            }
            for (var i = 0; i &lt; rvnodes.length; i++) {
              var el = rvnodes[i];
              el.style.display = "none";
            }
          } else if (ver === "rv") {
            for (var i = 0; i &lt; ovnodes.length; i++) {
              var el = ovnodes[i];
              el.style.display = "none";
            }
            for (var i = 0; i &lt; rvnodes.length; i++) {
              var el = rvnodes[i];
              el.style.display = "inline";
            }
          }
        }

        function changeSection(sec) {
          var sections = document.querySelectorAll(".section-wrapper");
          for (var i = 0; i &lt; sections.length; i++) {
            var el = sections[i];
            if (el.dataset.section == sec)
              el.style.display = "inline-block";
            else el.style.display = "none";
          }
        }

        changeSection(1);
        </script>
      </body>
    </html>
  </xsl:template>

  <!-- Original version -->

  <xsl:template match="abbr | n:abbr">
    <span class="choice abbr"><xsl:apply-templates /></span>
  </xsl:template>

  <xsl:template match="orig | n:orig">
    <span class="choice orig"><xsl:apply-templates /></span>
  </xsl:template>

  <xsl:template match="sic | n:sic">
    <span class="choice sic"><xsl:apply-templates /></span>
  </xsl:template>

  <!-- Regularized version -->

  <xsl:template match="reg | n:reg">
    <span class="choice reg"><xsl:apply-templates /></span>
  </xsl:template>

  <xsl:template match="expan | n:expan">
    <span class="choice expan"><xsl:apply-templates /></span>
  </xsl:template>

  <xsl:template match="corr | n:corr">
    <span class="choice corr"><xsl:apply-templates /></span>
  </xsl:template>

  <!-- Not shown -->

  <xsl:template match="certainty | n:certainty">
    <span class="certainty"><xsl:apply-templates /></span>
  </xsl:template>
</xsl:stylesheet>
