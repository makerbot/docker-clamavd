node {
  checkout scm

  echo env.BRANCH_NAME

  sh "ls"

  def myImage = docker.build("makerbot/clamavd")

  echo myImage.id

}
