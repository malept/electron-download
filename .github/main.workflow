workflow "Build & deploy docs" {
  on = "push"
  resolves = ["Publish Documentation"]
}

action "Install Dependencies" {
  uses = "actions/npm@master"
  runs = "yarn"
  args = "install"
}

action "Build Documentation" {
  uses = "actions/npm@master"
  needs = ["Install Dependencies"]
  runs = "yarn"
  args = "build:docs"
}

action "Publish Documentation" {
  uses = "malept/github-action-gh-pages@master"
  needs = ["Build Documentation"]
  secrets = ["GITHUB_TOKEN"]
}
