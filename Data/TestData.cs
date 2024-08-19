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
