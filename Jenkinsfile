

node {
  checkout scm
  
  echo scm

  def myContainer = docker.build("makerbot/clamavd:${GIT_BRANCH}")

  echo myContainer
}
