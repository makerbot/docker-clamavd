node {
  checkout scm

  echo env.GIT_BRANCH

  sh "ls"

  def myImage = docker.build("makerbot/clamavd")

  echo myImage.id

}
