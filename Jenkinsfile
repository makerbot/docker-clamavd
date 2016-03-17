node {
  checkout scm

  stage "build"
  docker.image("ubuntu:trusty").pull()
  def myImage = docker.build("makerbot/clamavd:${env.BRANCH_NAME}")

  stage "push"
  myImage.push()

}
