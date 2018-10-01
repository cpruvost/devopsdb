node ('master') {
    printMessage("Pipeline Start")

    stage("Fetch Source Code") {
        git url: 'https://github.com/cpruvost/lesson5.git'
    }

    
	printMessage("Pipeline Running") 
	
	stage("Pre-Check-Terraform") {
		sh 'ls'
	}

	printMessage("Pipeline End")
   
}

def printMessage(message) {
    echo "${message}"
}
