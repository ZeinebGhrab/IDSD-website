<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- XSLT est un outil pour travailler avec des données XML, et particulièrement utile pour transformer des documents XML en contenu HTML dynamique. -->

<xsl:template match="/">
<html lang="fr">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title><xsl:value-of select="etudiant/metadata/titre"/></title>
    <link rel="stylesheet" href="../../../css/style.css"/>
    <link rel="stylesheet" href="../../../css/table.css"/>
    <link rel="stylesheet" href="../../../css/etudiant.css"/>
</head>

<!-- Le fichier XSLT utilise du XPath pour interroger les fichiers XML. -->
<body>
    <!-- HEADER -->
    <header>
        <div>
            <ul>
                <li class="logo">
                    <img src="../../../images/cti.jpg" alt="cti"/>
                </li>
                <li class="logo">
                    <img src="../../../images/eur-ace.jpg" alt="eur-ace"/>
                </li>
                <li class="logo">
                    <img src="../../../images/enetcom-logo.png" alt="univ-sfax"/>
                </li>
            </ul>
            <h1>Ingénierie des Données et Systèmes Décisionnels</h1>
            <div>
                <span>Date de dernière mise à jour: mercredi 30 avril 2025</span>
                <span>Nombre de vues: 11127</span>
            </div>
        </div>
    </header>

    <!-- MAIN -->
    <main>
        <div class="student-container">
            <!-- Section Notes -->
            <div class="grades-table">
                <h2>Notes (<xsl:variable name="nbMatieres" select="count(etudiant/notes/matiere)"/>
                    <xsl:value-of select="$nbMatieres"/>)
                    <!--count() pour compter le nombre total de matières sous le nœud <notes>-->
                </h2>
                <table>
                    <thead>
                        <tr>
                            <th>Matière</th>
                            <th>Note</th>
                            <th>Coefficient</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="etudiant/notes/matiere">
                            <!-- Cela sélectionne chaque <matiere> sous <notes> sous <etudiant>. -->
                            <tr>
                                <td class="matiere"><xsl:value-of select="nom"/></td>
                                <td class="note"><xsl:value-of select="note"/></td>
                                <td class="coefficient"><xsl:value-of select="coefficient"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </div>

            <!-- Section Détails -->
            <div class="student-details">
                <img src="{etudiant/profil/photo}" alt="{etudiant/profil/nom}" class="student-photo"/>
                <h2><xsl:value-of select="etudiant/profil/nom"/></h2>

                <div class="detail-item">
                    <span class="detail-label">Promotion:</span>
                    <span><xsl:value-of select="etudiant/profil/promotion"/></span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Moyenne:</span>
                    <span><xsl:value-of select="etudiant/profil/moyenne"/></span>
                </div>

                <xsl:apply-templates select="etudiant/profil/*[not(self::photo or self::nom or self::promotion or self::moyenne)]"/>
                <!-- Ce filtre exclut certains éléments de la sélection : photo, promotion, moyenne -->
            </div>
        </div>

        <a href="{etudiant/navigation/lien-retour}" class="back-link">Retour</a>
    </main>

    <!--FOOTER-->
    <footer>
        <div class="footer-content">
            <div class="enetcom-logo">
                <img src="../../../images/enetcom-logo.png" alt="Logo Enet'com"/>
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
                    <a href="https://www.facebook.com/p/IDSD-Ing%C3%A9nierie-des-donn%C3%A9es-Syst%C3%A8mes-d%C3%A9cisionnels-100080490738069/">
                        <img src="../../../images/facebook.png" alt="Facebook"/>
                    </a>
                    <a href="https://www.linkedin.com/company/idsd2023/about/">
                        <img src="../../../images/linkedin.png" alt="LinkedIn"/>
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

<!-- Template pour générer dynamiquement les détails de profil -->
<xsl:template match="profil/*">
    <!-- Le template sera appliqué à tous les éléments enfants du nœud <profil> -->
    <div class="detail-item">
        <span class="detail-label">
            <xsl:value-of select="translate(local-name(), '-', ' ')"/>:
            <!-- Remplace les tirets (-) par des espaces dans le nom local d'un élément : <date-naissance> -->
        </span>
        <span><xsl:value-of select="."/></span>
        <!-- Affiche la valeur du nœud actuel dans le document XML -->
    </div>
</xsl:template>
</xsl:stylesheet>