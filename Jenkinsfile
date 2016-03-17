node {
  checkout scm

  stage "build"
  def myImage = docker.build("makerbot/clamavd:${env.BRANCH_NAME}")

  stage "push"
  myImage.push()

}
