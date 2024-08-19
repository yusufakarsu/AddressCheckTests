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
