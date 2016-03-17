node {
  checkout scm

  stage "build"
  def myImage = docker.build("makerbot/clamavd:${env.BRANCH_NAME}")

  echo myImage.id

}
