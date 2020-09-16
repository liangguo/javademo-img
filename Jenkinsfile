node {
    //agent any

    def app

    stage('Prepare') {

        git 'https://github.com/liangguo/javademo-img.git'

    }

    stage('Build') {
        sh "make build"
    }

    stage('Build image') {
        app= docker.build "liangguo/javademo-img"
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
