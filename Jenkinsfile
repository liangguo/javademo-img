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
            //app.push("latest")
        }
    }

    stage('Deploy to test k8s') {
        sh "sed -e 's/BUILD/${env.BUILD_NUMBER}/' |javademo-img-deployment.yml|kubectl apply -f -"
    }

    stage('Simulate user test') {
        sh '
            response=$(curl -s -o /dev/null -w "%{http_code}\n" http://192.168.2.71/img/cat.png)
            if [ "$response" != "200" ];
            then
                exit 1
            fi
        '
    }

    // If test fail, latest tag should not be pushed to dockerhub. 
    stage('Push latest tag') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("latest")
        }
    }

}
