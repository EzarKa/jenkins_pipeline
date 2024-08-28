pipeline {
    agent {
        docker {
            image 'node:14'
            label 'node'
            args '-v /root/.npm:/root/.npm' 
        }
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/EzarKa/jenkins_pipeline.git', branch: 'main'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
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
