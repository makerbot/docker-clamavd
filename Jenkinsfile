node {
  checkout scm

  echo GIT_BRANCH

  sh "ls"

  def myImage = docker.build("makerbot/clamavd")

  echo myImage.id

}
