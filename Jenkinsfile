

node {
  checkout scm
  
  def myContainer = docker.build("makerbot/clamavd:${GIT_BRANCH}")
}
