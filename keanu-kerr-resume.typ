#let resume(
  name: "Keanu Kerr",
  addresses: (),
  body
) = {
  // Set document properties
  set document(title: name + " Resume")
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

#section("Skills")[
  #skills-table((
    "Programming Languages": "Go, Java, Rust, Python, TypeScript, JavaScript, C++, C, Bash",
    "Frameworks & Libraries": "Protobuf, Spring, JAX-RS, Node, Angular, Elasticsearch",
    "Technologies & Services": "Linux, Git, REST, gRPC, PostreSQL, Docker, k8s, AWS, Azure"
  ))
]

#section("Experience")[
  #subsection(
    company: "Bread Financial",
    dates: "March 2023 - Present",
    position: "Software Engineer",
    location: "Philadelphia, Pennsylvania",
    items: (
      "Developed REST and gRPC APIs in Go, integrating with PostgreSQL databases for financial services",
      "Implemented features for loan processing, payment systems, and credit bureau reporting workflows",
      "Containerized and deployed microservices using Docker on Kubernetes infrastructure"
    )
  )

  #subsection(
    company: "General Motors",
    dates: "February 2020 - March 2023",
    position: "Software Engineer",
    location: "Austin, Texas",
    items: (
      "Developed REST APIs using Spring Framework and JAX-RS with Oracle database integration",
      "Improved search API performance with Elasticsearch cluster implementation and optimization",
      "Implemented TDD methodology and CI/CD pipelines using Docker on Azure Kubernetes Service"
    )
  )

  #subsection(
    company: "Elgato",
    dates: "May 2016 - August 2016",
    position: "Software Engineer Intern",
    location: "Munich, Germany",
    items: (
      "Developed JavaScript test overlays for Game Capture software to improve QA testing efficiency",
      "Built internal metrics dashboard using Angular for real-time application monitoring",
      "Collaborated across development teams using Git workflows for internal web application development"
    )
  )
]

#section("Projects")[
  #subsection(
    company: "University of Edinburgh",
    dates: "April 2019 - August 2019",
    position: "Master's Dissertation Project",
    location: "Edinburgh, Scotland",
    items: (
      "Developed multiplayer RPG in Java using JavaFX GUI and peer-to-peer networking architecture",
      "Implemented OO design patterns to create an educational framework for computer science students",
      "Authored comprehensive documentation including setup guides and extensibility framework"
    )
  )

  #subsection(
    company: "University of Florida",
    dates: "January 2018 - May 2018",
    position: "Senior Project",
    location: "Gainesville, Florida",
    items: (
      "Developed Angular web application for custom game character creation with dynamic form validation",
      "Built Go backend service with REST API for user profile management and character data persistence",
      "Deployed full-stack application on self-managed Linux server infrastructure"
    )
  )
]

#section("Education")[
  #grid(
    columns: (1fr, auto),
    text(weight: "bold")[University of Edinburgh],
    text(style: "italic")[November 2019]
  )
  MSc in Informatics

  #v(0.02em)

  #grid(
    columns: (1fr, auto),
    text(weight: "bold")[University of Florida],
    text(style: "italic")[May 2018]
  )
  BSc in Computer Science & Minor in Studio Art
]
