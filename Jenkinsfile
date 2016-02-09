node {
  checkout scm

  sh "env"

  sh "ls"

  def myImage = docker.build("makerbot/clamavd")

  echo myImage.id

}
