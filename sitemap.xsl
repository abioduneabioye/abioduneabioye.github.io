<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
                xmlns:html="http://www.w3.org/TR/REC-html40"
                xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>XML Sitemap</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <style type="text/css">
          body {
            font-family: Helvetica, Arial, sans-serif;
            font-size: 13px;
            color: #545353;
          }
          table {
            border: none;
            border-collapse: collapse;
          }
          #sitemap tr.odd {
            background-color: #eee;
          }
          #sitemap tbody tr:hover {
            background-color: #ccc;
          }
          #sitemap tbody tr:hover td, #sitemap tbody tr:hover td a {
            color: #000;
          }
          #sitemap td {
            font-size: 11px;
          }
          #sitemap th {
            text-align: left;
            padding-right: 30px;
            font-size: 11px;
          }
          #sitemap td {
            padding: 5px;
          }
          #sitemap th {
            border-bottom: 1px solid #000;
            cursor: pointer;
          }
          a {
            color: #000;
            text-decoration: none;
          }
          a:visited {
            color: #777;
          }
          a:hover {
            text-decoration: underline;
          }
        </style>
      </head>
      <body>
        <div id="content">
          <h1>XML Sitemap</h1>
          <p>
            This is a sitemap for <a href="https://mohammadrezanarimaniucdavis.github.io/">MohammadrezaNarimaniUCDavis.github.io</a>.
          </p>
          <table id="sitemap">
            <thead>
              <tr>
                <th width="70%">URL</th>
                <th width="10%">Priority</th>
                <th width="10%">Change Freq.</th>
                <th width="10%">Last Change</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="sitemap:urlset/sitemap:url">
                <tr>
                  <xsl:if test="position() mod 2 != 1">
                    <xsl:attribute name="class">odd</xsl:attribute>
                  </xsl:if>
                  <td>
                    <xsl:variable name="itemURL">
                      <xsl:value-of select="sitemap:loc"/>
                    </xsl:variable>
                    <a href="{$itemURL}">
                      <xsl:value-of select="sitemap:loc"/>
                    </a>
                  </td>
                  <td>
                    <xsl:value-of select="concat(sitemap:priority*100,'%')"/>
                  </td>
                  <td>
                    <xsl:value-of select="sitemap:changefreq"/>
                  </td>
                  <td>
                    <xsl:value-of select="concat(substring(sitemap:lastmod,0,11),concat(' ', substring(sitemap:lastmod,12,5)))"/>
                  </td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>