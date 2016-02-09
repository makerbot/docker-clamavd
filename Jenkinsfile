node {
  checkout scm

  echo env

  sh "ls"

  def myImage = docker.build("makerbot/clamavd")

  echo myImage.id

}
