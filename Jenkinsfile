pipeline {
    agent any

    tools {
        jdk 'jdk11'   // Must be configured in Jenkins Global Tools
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'file:///C:/Users/YOUR_USERNAME/pipeline-git-repo'
                echo 'Repository cloned successfully'
            }
        }

        stage('Build & Test') {
            steps {
                echo 'Building and testing application...'
                sh './build.sh'
            }
        }
      stage('Archive') {
            steps {
                echo 'Archiving artifacts...'
                archiveArtifacts artifacts: 'app.jar', fingerprint: true
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed'
            cleanWs()
        }
    }
}
