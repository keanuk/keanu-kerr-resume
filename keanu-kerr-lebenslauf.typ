#let resume(
  name: "Keanu Kerr",
  addresses: (),
  body
) = {
  // Set document properties
  set document(title: name + " Lebenslauf")
  set page(
    paper: "us-letter",
    margin: (top: 0.3cm, bottom: 0.3cm, left: 1cm, right: 1cm),
  )
  set text(font: "Inter", size: 11pt)
  set par(justify: false, leading: 0.05em)

  // Name header
  align(center)[
    #text(size: 16pt, weight: "bold")[#upper(name)]
  ]

  v(-0.3em)

  // Address lines
  for address in addresses [
    #align(center)[
      #text(size: 10pt)[#address]
    ]
    #v(-0.05em)
  ]

  v(0.05em)

  body
}

#let section(title, body) = {
  v(0.5em)
  // Section title with inline divider
  grid(
    columns: (auto, 1fr),
    column-gutter: 0.5em,
    align: (left, horizon),
    text(weight: "bold")[#upper(title)],
    line(length: 100%, stroke: 0.5pt)
  )
  v(-0.5em)
  // Section content with left margin
  pad(left: 1.0em)[#body]
}

#let subsection(
  company: "",
  dates: "",
  position: "",
  location: "",
  items: ()
) = {
  v(0.25em)
  // Company name and dates
  grid(
    columns: (1fr, auto),
    text(weight: "bold")[#company],
    text()[#dates]
  )
  v(-0.25em)
  // Position and location (if provided)
  if position != "" or location != "" [
    #grid(
      columns: (1fr, auto),
      text(style: "italic")[#position],
      text(style: "italic")[#location]
    )
  ]
  v(-0.25em)
  // Bullet points
  for item in items [
    • #item
    #v(-0.75em)
  ]
  v(0.25em)
}

#let skills-table(skills) = {
  table(
    columns: (auto, 1fr),
    stroke: none,
    column-gutter: 6em,
    row-gutter: 0.02em,
    ..skills.pairs().map(((category, items)) => (
      text(weight: "bold")[#category],
      items
    )).flatten()
  )
}

#show: resume.with(
  name: "Keanu Kerr",
  addresses: (
    "keanukerr.com",
    "github.com/keanuk • linkedin.com/in/keanukerr",
    "+1 512-450-8961 • keanu@kerr.us"
  )
)

#section("Kenntnisse")[
  #skills-table((
    "Programmiersprachen": "Go, Java, Rust, Python, TypeScript, JavaScript, C++, C, Bash",
    "Frameworks & Bibliotheken": "Protobuf, Spring, JAX-RS, Node, Angular, Elasticsearch",
    "Technologien & Services": "Linux, Git, REST, gRPC, PostgreSQL, Docker, k8s, AWS, Azure"
  ))
]

#section("Berufserfahrung")[
  #subsection(
    company: "Bread Financial",
    dates: "März 2023 - Heute",
    position: "Software-Entwickler",
    location: "Philadelphia, Pennsylvania",
    items: (
      "Entwicklung und Wartung von REST- und gRPC-APIs in Go mit PostgreSQL-Datenbankintegration für Finanzdienstleistungen",
      "Implementierung von Funktionen für Kreditbearbeitung, Zahlungssysteme und Auskunftei-Berichterstattungsworkflows",
      "Containerisierung und Bereitstellung von Microservices mit Docker auf Kubernetes-Infrastruktur"
    )
  )

  #subsection(
    company: "General Motors",
    dates: "Februar 2020 - März 2023",
    position: "Software-Entwickler",
    location: "Austin, Texas",
    items: (
      "Entwicklung von REST-APIs mit Spring Framework und JAX-RS mit Oracle-Datenbankintegration",
      "Verbesserung der Such-API-Performance durch Elasticsearch-Cluster-Implementierung und -Optimierung",
      "Implementierung von TDD-Methodik und CI/CD-Pipelines mit Docker auf Azure Kubernetes Service"
    )
  )

  #subsection(
    company: "Elgato",
    dates: "Mai 2016 - August 2016",
    position: "Software-Entwickler Praktikant",
    location: "München, Deutschland",
    items: (
      "Entwicklung von JavaScript-Test-Overlays für Game Capture Software zur Verbesserung der QA-Test-Effizienz",
      "Aufbau eines internen Metriken-Dashboards mit Angular für Echtzeit-Anwendungsüberwachung",
      "Zusammenarbeit zwischen Entwicklungsteams mit Git-Workflows für interne Webanwendungsentwicklung"
    )
  )
]

#section("Projekte")[
  #subsection(
    company: "University of Edinburgh",
    dates: "April 2019 - August 2019",
    position: "Master-Dissertationsprojekt",
    location: "Edinburgh, Schottland",
    items: (
      "Entwicklung eines Multiplayer-RPGs in Java mit JavaFX-GUI und Peer-to-Peer-Netzwerkarchitektur",
      "Implementierung objektorientierter Designmuster zur Erstellung eines Lernframeworks für Informatikstudenten",
      "Verfassung umfassender Dokumentation einschließlich Setup-Anleitungen und Erweiterbarkeitsframework"
    )
  )

  #subsection(
    company: "University of Florida",
    dates: "Januar 2018 - Mai 2018",
    position: "Abschlussprojekt",
    location: "Gainesville, Florida",
    items: (
      "Entwicklung einer Angular-Webanwendung für benutzerdefinierte Spielcharakter-Erstellung mit dynamischer Formularvalidierung",
      "Aufbau eines Go-Backend-Services mit REST-API für Benutzerprofilverwaltung und Charakterdaten-Persistierung",
      "Bereitstellung der Full-Stack-Anwendung auf selbstverwalteter Linux-Server-Infrastruktur"
    )
  )
]

#section("Bildung")[
  #grid(
    columns: (1fr, auto),
    text(weight: "bold")[University of Edinburgh],
    text(style: "italic")[November 2019]
  )
  MSc in Informatik

  #v(0.02em)

  #grid(
    columns: (1fr, auto),
    text(weight: "bold")[University of Florida],
    text(style: "italic")[Mai 2018]
  )
  BSc in Informatik & Nebenfach Bildende Kunst
]
