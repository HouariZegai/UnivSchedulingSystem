<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/promotion">
        <html>
            <head>
                <title>Etudiants and modules</title>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <link rel="stylesheet" href="../Resources/css/bootstrap.min.css" />
            </head>
            <body>
                <div class="container">
                    <h3>Promotion: <span style="color: #2196f3"><xsl:value-of select="@niveau" /><xsl:value-of select="@option" /></span></h3>
                    <table class="table" style="margin-top: 10px">
                        <thead>
                            <tr>
                                <th scope="col" colspan="3" style="text-align: center"><h5>Etudiants</h5></th>
                            </tr>
                            <tr>
                                <th scope="col">Num Inscription</th>
                                <th scope="col">Nom</th>
                                <th scope="col">Prenom</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="etudiants/etudiant">
                                <tr>
                                    <td><xsl:value-of select="@numInscription"/></td>
                                    <td><xsl:value-of select="@nom"/></td>
                                    <td><xsl:value-of select="@prenom"/></td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                    <table class="table" style="margin-top: 10px">
                        <thead>
                            <tr>
                                <th scope="col" colspan="3" style="text-align: center"><h5>Modules</h5></th>
                            </tr>
                            <tr>
                                <th scope="col">ID Module</th>
                                <th scope="col">Nom Module</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="modules/module">
                                <tr>
                                    <td><xsl:value-of select="@idModule"/></td>
                                    <td><xsl:value-of select="@nomModule"/></td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>