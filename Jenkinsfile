node {
  stage('SCM') {
    deleteDir()
    checkout scm
  }
  stage('Restore Packages') {
    bat "dotnet restore ReportsWebFormsSamples.sln"
  }
  stage('SonarQube Analysis') {
    def msbuildHome = tool 'Default MSBuild'
    def scannerHome = tool 'SonarScanner for MSBuild'
    withSonarQubeEnv() {
      bat "\"${scannerHome}\\SonarScanner.MSBuild.exe\" begin /k:\"Demo\""
      //bat "\"${msbuildHome}\\MSBuild.exe\" /restore"
      //bat "\"${msbuildHome}\\MSBuild.exe\" /restore"
      bat "\"${msbuildHome}\\MSBuild.exe\" /t:Rebuild"
      bat "\"${scannerHome}\\SonarScanner.MSBuild.exe\" end"
    }
  }
  stage ('Generating Software Bill of Materials') {
    //bat "dotnet tool install --global CycloneDX"
    bat "dotnet CycloneDX ReportsWebFormsSamples.sln -o ."
  }
  stage('dependencyTrackPublisher') {
    dependencyTrackPublisher artifact: 'bom.xml', projectId: 'b30ce81d-23a1-4557-847d-0bf0069c59a2', synchronous: true
  }
}
