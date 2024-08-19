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
