# IDSD Website

The IDSD showcase website highlights the program, student profiles, and career opportunities in the Data Engineering and Decision Systems field at ENET'Com, offering an interactive and informative experience.

---

# 📚 Project Overview

This web project was developed as part of the **"Web and XML"** course in the first year of the IDSD engineering program at ENET'Com.

It features:
- A dynamic homepage with program description and statistics
- Navigation to student promotions by academic year
- Student cards displaying photos and averages
- Individual student pages with personal info and detailed grades table
- Integration of two XML queries XPath/XQuery

---

# 🛠️ Technologies Used

- HTML5 / CSS3
- XML / XSLT
- XPath / XQuery

---

# 🚀 How to Run

1. 🌐 Launch the Website (XML + XSLT)
   
```bash
   cd IDSD-website
   python -m http.server 8000
```
📁 This will start a local server to view the website generated from XML and XSLT.<br/>
🔗 Open your browser and go to http://localhost:8000/ to explore the site.

2. 📄 Generate HTML from XQuery using BaseX
   
- Install BaseX (a native XML database and XQuery engine).
- Run the following command:
 
```bash
   basex cd/promotion/etudiants/promotion1/etudiant.xq > result.html
```
📁 Replace promotion1 with promotion2 or promotion3 depending on the target academic year.<br/>
🧾 This generates an HTML file from an XQuery script based on the selected promotion's data.


