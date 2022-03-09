node {
  stage('SCM') {
    //deleteDir()
    checkout scm
  }
  stage('Restore Packages') {
    bat "dotnet restore ReportsWebFormsSamples.csproj"
  }
  stage('SonarQube Analysis') {

    withSonarQubeEnv() {
      bat "C:\\Tools\\sonar-scanner-msbuild-5.5.3.43281-net46\\SonarScanner.MSBuild.exe begin /k:\"DepTrackSonarQubeDEMO\""
      //bat "\"${msbuildHome}\\MSBuild.exe\" /restore"
      bat "\"C:\\Program Files (x86)\\MSBuild\\12.0\\Bin\\MSBuild.exe\" /t:Rebuild"
      bat "C:\\Tools\\sonar-scanner-msbuild-5.5.3.43281-net46\\SonarScanner.MSBuild.exe end"
    }
  }
  stage ('Generating Software Bill of Materials') {
    //bat "dotnet tool install --global CycloneDX"
    bat "dotnet CycloneDX ReportsWebFormsSamples.sln -o ."
  }
  stage('dependencyTrackPublisher') {
    dependencyTrackPublisher artifact: 'bom.xml', projectId: '123530a3-16ef-4629-ac6d-dcac3ba6514c', synchronous: true
  }
}
