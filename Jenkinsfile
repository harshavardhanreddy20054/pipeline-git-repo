pipeline {
    agent any

    tools {
        jdk 'jdk11'
    }

    stages {

        stage('Build & Test') {
            steps {
                echo 'Building and testing application...'
                bat 'build.bat'
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'app.jar', fingerprint: true
            }
        }
    }

    post {
        always {
            cleanWs()
            echo 'Pipeline completed'
        }
    }
}
