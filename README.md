# Verivox StudyCase Setup Script - Yusuf Akarsu

## Overview

The `Verivox_TestCase.ps1` PowerShell script automates the creation and setup of a .NET solution and test projects for VerivoxStudyCase. 
This script:

- Sets up a new .NET xUnit test project.
- Adds necessary NuGet packages.
- Creates folders and classes for entities and test data.
- Defines test cases for city and street information.
- Restores, builds, and runs tests.
- Generates an HTML test report.

The script simplifies the project setup process, making it easy to get started with the Verivox test cases.

## How to Use

1. **Locate the Script:**

   The `Verivox_TestCase.ps1` script can be found in the `CreateScript` folder.

2. **Check .NET SDK:**

   Ensure that the .NET 8.0 SDK is installed on your system. If not, install it from [Microsoft's .NET download page](https://dotnet.microsoft.com/download/dotnet/8.0).

3. **Run the Script:**

   Open a PowerShell terminal and navigate to the `CreateScript` folder where the `Verivox_TestCase.ps1` script is located. Execute the script with the following command:

   ```powershell
   .\Verivox_TestCase.ps1

4. **What the Script Does:**

- Directory Setup: Creates necessary directories and navigates to the project directory.
- Project Creation: Initializes an xUnit test project and removes the default test file.
- Package Installation: Adds required NuGet packages for testing and assertions.
- Folder and Class Creation: Sets up Entities and Data folders, and creates C# classes for cities and streets responses.
- Test Class Creation: Generates C# classes for testing city and street endpoints.
- Build and Test: Restores dependencies, builds the project, runs tests, and generates an HTML test report.

5. **Check results:**

After running the script, an HTML test report will be generated in the TestResults directory. 


6. **File Structure:**

After running the script, the project structure will include:

Entities Folder:

`CitiesResponse.cs`
`StreetsResponse.cs`

Data Folder:
`TestData.cs`

Root Directory:

`AddressCheckCitiesTests.cs`
`AddressCheckStreetTests.cs`

TestResults Folder:

`test_results.html`

7. **Libraries Used :**
The script includes several important libraries for unit testing and data handling:

Microsoft.NET.Test.Sdk: Provides the .NET SDK for running tests.
xunit: A popular testing framework for .NET applications.
xunit.runner.visualstudio: Enables running xUnit tests from within Visual Studio.
Newtonsoft.Json: A widely-used library for handling JSON serialization and deserialization.
FluentAssertions: A library that provides a more readable and expressive way to assert conditions in tests.

Conclusion
**Conclusion :**
By running the Verivox_TestCase.ps1 script, you can quickly set up a test project, including all necessary files, configurations, and test cases. This automated setup ensures consistency and saves time in the development process.
