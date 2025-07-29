pipeline {
  agent any

  stages {
    stage('saltcommand') {
      steps {
        salt(
          authtype: 'pam',
          clientInterface: local(
            arguments: '"sleep 3; ls -la"',
            blockbuild: true,
            function: 'cmd.run',
            jobPollTime: 6,
            target: '*',
            targettype: 'glob'
          ),
          credentialsId: 'b5f40401-01b9-4b27-a4e8-8ae94bc90250',
          saveFile: true,
          servername: 'http://master.local:8000'
        )

        script {
          env.WORKSPACE = pwd()
          def output = readFile "${env.WORKSPACE}/saltOutput.json"
          echo output
        }
      }
    }
  }
}
