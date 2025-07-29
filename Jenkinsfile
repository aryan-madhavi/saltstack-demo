pipeline {
  stages {
    stage('saltcommand') {
      steps {
        salt(authtype: 'pam', clientInterface: local(arguments: '"sleep 3; ls -la"', blockbuild: true, function: 'cmd.run', jobPollTime: 6, target: '*', targettype: 'glob'), credentialsId: 'saltuser-creds', saveFile: true, servername: 'http://172.31.6.109:8000')
        script {
          env.WORKSPACE = pwd()
          def output = readFile "${env.WORKSPACE}/saltOutput.json"
          echo output
        }

      }
    }
  }
}
