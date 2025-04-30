xquery version "3.1";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "html";
declare option output:media-type "text/html";
declare option output:indent "yes";

declare function local:calculate-average($doc as document-node()) {
  let $weighted-sum := sum(
    for $subject in $doc/etudiant/notes/matiere
    return ($subject/note) * ($subject/coefficient)
  )
  let $total-coefficients := sum(
    for $subject in $doc/etudiant/notes/matiere
    return ($subject/coefficient)
  )
  return $weighted-sum div $total-coefficients
};

let $fichiers := (
  "etudiant1.xml",
  "etudiant2.xml",
  "etudiant3.xml",
  "etudiant4.xml",
  "etudiant5.xml",
  "etudiant6.xml"
)

let $etudiants :=
  for $file in $fichiers
  let $doc := doc($file)
  let $nom := string($doc/etudiant/profil/nom)
  let $moyenne := local:calculate-average($doc)
  return <etudiant>
           <nom>{ $nom }</nom>
           <moyenne>{ $moyenne }</moyenne>
         </etudiant>

let $best-node := (
  for $e in $etudiants
  order by xs:double($e/moyenne) descending
  return $e
)[1]

let $worst-node := (
  for $e in $etudiants
  order by xs:double($e/moyenne) ascending
  return $e
)[1]

let $best := xs:double($best-node/moyenne)
let $worst := xs:double($worst-node/moyenne)
let $average := avg(for $e in $etudiants return xs:double($e/moyenne))

return
<html lang="fr">
  <head>
    <meta charset="UTF-8"/>
    <title>Statistiques des Étudiants 1 IDSD</title>
    <link rel="stylesheet" href="../../../css/table.css"/>
    <link rel="stylesheet" href="../../../css/style.css"/>
    <link rel="stylesheet" href="../../../css/promotion.css"/>
  </head>
  <body>
    <header>
        <div>
            <ul>
                <li class="logo"><img src="../../../images/cti.jpg" alt="cti"/></li>
                <li class="logo"><img src="../../../images/eur-ace.jpg" alt="eur-ace"/></li>
                <li class="logo"><img src="../../../images/enetcom-logo.png" alt="univ-sfax"/></li>
            </ul>
            <h1>Ingénierie des Données et Systèmes Décisionnels</h1>
            <div>
                <span>Date de dernière mise à jour: mercredi 30 avril 2025</span>
                <span>Nombre de vues: 11127</span>
            </div>
        </div>
    </header>
    <main>
        <h2>Statistiques des Étudiants 1 IDSD</h2>
        <div class="student-table-container">
            <table class="student-table">
                <thead>
                  <tr>
                    <th>Meilleure moyenne</th>
                    <th>Pire moyenne</th>
                    <th>Moyenne générale</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>{ format-number($best, "0.00") }</td>
                    <td>{ format-number($worst, "0.00") }</td>
                    <td>{ format-number($average, "0.00") }</td>
                  </tr>
                </tbody>
              </table>   
        </div>
        <div>
            <p><strong>Étudiant avec la meilleure moyenne : </strong> { $best-node/nom }</p>
            <p><strong>Étudiant avec la pire moyenne : </strong> { $worst-node/nom }</p>
        </div>
        <a href="../../../index.html" class="back-link">Retour à l'accueil</a>
    </main>
    <footer>
        <div class="footer-content">
            <div class="enetcom-logo">
                <img src="../../../images/enetcom-logo.png" alt="Logo ENET'COM"/>
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
                    <a href="https://www.facebook.com/p/IDSD-Ing%C3%A9nierie-des-donn%C3%A9es-Syst%C3%A8mes-d%C3%A9cisionnels-100080490738069/"><img src="../../../images/facebook.png" alt="Facebook"/></a>
                    <a href="https://www.linkedin.com/company/idsd2023/about/"><img src="../../../images/linkedin.png" alt="LinkedIn"/></a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>© 2025 IDSD - Tous droits réservés</p>
        </div>
    </footer>
  </body>
</html>
