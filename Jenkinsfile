pipeline {
    agent any

    tools {
        // Must match the name in Manage Jenkins -> Tools
        maven 'Maven 3'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Pulling code from Public GitHub...'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building Spring Boot JAR...'
                // This creates the .jar file in the target/ folder
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Push to Nexus') {
            steps {
                echo 'Shipping JAR to Nexus Repository...'
                // Use the ID you created in Jenkins Credentials
                withCredentials([usernamePassword(credentialsId: 'nexus-credentials', passwordVariable: 'NEXUS_PASSWORD', usernameVariable: 'NEXUS_USERNAME')]) {
                    sh """
                        curl -v -u $NEXUS_USERNAME:$NEXUS_PASSWORD \
                        --upload-file target/*.jar \
                        http://192.168.1.67:8081/repository/maven-releases/my-app-1.0.jar
                    """
                }
            }
        }
    }
}
