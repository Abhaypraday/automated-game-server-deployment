pipeline {
  agent any
  stages {
    stage('Clone') {
      steps { git url: 'https://github.com/<YOUR_USERNAME>/automated-game-server-deployment.git', branch: 'main' }
    }
    stage('Build image') {
      steps { sh 'docker build -t css-server:latest .' }
    }
    stage('Deploy container') {
      steps {
        sh '''
          docker rm -f css_auto || true
          docker run -d --name css_auto -p 27015:27015/udp css-server:latest
        '''
      }
    }
    stage('Verify') {
      steps {
        sh 'docker ps --format "{{.Names}}\t{{.Status}}\t{{.Ports}}"'
      }
    }
  }
}
