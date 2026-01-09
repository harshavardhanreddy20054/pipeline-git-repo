pipeline {
    agent any

    tools {
        jdk 'jdk11'
    }

    stages {

        stage('Build & Test') {
            steps {
                echo 'Building and testing application...'
                sh './build.sh'
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
