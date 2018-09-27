node ('master') {
    printMessage("Pipeline Start")

    stage("Fetch Source Code") {
        git url: 'https://github.com/cpruvost/lesson5.git'
    }

    //dir('Lesson5') {
        printMessage("Pipeline Running") 
        
        stage("Pre-Check") {
            sh 'ls'
        }
        
        stage("Testing") {
            sh 'python test_functions.py'
        }
        
        stage("Deployment") {
            
            if (env.BRANCH_NAME == 'master') {
                printMessage("Master Branch")
            }
            else {
                printMessage("No Deployment for this Branch")
                echo env.BRANCH_NAME
            }
            
        }

        printMessage("Pipeline End")
    //}
}

def printMessage(message) {
    echo "${message}"
}
