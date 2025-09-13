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
  v(0.1em)

  // Section title with inline divider
  grid(
    columns: (auto, 1fr),
    column-gutter: 0.5em,
    align: (left, horizon),
    text(weight: "bold")[#upper(title)],
    line(length: 100%, stroke: 0.5pt)
  )
  v(0.05em)

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
  // Company name and dates
  grid(
    columns: (1fr, auto),
    text(weight: "bold")[#company],
    text()[#dates]
  )

  // Position and location (if provided)
  if position != "" or location != "" [
    #grid(
      columns: (1fr, auto),
      text(style: "italic")[#position],
      text(style: "italic")[#location]
    )
  ]

  v(0.02em)

  // Bullet points
  for item in items [
    • #item
    #v(-0.02em)
  ]

  v(0.02em)
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
    "Programming Languages": "Go, Java, Python, TypeScript, JavaScript, Rust, C++, C, Bash",
    "Frameworks & APIs": "Spring, JAX-RS, Node, Angular, Elasticsearch, PyTorch",
    "Technologies & Services": "Linux, Git, REST, GraphQL, SQL, Docker, k8s, AWS, Azure"
  ))
]

#section("Experience")[
  #subsection(
    company: "Bread Financial",
    dates: "March 2023 - Present",
    position: "Software Engineer",
    location: "Philadelphia, Pennsylvania",
    items: (
      "Developed REST and RPC APIs using Go and integrated them with Postgres databases",
      "Led small team to create new API and migrated functionality from older project",
      "Deployed APIs as Docker images on Kubernetes platform"
    )
  )

  #subsection(
    company: "General Motors",
    dates: "February 2020 - March 2023",
    position: "Software Engineer",
    location: "Austin, Texas",
    items: (
      "Created REST APIs using Spring Framework and JAX-RS integrating with Oracle SQL databases",
      "Increased performance of search APIs by deploying and integrating Elasticsearch cluster",
      "Employed TDD and CI/CD practices using Docker and Kubernetes clusters hosted on Azure"
    )
  )

  #subsection(
    company: "Elgato",
    dates: "May 2016 - August 2016",
    position: "Software Engineer Intern",
    location: "Munich, Germany",
    items: (
      "Created test overlays for Game Capture software written in JavaScript",
      "Worked on internal metrics monitoring page written in Angular",
      "Used Git to collaborate with other teams of developers on internal web applications"
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
      "Created multiplayer role-playing game in Java with JavaFX and peer-to-peer networking",
      "Designed using OO design patterns with intent of being used as a learning tool for students",
      "Created documentation for setup and possible ways to extend functionality"
    )
  )

  #subsection(
    company: "University of Florida",
    dates: "January 2018 - May 2018",
    position: "Senior Project",
    location: "Gainesville, Florida",
    items: (
      "Built front end Angular web application allowing users to create custom game characters",
      "Integrated with back-end service written in Go to store user profiles and character data",
      "Self-hosted website and related components on home server"
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
  BSc in Computer Science \
  Minor in Studio Art
]
