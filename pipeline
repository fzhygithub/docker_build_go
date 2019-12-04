node('jnlp-maven') {
    stage('Clone') {
      echo "1.Clone Stage"
      git url: "https://github.com/fzhygithub/docker_build_go.git"
       script {
        build_tag = sh(returnStdout: true, script: 'git rev-parse --short HEAD').trim()
    }
    }
    stage('Test') {
      echo "2.Test Stage"
    }
    stage('Build') {
      echo "3.Build Stage"
      sh "docker build -t fzhydocker/go:${build_tag} ."
    }
    stage('Push') {
      echo "4.Push Docker Image Stage"
      withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubPassword', usernameVariable: 'dockerhubUser')]) {
        sh "docker login -u ${dockerhubUser} -p ${dockerhubPassword}"
        sh "docker push fzhydocker/go:${build_tag}"
        sh "sed -i 's/<BUILD_TAG>/${build_tag}/' k8s.yaml"
      }
    }
    
    stage('Deploy') {
      echo "5. Deploy Stage"
//        id: 'userInput',
//        message: 'Choose a deploy environment',
//        parameters: [
//            [
//                $class: 'ChoiceParameterDefinition',
//                choices: "Dev\nQA\nProd",
//                name: 'Env'
//                ]
//            ]
//        )
//        echo "This is a deploy step to ${userInput}"
        sh "sed -i 's/<BUILD_TAG>/${build_tag}/' k8s.yaml"
//        if (userInput == "Dev") {
//            // deploy dev stuff
//        } else if (userInput == "QA"){
//            // deploy qa stuff
//        } else {
//            // deploy prod stuff
//        }
      sh "kubectl apply -f k8s.yaml"
    }
}
