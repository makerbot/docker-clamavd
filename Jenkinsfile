

node {
  properties [
    [
      $class: 'GithubProjectProperty',
      displayName: '',
      projectUrlStr: 'https://github.com/makerbot/docker-clamavd/'
    ]
  ]
  checkout scm
  sh "docker-build-publish.sh makerbot/clamavd \${BRANCH_NAME} build"
}
