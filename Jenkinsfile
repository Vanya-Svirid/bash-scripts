pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "count_files:latest"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).inside {
                        sh 'ls /'
                    }
                }
            }
        }

        stage('Install RPM or DEB Package') {
            steps {
                script {
                    if (fileExists('count_files-1.0-1.x86_64.rpm')) {
                        sh 'sudo rpm -i count_files-1.0-1.x86_64.rpm'
                    } else if (fileExists('count_files-1.0.deb')) {
                        sh 'sudo dpkg -i count_files-1.0.deb'
                    } else {
                        error "No package file found!"
                    }
                }
            }
        }

        stage('Execute Script') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).inside {
                        sh '/usr/bin/count_files'
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
