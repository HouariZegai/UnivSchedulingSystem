<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Gestion des emploi du temps</title>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <link rel="stylesheet" href="../Resources/css/bootstrap.min.css" />
            </head>
            <body>
                <div class="container">
                    <h3>Promotion: <span style="color: #2196f3"><xsl:value-of select="emploi/@promotion" /></span></h3>
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
                            <xsl:for-each select="emploi/seance">
                                <tr>
                                    <td><xsl:value-of select="./@jour"/></td>
                                    <td><xsl:value-of select="./@debut"/></td>
                                    <td><xsl:value-of select="./@fin"/></td>
                                    <td><xsl:value-of select="./@prof"/></td>
                                    <td><xsl:value-of select="./@module"/></td>
                                    <td><xsl:value-of select="./@salle"/></td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>