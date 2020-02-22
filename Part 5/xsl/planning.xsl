<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/emploi">
        <div>
            <h3 style="margin-top: 10px" align="center">Planning</h3>
            <table id="tablePlanning" class="table" style="margin-top: 10px">
                <thead>
                    <tr>
                        <th scope="col">Jour</th>
                        <th scope="col">Debut</th>
                        <th scope="col">Fin</th>
                        <th scope="col">Prof</th>
                        <th scope="col">Module</th>
                        <th scope="col">Salle</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="seance">
                        <tr>
                            <td><xsl:value-of select="@jour"/></td>
                            <td><xsl:value-of select="@debut"/></td>
                            <td><xsl:value-of select="@fin"/></td>
                            <td><xsl:value-of select="@prof"/></td>
                            <td><xsl:value-of select="@module"/></td>
                            <td><xsl:value-of select="@salle"/></td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </div>
    </xsl:template>
</xsl:stylesheet>