echo "=== Building DevOps Application ===" 
echo "Compiling source files..." 
find src -name "*.java" > sources.txt 
javac @sources.txt 
echo "Compilation complete." 
echo "=== Running Tests ===" 
java -cp src/main/java com.example.HelloDevOpsTest 
echo "Tests completed." 
echo "=== Creating JAR ===" 
jar cfe app.jar com.example.HelloDevOps -C src/main/java . 
echo "JAR created: app.jar" 
echo "=== Running Application ===" 
java -jar app.jar 
EOF 
chmod +x build.sh 
# Create Jenkinsfile 
cat > Jenkinsfile << 'EOF' 
pipeline {
    agent any 
    tools { 
        jdk 'jdk11'  // Make sure JDK is configured in Jenkins 
    }
    stages { 
        stage('Checkout') { 
            steps { 
                git branch: 'main', 
                    url: 'file:///PATH/TO/YOUR/pipeline-git-repo'  // Update path 
                echo 'Repository cloned successfully' 
            } 
        } 
        stage('Build') { 
            steps { 
                echo 'Building application...' 
                sh './build.sh' 
            } 
        } 
        stage('Test') { 
            steps { 
                echo 'Running tests...' 
                sh 'java -cp src/main/java com.example.HelloDevOpsTest' 
            } 
        } 
        stage('Archive') { 
            steps { 
                echo 'Archiving artifacts...' 
                archiveArtifacts artifacts: 'app.jar', fingerprint: true 
                archiveArtifacts artifacts: 'build.sh', fingerprint: true 
            } 
        } 
    }
    post {
        always { 
            echo 'Pipeline completed' 
            cleanWs()  // Clean workspace 
        } 
    }
} 
EOF 
