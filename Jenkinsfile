pipeline {
    agent any
    tools {
        maven 'Maven3'
    }
    stages {
        stage('Build') { 
            steps {
                withMaven(maven: 'Maven3'){
                    sh 'mvn -B -DskipTests clean package' 
                }
            }
        }
    }
}