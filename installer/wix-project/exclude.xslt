<?xml version="1.0" ?>
<!-- filtering the XML output of the Wix harvest tool using XSLT rules -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:wix="http://schemas.microsoft.com/wix/2006/wi">

	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
	<xsl:strip-space elements="*"/>

	<!-- copy all attributes and elements to the output -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

	<!-- exclude folders -->
	<xsl:key name="DirectoriesToRemove" match="wix:Directory[
		@Name = 'installer' or
		@Name = 'home'
		]" use="@Id" />
	<xsl:template match="wix:Directory[key('DirectoriesToRemove', @Id)]" />

	<xsl:key name="DirectoryComponentsToRemove" match="wix:Directory[
		@Name = 'installer' or
		@Name = 'home'
		]" use="descendant::wix:Component/@Id" />
	<xsl:template match="wix:ComponentRef[key('DirectoryComponentsToRemove', @Id)]" />

	<!-- exclude files -->
	<xsl:key name="FileendingsToRemove" match="wix:Component[
		substring(wix:File/@Source, string-length(wix:File/@Source) - string-length('.test') +1) = '.test' or
		substring(wix:File/@Source, string-length(wix:File/@Source) - string-length('.msi') +1) = '.msi'
		]" use="@Id" />
	<xsl:template match="*[self::wix:Component or self::wix:ComponentRef] [key('FileendingsToRemove', @Id)]" />

</xsl:stylesheet>