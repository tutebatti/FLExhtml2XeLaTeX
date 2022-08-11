<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    >

  <!-- heading for senses -->

  <xsl:template match="senses">
    <xsl:if test="not($compactlayout = true())">
      <!-- to add heading depending on number of senses, set number other than 0 -->
      <xsl:if test="count(./sensecontent) > 0">
        <xsl:text>

        \medskip{}
        \textbf{Senses}

        </xsl:text>
      </xsl:if>
    </xsl:if>
        <xsl:apply-templates/>
      <xsl:text></xsl:text>
  </xsl:template>

  <!-- part-of-speech -->

  <!-- 1) if the same for all senses -->

  <xsl:template match="senses/sharedgrammaticalinfo//partofspeech">
    <xsl:text>

    \textit{</xsl:text>
      <xsl:apply-templates/>
    <xsl:choose>
      <xsl:when test="$compactlayout  = true()">
        <xsl:text>} </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>} </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- 2) if different in different senses -->

  <xsl:template match="sense//partofspeech">
    <xsl:text>~\textit{</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>} </xsl:text>
  </xsl:template>

  <!-- sense content: -->

  <xsl:template match="sensecontent">
    <xsl:choose>
      <xsl:when test="$compactlayout  = true()">
        <xsl:text></xsl:text>
          <xsl:apply-templates/>

          <xsl:if test="position() != last()">
            <xsl:text>\,; </xsl:text>
          </xsl:if>

      </xsl:when>
      <xsl:otherwise>
        <xsl:text>

        </xsl:text>
          <xsl:apply-templates/>
        <xsl:text></xsl:text>
      </xsl:otherwise>
    </xsl:choose>


  </xsl:template>

  <!-- sense number -->

  <xsl:template match="sensenumber">
    <xsl:text>\textbf{</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>)} </xsl:text>
  </xsl:template>

  <!-- sense type -->

  <xsl:template match="sensetype">
    <xsl:text>(\textit{</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>}) </xsl:text>
  </xsl:template>

  <!-- glosses -->

  <xsl:template match="definitionorgloss">

    <xsl:choose>

      <xsl:when test="$compactlayout = true()">
        <xsl:text> \textbf{</xsl:text>
          <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
      </xsl:when>

      <xsl:otherwise>
        <!-- Local variable is generated to check the preceding element. -->
        <xsl:variable name="precedingelement">
          <xsl:value-of select="(preceding-sibling::*[1])/name()"/>
        </xsl:variable>

        <xsl:choose>

          <!-- insert space if preceded by <restrictions> -->
          <xsl:when test="$precedingelement = 'restrictions'">
            <xsl:text> \textbf{</xsl:text>
              <xsl:apply-templates/>
            <xsl:text>}</xsl:text>
          </xsl:when>

          <xsl:otherwise>
            <xsl:text>\textbf{</xsl:text>
              <xsl:apply-templates/>
            <xsl:text>}</xsl:text>
          </xsl:otherwise>

        </xsl:choose>
      </xsl:otherwise>

    </xsl:choose>

  </xsl:template>

  <!-- lexsensereferences -->

  <xsl:template match="lexsensereference">
    <xsl:text> </xsl:text>
      <xsl:apply-templates/>
    <xsl:text></xsl:text>
  </xsl:template>

  <xsl:template match="lexsensereference//ownertype_abbreviation">
    <xsl:text></xsl:text>
      <xsl:apply-templates/>
    <xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template match="lexsensereference//configtarget/headword">
    <xsl:text>\textsyriac{</xsl:text>
      <xsl:value-of select="normalize-space(./syriac)"/>
    <xsl:text>}</xsl:text>

    <xsl:if test="./lexsensereference_sensenumber">
      <xsl:text> </xsl:text>
        <xsl:value-of select="./lexsensereference_sensenumber"/>
      <xsl:text>)</xsl:text>
    </xsl:if>

  </xsl:template>

  <xsl:template match="
    lexsensereference//configtarget//syriac|
    lexsensereference//configtarget//lexsensereference_sensenumber
    "/>

  <xsl:template match="sense/source">
    <xsl:text> [cf. </xsl:text>
      <xsl:apply-templates/>
    <xsl:text>]</xsl:text>
  </xsl:template>

</xsl:stylesheet>
