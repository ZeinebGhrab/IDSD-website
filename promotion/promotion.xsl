<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8" indent="yes" doctype-system="about:legacy-compat"/>

    <xsl:template match="/">
        <html lang="fr">
        <head>
            <meta charset="UTF-8"/>
            <title><xsl:value-of select="promotion/titre"/></title>
            <link rel="stylesheet" href="../css/style.css"/>
            <link rel="stylesheet" href="../css/table.css"/>
            <link rel="stylesheet" href="../css/promotion.css"/>
        </head>
        <body>
            <header>
                <ul class="logos">
                    <li class="logo">
                        <img src="../images/cti.jpg" alt="Logo CTI"/>
                    </li>
                    <li class="logo">
                        <img src="../images/eur-ace.jpg" alt="Logo EUR-ACE"/>
                    </li>
                    <li class="logo">
                        <img src="../images/enetcom-logo.png" alt="Logo ENET'COM"/>
                    </li>
                </ul>
                <h1>Ingénierie des Données et Systèmes Décisionnels</h1>
                <div class="header-info">
                    <span>Date de dernière mise à jour: mercredi 30 avril 2025</span>
                    <span>Nombre de vues: 11127</span>
                </div>
            </header>

            <main>
                <h2><xsl:value-of select="promotion/titre"/></h2>
                <div class="student-table-container">
                    <table class="student-table">
                        <xsl:for-each select="promotion/etudiants/etudiant">
                            <xsl:if test="position() mod 3 = 1">
                                <tr>
                                    <xsl:apply-templates select="." mode="student-cell"/>
                                    <xsl:apply-templates select="following-sibling::etudiant[position() &lt; 3]" mode="student-cell"/>
                                </tr>
                            </xsl:if>
                        </xsl:for-each>
                    </table>
                </div>
                <a href="{promotion/retour}" class="back-link">Retour</a>
            </main>

            <footer>
                <div class="footer-content">
                    <div class="enetcom-logo">
                        <img src="../images/enetcom-logo.png" alt="Logo ENET'COM"/>
                        <div>
                            <h4>ENET'COM</h4>
                            <p>École Nationale d'Électronique et des Télécommunications</p>
                        </div>
                    </div>
                    <div class="footer-section">
                        <h4>Contact</h4>
                        <p><a href="mailto:contact@idsd.enetcom.tn">contact@idsd.enetcom.tn</a></p>
                        <p><a href="tel:+21674863037">+216 74 863 037</a></p>
                    </div>
                    <div class="footer-section">
                        <h4>Réseaux Sociaux</h4>
                        <div class="social-icons">
                            <a href="https://www.facebook.com/p/IDSD-Ing%C3%A9nierie-des-donn%C3%A9es-Syst%C3%A8mes-d%C3%A9cisionnels-100080490738069/" title="Facebook IDSD">
                                <img src="../images/facebook.png" alt="Icône Facebook"/>
                            </a>
                            <a href="https://www.linkedin.com/company/idsd2023/about/" title="LinkedIn IDSD">
                                <img src="../images/linkedin.png" alt="Icône LinkedIn"/>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="footer-bottom">
                    <p>© 2025 IDSD - Tous droits réservés</p>
                </div>
            </footer>
        </body>
        </html>
    </xsl:template>

    <xsl:template match="etudiant" mode="student-cell">
        <td class="student-cell">
            <a href="{lien}" class="student-card">
                <img src="{photo}" class="student-photo" alt="Photo de {nom}"/>
                <div class="student-info">
                    <div class="student-name">
                        <xsl:value-of select="nom"/>
                    </div>
                    <div class="student-avg">
                        Moyenne: <xsl:value-of select="moyenne"/>
                    </div>
                </div>
            </a>
        </td>
    </xsl:template>
</xsl:stylesheet>