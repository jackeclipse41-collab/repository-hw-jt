pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Pulling code from Private Repo...'
                checkout scm
            }
        }
        stage('Build') {
            steps {
                echo 'Simulating Java Build...'
                sh 'mkdir -p target'
                sh 'echo "Fake build content" > target/my-app-1.0.jar'
            }
        }
        stage('Archive Artifacts') {
            steps {
                echo 'Saving the .jar file for the grade...'
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
    }
}
