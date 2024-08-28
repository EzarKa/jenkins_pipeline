pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/EzarKa/jenkins_pipeline.git', branch: 'main'
            }
        }

    post {
        success {
            echo 'Pipeline terminé avec succès.'
        }
        failure {
            echo 'Pipeline échoué.'
        }
    }
}
