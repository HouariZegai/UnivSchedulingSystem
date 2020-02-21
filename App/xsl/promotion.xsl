<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/promotion">
        <div>
            <h3 style="margin-top: 10px" align="center">Etudiants</h3>
            <table class="table">
                <thead class="thead-dark">
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

            <h3 style="margin-top: 10px" align="center">Modules</h3>
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nom</th>
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
    </xsl:template>
</xsl:stylesheet>