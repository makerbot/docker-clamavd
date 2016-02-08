

node {
  checkout scm
  
  sh "ls"

  def myContainer = docker.build "makerbot/clamavd:${GIT_BRANCH}"

  echo myContainer.imageName()
}
