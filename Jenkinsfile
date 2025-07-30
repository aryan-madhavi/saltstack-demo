pipeline {
  agent any

  stages {
    stage('Apply Salt State from GitFS') {
      steps {
        salt(
          authtype: 'pam',
          clientInterface: local(
            function: 'state.apply',
            arguments: 'files_mgmt',  // Name of the state in GitFS (without .sls extension)
            blockbuild: true,
            jobPollTime: 6,
            target: '*',               // Apply the state to all minions
            targettype: 'glob'
          ),
          credentialsId: 'saltuser-creds',  // The credentials to authenticate with Salt API
          saveFile: true,                  // Save output to a file
          servername: 'http://172.31.6.109:8080'  // Your Salt API URL
        )

        script {
          // Optional: Read the output from the saved file if needed
          env.WORKSPACE = pwd()
          def output = readFile "${env.WORKSPACE}/saltOutput.json"
          echo output  // Print output for debugging
        }
      }
    }
  }

  post {
    always {
      cleanWs()  // Clean up workspace after the job is done
    }
  }
}
