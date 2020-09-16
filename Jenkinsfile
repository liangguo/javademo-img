node {
    agent any

    def app
    //tools {
        // Install the Maven version configured as "M3" and add it to the path.
    //    maven "M3"
    //}

    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/liangguo/javademo-img.git'

                // build tar package.
                sh "make build"
            }

            //post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
            //    success {
            //        junit '**/target/surefire-reports/TEST-*.xml'
            //        archiveArtifacts 'target/*.jar'
            //    }
            //}
        }
        stage('Build image') {
            steps {
                app= docker.build "liangguo/javademo-img"
            }

        stage('Push image') {
            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                app.push("${env.BUILD_NUMBER}")
                app.push("latest")
            }
        }
    }
}
