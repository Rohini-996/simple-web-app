pipeline {
    
    agent any

    stages {

        stage("Code") {
            steps {
                git url: "https://github.com/Rohini-996/simple-web-app.git", branch: "main"
            }
        }

        stage("Build") {
            steps {
                sh "docker build -t myapp:latest ."
            }
        }

        stage("Run") {
            steps {
                sh "docker run -d -p 84:80 myapp:latest"
            }
        }

        stage("Deploy") {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "DockerCreds",
                    usernameVariable: "DOCKER_USER",
                    passwordVariable: "dockerPass"
                )]) {
                    sh "docker login -u $DOCKER_USER -p $dockerPass"
                    sh "docker tag myapp:latest $DOCKER_USER/myapp:latest"
                    sh "docker push $DOCKER_USER/myapp:latest"
                }
            }
        }
    }
}
