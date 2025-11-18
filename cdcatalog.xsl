<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">
  
  <xsl:template match="/">
    <fo:root>
      <fo:layout-master-set>
        <fo:simple-page-master master-name="A4-portrait"
                               page-height="29.7cm" page-width="21cm"
                               margin-top="2cm" margin-bottom="2cm"
                               margin-left="2.5cm" margin-right="2.5cm">
          <fo:region-body margin-top="1.5cm"/>
          <fo:region-before extent="1.5cm"/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      
      <fo:page-sequence master-reference="A4-portrait">
        
        <fo:static-content flow-name="xsl-region-before">
          <fo:block font-family="sans-serif" font-size="14pt" font-weight="bold" text-align="center" border-bottom="1pt solid black" padding-bottom="3pt">
            Customer List
          </fo:block>
        </fo:static-content>
        
        <fo:flow flow-name="xsl-region-body">
          
          <fo:block font-family="serif" font-size="18pt" font-weight="bold" space-after="0.5cm" color="#333333">
            Registered Customers
          </fo:block>
          
          <xsl:apply-templates select="customers/customer"/>
          
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
  
  <xsl:template match="customer">
    <fo:block-container space-after="0.7cm" border-top="1pt solid #CCCCCC" padding-top="5pt" break-after="page">
      <fo:block font-family="sans-serif" font-size="12pt" font-weight="bold" space-after="0.2cm">
        <xsl:value-of select="normalize-space(name)"/>
      </fo:block>
      <fo:block font-family="serif" font-size="10pt" color="#555555">
        <xsl:value-of select="normalize-space(address)"/>
      </fo:block>
    </fo:block-container>
  </xsl:template>
  
</xsl:stylesheet>