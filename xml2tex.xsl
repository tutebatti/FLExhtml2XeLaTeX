<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

  <xsl:output method="text" version="1.0" encoding="UTF-8" />
  <xsl:strip-space elements="*"/>

  <!-- variable to switch between spacious and compact layout -->

  <xsl:variable name="compactlayout">
    <xsl:value-of select="true()"/>
  </xsl:variable>

  <!-- variable to switch creators on/off -->

  <xsl:variable name="showcreators">
    <xsl:value-of select="true()"/>
  </xsl:variable>

  <!-- variable to switch dates on/off -->

  <xsl:variable name="showdates">
    <xsl:value-of select="true()"/>
  </xsl:variable>

  <!-- variable to switch comments on/off -->

  <xsl:variable name="showcomments">
    <xsl:value-of select="false()"/>
  </xsl:variable>

  <!-- include modules -->

  <xsl:include href="./xsl-modules/01_root-element.xsl"/>
  <xsl:include href="./xsl-modules/02_scripts-and-fonts.xsl"/>
  <xsl:include href="./xsl-modules/03_headword-matter.xsl"/>
  <xsl:include href="./xsl-modules/04_phonology.xsl"/>
  <xsl:include href="./xsl-modules/05_orthography.xsl"/>
  <xsl:include href="./xsl-modules/06_etymologies.xsl"/>
  <xsl:include href="./xsl-modules/07_morphology.xsl"/>
  <xsl:include href="./xsl-modules/08_senses.xsl"/>
  <xsl:include href="./xsl-modules/09_examples.xsl"/>
  <xsl:include href="./xsl-modules/10_pictures.xsl"/>
  <xsl:include href="./xsl-modules/11_subentries.xsl"/>
  <xsl:include href="./xsl-modules/12_sidebars.xsl"/>
  <xsl:include href="./xsl-modules/13_simtho-meta-data.xsl"/>
  <xsl:include href="./xsl-modules/14_comments.xsl"/>
  <xsl:include href="./xsl-modules/15_corpus-data.xsl"/>
  <xsl:include href="./xsl-modules/16_sources.xsl"/>
  <xsl:include href="./xsl-modules/17_references.xsl"/>

</xsl:stylesheet>
