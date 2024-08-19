# Get the directory where this script is located
$scriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

# Define project details
$projectName = "AddressCheckTests"
$projectDir = Join-Path -Path $scriptDir -ChildPath $projectName

# Check if .NET 8.0 SDK is installed
$dotnetVersion = dotnet --version
if ($dotnetVersion -notmatch "^8\..*") {
    Write-Error ".NET 8.0 SDK is required. Please install it from https://dotnet.microsoft.com/download/dotnet/8.0"
    exit 1
}

# Create and navigate to project directory
if (-Not (Test-Path $projectDir)) {
    New-Item -ItemType Directory -Force -Path $projectDir | Out-Null
}

Set-Location $projectDir

# Create a new xUnit project
dotnet new xunit

# Delete the default UnitTest1.cs file
$defaultTestFile = Join-Path -Path $projectDir -ChildPath "UnitTest1.cs"
if (Test-Path $defaultTestFile) {
    Remove-Item -Path $defaultTestFile
}

# Add necessary NuGet packages
$packages = @(
    "Microsoft.NET.Test.Sdk",
    "xunit",
    "xunit.runner.visualstudio",
    "Newtonsoft.Json",
    "FluentAssertions"
)

foreach ($package in $packages) {
    dotnet add package $package
}

# Create Entities and Data folders
$entitiesDir = Join-Path -Path $projectDir -ChildPath "Entities"
$dataDir = Join-Path -Path $projectDir -ChildPath "Data"
if (-Not (Test-Path $entitiesDir)) { New-Item -ItemType Directory -Force -Path $entitiesDir | Out-Null }
if (-Not (Test-Path $dataDir)) { New-Item -ItemType Directory -Force -Path $dataDir | Out-Null }

# Create the CitiesResponse class in the Entities folder
$citiesResponseClass = @'
namespace AddressCheckTests.Entities
{
    using System.Collections.Generic;

    public class CitiesResponse
    {
        public List<string> Cities { get; set; }
    }
}
'@
$citiesResponseClass | Set-Content -Path (Join-Path -Path $entitiesDir -ChildPath "CitiesResponse.cs")

# Create the StreetsResponse class in the Entities folder
$streetsResponseClass = @'
namespace AddressCheckTests.Entities
{
    using System.Collections.Generic;

    public class StreetsResponse
    {
        public List<string> Streets { get; set; }
    }
}
'@
$streetsResponseClass | Set-Content -Path (Join-Path -Path $entitiesDir -ChildPath "StreetsResponse.cs")

# Create the TestData class in the Data folder
$testDataClass = @'
namespace AddressCheckTests.Data
{
    using System.Collections.Generic;
    using AddressCheckTests.Entities;

    public static class TestData
    {
        public static IEnumerable<object[]> CitiesTestData =>
            new List<object[]>
            {
                new object[] { "10409", new CitiesResponse { Cities = new List<string> { "Berlin" } } },
                new object[] { "77716", new CitiesResponse { Cities = new List<string> { "Fischerbach", "Haslach", "Hofstetten" } } }
            };

        public static IEnumerable<object[]> StreetsTestData =>
            new List<object[]>
            {
                new object[] { "10409", "Berlin", new StreetsResponse { Streets = new List<string> { "Cohnstr.", "Einsteinstr.", "Erich-Weinert-Str.", "Georg-Blank-Str.", "Goethestr.", "Greifswalder Str.", "Grellstr.", "Gubitzstr.", "Gürtelstr.", "Hanns-Eisler-Str.", "Hosemannstr.", "Küselstr.", "Lindenhoekweg", "Mandelstr.", "Michelangelostr.", "Naugarder Str.", "Ostseeplatz", "Ostseestr.", "Paul-Grasse-Str.", "Pieskower Weg", "Prenzlauer Allee", "Preußstr.", "Rietzestr.", "Schieritzstr.", "Sodtkestr.", "Storkower Str.", "Sültstr.", "Thomas-Mann-Str.", "Trachtenbrodtstr." } } },
                new object[] { "77716", "Fischerbach", new StreetsResponse { Streets = new List<string> { "Am Höfle", "Bergstr.", "Ellengrund", "Ellmattenstr.", "Eschau", "Eschbach", "Fritz-Ullmann-Weg", "Gemsbühl", "Goetheweg", "Hansjakobstr.", "Hauptstr.", "Herrenberg", "Hintertal", "Im Katzengraben", "Im Wiesengrün", "Karl-May-Weg", "Kinzigstr.", "Kirchweg", "Martinshof", "Mitteltal", "Obere Klinge", "Oberer Wiesenrain", "Pfarrer-Strittmatter-Weg", "Rebgartenstr.", "Reichenbergstr.", "Schillerweg", "Sonnenmatte", "Sportplatz", "Trottmatten", "Turm", "Untere Klinge", "Vordertal", "Waldstein", "Wiesenrain" } } },
                new object[] { "77716", "Haslach", new StreetsResponse { Streets = new List<string> { "Ahornstr.", "Allmendgasse", "Allmendweg", "Alte Eisenbahnstr.", "Alte Hausacher Str.", "Am Dorfbach", "Am Gewerbekanal", "Am Helgenberg", "Am Marktplatz", "Am Mühlbach", "Am Schafsteg", "Am Schänzle", "Am Schloßberg", "Am Sonnenrain", "Am Spielplatz", "Bachgasse", "Bächlewaldweg", "Baumeisterstr.", "Beethovenstr.", "Bergstr.", "Birkenstr.", "Bohnackerstr.", "Bollenbacher Str.", "Breitestr.", "Bruno-Lenz-Str.", "Buchenstr.", "Dorfstr.", "Dr.-Kempf-Str.", "Eichenbachstr.", "Eichenweg", "Engelstr.", "Felsenweg", "Franz-Schmider-Str.", "Gaisbürde", "Gartenstr.", "Gebelestr.", "Gerbergasse", "Goethestr.", "Grafenstr.", "Grieshabergasse", "Grünweg", "Hansjakobstr.", "Hauptstr.", "Hausacher Str.", "Haydnstr.", "Hebelstr.", "Herrenberg", "Hofstetter Str.", "Holderweg", "Horst-Prinzbach-Str.", "Im Brühl", "Im kleinen Grünle", "Im Mühlegrün", "Im Spießacker", "Im Stricker", "In der Frühmeß", "In der Hornmatt", "In der Sägmatt", "In der Schmelze", "In der Zillmatt", "Innerer Graben", "Josef-Rau-Str.", "Julius-Allgeyer-Str.", "Kampfackerstr.", "Kapellenweg", "Kinzigstr.", "Kirchgasse", "Klosterstr.", "Kolpingstr.", "Königsberger Str.", "Leimengrubweg", "Lindenstr.", "Lippstr.", "Ludwig-Blum-Str.", "Metzgergasse", "Mozartstr.", "Mühlbachweg", "Mühlenbacher Str.", "Mühlenstr.", "Mülldeponie Vulkan", "Neue Eisenbahnstr.", "Neuer Bergweg", "Neumatt", "Niederhofenweg", "Otto-Göller-Str.", "Otto-Laible-Str.", "Pfarrer-Albrecht-Str.", "Pfarrer-Vetter-Str.", "Pfarrgasse", "Richard-Wagner-Str.", "Ringstr.", "Rotkreuzstr.", "Rudolfstr.", "Sägerstr.", "Sandhaasenhalde", "Sandhaasstr.", "Schillerstr.", "Schlattstr.", "Schleifmattstr.", "Schlossergässle", "Schnellinger Str.", "Schubertstr.", "Schulstr.", "Schwarzwaldstr.", "Seilerstr.", "Siedlerstr.", "Silberbergweg", "Simon-Fink-Str.", "Sommerhaldenweg", "Steinacher Str.", "Strickerweg", "Talstr.", "Tannenstr.", "Unterm Dorf", "Waldseeweg", "Waldstr.", "Weiherdamm", "Weihermatt", "Wilhelm-Engelberg-Str.", "Wolfgäßle", "Xaver-Hättich-Str.", "Ziegelhütte", "Zunftgasse" } } },
                new object[] { "77716", "Hofstetten", new StreetsResponse { Streets = new List<string> { "Alter Weg", "Altersbach", "Am Schneitbach", "Auf der Rot", "Bannmatt", "Berg", "Breitebene", "Brunnacker", "Bühlstr.", "Dorfwiesen", "Eugen-Klausner-Str.", "Friedhofstr.", "Georg-Giesler-Str.", "Georg-Neumaier-Str.", "Haldestr.", "Hansjakobstr.", "Hauptstr.", "Heidburg", "Helgenrain", "Im Reble", "Im Schneiben", "Kapellenweg", "Kirchacker", "Kreuzstr.", "Lachen", "Lindengarten", "Mattenmühle", "Mittelweiler", "Mühlenmatten", "Munde", "Oberdorf", "Salmensbach", "Schluchstr.", "Schulstr.", "Senkmatt", "Ullerst", "Unterdorf", "Unterer Fellberg", "Waldseeweg", "Weißer Brunnen" } } }
            };
    }
}
'@
$testDataClass | Set-Content -Path (Join-Path -Path $dataDir -ChildPath "TestData.cs")

# Create the AddressCheckCitiesTests class in the root folder
$cityTestClass = @'
using System;
using System.Net.Http;
using System.Threading.Tasks;
using AddressCheckTests.Entities;
using AddressCheckTests.Data;
using FluentAssertions;
using Newtonsoft.Json;
using Xunit;

namespace AddressCheckTests
{
    public class AddressCheckCitiesTests : IDisposable
    {
        private readonly HttpClient _client;
        private const string BaseUrl = "https://service.verivox.de/geo/latestv2/cities/";

        public AddressCheckCitiesTests()
        {
            _client = new HttpClient();
        }

        [Theory]
        [MemberData(nameof(TestData.CitiesTestData), MemberType = typeof(TestData))]
        public async Task GetCities_ValidPostcode_ReturnsExpectedCities(string postcode, CitiesResponse expectedResponse)
        {
            // Act
            var httpResponse = await _client.GetAsync($"{BaseUrl}{postcode}");
            var responseString = await httpResponse.Content.ReadAsStringAsync();

            // Assert 1: Check that the status code is 200
            httpResponse.StatusCode.Should().Be(System.Net.HttpStatusCode.OK);

            // Assert 2: Check that the result contains a list of cities
            var result = JsonConvert.DeserializeObject<CitiesResponse>(responseString);
            result.Should().NotBeNull();
            result.Cities.Should().NotBeNull();
            result.Cities.Should().BeOfType<List<string>>();
            result.Cities.Should().NotBeEmpty();

            // Assert 3: Check that the result matches the expected response
            result.Should().BeEquivalentTo(expectedResponse);
        }

        [Fact]
        public async Task GetCities_InvalidPostcode_ReturnsNotFound()
        {
            // Arrange
            var url = $"{BaseUrl}22333";

            // Act
            var response = await _client.GetAsync(url);

            // Assert
            response.StatusCode.Should().Be(System.Net.HttpStatusCode.NotFound);
            var content = await response.Content.ReadAsStringAsync();
            content.Should().BeEmpty();
        }

        public void Dispose()
        {
            _client.Dispose();
        }
    }
}
'@
$cityTestClass | Set-Content -Path (Join-Path -Path $projectDir -ChildPath "AddressCheckCitiesTests.cs")

# Create the AddressCheckStreetTests class in the root folder
$streetTestClass = @'
using System;
using System.Net.Http;
using System.Threading.Tasks;
using AddressCheckTests.Entities;
using AddressCheckTests.Data;
using FluentAssertions;
using Newtonsoft.Json;
using Xunit;

namespace AddressCheckTests
{
    public class AddressCheckStreetTests : IDisposable
    {
        private readonly HttpClient _client;
        private const string BaseUrl = "https://service.verivox.de/geo/latestv2/cities/";

        public AddressCheckStreetTests()
        {
            _client = new HttpClient();
        }

        [Theory]
        [MemberData(nameof(TestData.StreetsTestData), MemberType = typeof(TestData))]
        public async Task GetStreets_ValidPostcodeAndCity_ReturnsExpectedStreets(string postcode, string city, StreetsResponse expectedResponse)
        {
            // Act
            var response = await _client.GetStringAsync($"{BaseUrl}{postcode}/{city}/streets");
            var result = JsonConvert.DeserializeObject<StreetsResponse>(response);

            // Assert
            result.Should().BeEquivalentTo(expectedResponse);
        }

        public void Dispose()
        {
            _client.Dispose();
        }
    }
}
'@
$streetTestClass | Set-Content -Path (Join-Path -Path $projectDir -ChildPath "AddressCheckStreetTests.cs")

# Restore and build the project
dotnet restore
dotnet build

# Run tests and generate HTML report
$testResultsDir = Join-Path -Path $projectDir -ChildPath "TestResults"
$reportFileName = "test_results.html"
$outputHtmlPath = Join-Path -Path $testResultsDir -ChildPath $reportFileName

dotnet test --logger "html;logFileName=$reportFileName" --results-directory $testResultsDir

# Check if HTML report was generated
if (-Not (Test-Path $outputHtmlPath)) {
    Write-Error "HTML report was not generated."
    exit 1
}

# Notify completion
Write-Host "Setup complete, tests run, and HTML test report generated. The report is located at $outputHtmlPath."
