pipeline {
    agent any

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
        stage('Build Docker image') {
            steps {
                def newApp = docker.build "liangguo/javademo-img:${env.BUILD_TAG}"
                newApp.push()
            }
        }
    }
}
