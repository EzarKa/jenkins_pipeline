pipeline {
    agent {
        docker {
            image 'node:14'
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
                sh '''
                    sudo docker pull node:14
                    sudo docker run --rm -v $PWD:/app -w /app node:14 npm install
                '''
            }
        }
        
        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Test') {
            steps {
                sh 'npm test'
            }
        }

        stage('Start Application') {
            steps {
                sh 'npm start'
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
