node {
  checkout scm

  sh "ls"

  def myImage = docker.build("makerbot/clamavd")

  echo myImage.id

}
