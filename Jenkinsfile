pipeline {
    agent any

    parameters {
      string(name: 'REGISTRY', defaultValue: '10.0.0.26', description: 'Registry url to push images to')
    }

    environment {
      REGISTRY = "${params.REGISTRY}"
      VERSION = "${env.BRANCH_NAME}"
      SERVICE_NAME = "${scm.getUserRemoteConfigs()[0].getUrl().tokenize('/').last().split("\\.")[0]}"
    }

    stages {
        stage('Debug') {
            steps {
                sh 'printenv'
            }
        }
        stage('Build') {
            steps {
                echo "Building..."
                sh 'make build-image'
            }
        }
        stage('Push Docker Image') {
            steps {
                echo "Pushing..."
                sh 'make push-image'
            }
        }
        stage('Update helm chart git repo') {
            when {
              tag "v*.*.*"
            }
            steps {
                echo "Tag: $VERSION"
            }
        }
    }
}
