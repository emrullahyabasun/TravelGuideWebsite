USE [master]
GO
/****** Object:  Database [TravelGuideWebsiteDb]    Script Date: 2.01.2024 06:37:12 ******/
CREATE DATABASE [TravelGuideWebsiteDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TravelGuideWebsiteDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TravelGuideWebsiteDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TravelGuideWebsiteDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TravelGuideWebsiteDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TravelGuideWebsiteDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET RECOVERY FULL 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET  MULTI_USER 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TravelGuideWebsiteDb', N'ON'
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TravelGuideWebsiteDb]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2.01.2024 06:37:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogComments]    Script Date: 2.01.2024 06:37:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogComments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[CreationDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsStatus] [bit] NOT NULL,
	[UserId] [int] NOT NULL,
	[BlogPostId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.BlogComments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogLikes]    Script Date: 2.01.2024 06:37:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogLikes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
	[BlogPostId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.BlogLikes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogPosts]    Script Date: 2.01.2024 06:37:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogPosts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[CreationDate] [datetime] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsStatus] [bit] NOT NULL,
	[UserId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.BlogPosts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 2.01.2024 06:37:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2.01.2024 06:37:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2.01.2024 06:37:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsStatus] [bit] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202312301339219_revisedDb', N'TravelGuideWebsite.Migrations.Configuration', 0x1F8B0800000000000400ED1DC96EE4B8F51E20FF20E894041ECB765F3246D50CBACBED819176DBE8F24C723368892E0BA3A522511E1B41BE2C87F9A4FC4248510B57895269293B85061A36293E3E3EBE9D7CF47FFFF3FBE2C79730B09E6192FA71B4B44F8F4F6C0B466EECF9D1666967E8F1BBBFDA3FFEF0C73F2C3E7BE18BF54BF9DD07F21D1E19A54BFB09A1EDB9E3A4EE130C417A1CFA6E12A7F1233A76E3D0015EEC9C9D9C7CEF9C9E3A1083B0312CCB5A7CCB22E48730FF05FFBA8A23176E510682EBD883415AB4E39E750ED5FA0A42986E810B97F65D029E61F053E67BF0EFF021F5113CFE8C81A157DBFA18F80023B486C1A36D81288A114018DDF39F53B846491C6DD65BDC0082BBD72DC4DF3D822085C532CEEBCF4D5774724656E4D4034B506E96A238EC08F0F4434122471CDE8BD07645424C444A1FB2EA9C904BFB53106F567118C208D99638DFF92A48C8B74A52D3FD3966001C59F2674715A7608622FF8EAC5516A02C81CB08662801C191759B3D04BEFB37F87A17FF0AA3659405018B34461BF7710DB8E93689B73041AFDFE063B1942BCFB61C7E9C230EAC863163E80AAF22F4E1CCB6BEE2C9C143002B9E60A8B14671027F82114C0082DE2D4008261181010BAE731AE7C2AC8D7232D309311F62C9B2AD6BF0F205461BF4B4B4F18FB675E9BF40AF6C2990F839F2B120E24128C960EB3C09CCF1BDC0589693919FEFB0982916D80CEC2ABD8001C4CB2D217D8AE30082A807A035266396EE0A074B70D2BE6BCD3008CFDEC629EA0CE72B78F637397135106DEB1B0CF20FD2277F4B15D071D9795FC809A6C1651287DFE280195975DEDF816403099BC4BA2FD67196B81DB023345362463A9458711D12467CAF0A9B85536B9A56FD4309D757F990D107CDD338D79D8F0238BEDE7993FA2D049BF149F32EB5E80A73DE701A7495F3B14247918E7B22E49C82AA5B25EDC474755594B52ADC5D8D9773EBD57889B829765FFC5FA11E35D27B5FAB531E35AE536961F82F86B5302558D9C4543D6A1B5377EF6464286FF5313064E4C1B834CE45FE1F5D815EC0D44DFC2D0D82C656D6E39804ADEC1492D147F5893A46A1157B7B654421F4F7CAC8E883E04CE7C7CC1A160DE6EDF48FAF3A583F956156DBC761AC5F61B605CB97B7AAAD1EEDDAC9E2518CFA082F197910DC292C5E47A95A674934CBC49F43E007D34F7B0BD2F4B738F1A69FF91060EE1E601275367C7A4DED2619C718A2E6D7842083448B86A935254A234488AD964889086FA44CB120009448908E7B029843A26E95CC21D3B59339A418F5318764E4C11CCE1F008EE053168CD8874F456151B0B0099F7E4CD3D8F5F3D9994C4511F1F1ABF81C79963EFCA3B42F43464C7ECC8AFE16331FFE6D699FDA2293DD44949AD647971E4BAE40EA024F261E46DC3340A492DB1A91DA17E791F98B3407E67498105603C10A6F03961D3F42B258F891EB6F41A0A58230C25094C81A2BD862CF05DCC288488176C5269396795279E20ABE40F4368A2C1C86739A194A4E5AEAB6B32183D9BEAB23B158C3E1188F5375843D0AB369493301CF69496032371BD1CFC67E7C68DEB4D59A389DDF6A9A976ADBE726C01DB4D5A07CDD9BF794E84FC47BCA3D7913BC2784053AFED0C5083573D064CA240A4F772832995D555363025E53AFDC64E232F5391F93B5DA564DCC371F8BCD6B4F95E4988AC7FAD8D1F9598C86EE8D7B2AC4F1F3319790DAEE63BEFBB3154785A9788A5BF1DE331413DEEAF65115EBD6FB48D3299330942A39D4CCD90331934C810998495EADC9A465AE750266A2790C72D30B8F8049793A0F10C86F7FBDA8EEF1E1F51489B6B4C8F5889B4D60AE2192AF24A7B655674E54E649F2FA655045525809873A522D4070FCEE431584952A39A642A1C8BB2A51A0FAB00548918B920050FE6F194CD84335984AB13098D9778E02D53D04E603F99682C8808D59AB0ACF9AC4120737669B1800CC468BCA855F91C16A15F7BCE445B7E4550C332B262B304C8808A06ADC07A18770BCAEA64743A06F18EA0B8B28E4A6851EEAE07E24E610CF9A644A34859D268127837821F60DEBD7C48B632EBE492A1AA2218378A8FBCA279402F6004DB370858FDEE6A5775F32EF5C9B084C8FC5B20720F26275FE639B07C9205BD8A486C52A1CBF3662352CB43C81A93C97AA6FE1D0C2B2A261E1682AD016D760BBF5A30D539156B4586B5A8EB6FA6EDDBD402BA4301C97A3A5E8675533A138011B28F49293680F5EFA498A8827F600C829D8CA0BA5CF583F4DE3339433295C3179AF4A87A21C447E2E2A0E74A5799CFB263BB705A44BBC4AF245BE60A8166A79B4458A04410012C561E82A0EB230D23BE9FAD15559030BA26AEC0087BB55C201E37ACC213267A2DCF2EAE62EB0CA7B1F3CA8B2D51C5219DAB27074E1AE1E0A9B3D662135659589F40A0C24454412D34AA1282F08C662A2B3F67D6544E543190A887AE838D2519416B1008AA6772161F4F216471EDA749052F6689BA3B5E6B87B36E92C82CB6144338FF9BB8BA57AD8382249EFE3B0E3698B3904AEDA8205C4758C234633AA709DFFDE5785E7A99D7E2A5C3D7424076770B539A70B30A41A9E891775A1551F3ECC3384DD79503D6C5FF55575359E0552359AC3296EBAB3508A267318F5B575164CDD7A7067C67067CA2310168EEE586436B9A6498F61E43A4FDE77976BF5B07D95EBBDD3D9521A49FCA49ABD4A270969A34591C2697FDD48CAE9D04F6C0B13E91933448255DC6B8A60784C3E385EFF3358057E1E31951F5C83C87F8429A2D7CFEDB393D333E165A4FD79A5C849532F50A4C0344F15F15B36C1357A9F10B6F5A27CD74223FEC58CE81924EE1348FE1482973FB3C0FABE8AE1E19FD120AFFE3CF868E752A23E30F8B2565FF948D555E4C197A5FDAF7CC8B975F58F7B3AEAC8BA49B0149C5B27D6BF07A885359DBC1ED90181EEEFE5BC0F09E05EA6D98DFFF75696D802C09DD03A4825FFE48CE9C474D418D228A775DEAC2452DF6C002E553CD5B11BD7F7949FEE8F5DBC8F8D1C5479FDBFD8DF41946DB7D719DE07B719A98D3EEF1BEC068C7BB3603750E23B04BB413BB816CD30F877034C659E8E1AC3C2CB0993F72DAA2331CBE015D073153DD77720A7AD759EB2D4F43D5635CF5DC55CDD589FA570792AEED15FECDAC3FAD06EB5C9FBC044B45660BA82AAA9D9477360BE87BCD3A1B678AE52BC392C95E6B4795E4B357FF1A6517DF09C7C328F759A925BBA58A6F919A6BDDA774E6E99DA0C4DC927C626E82D54F0CE55B46BC4A003D6E94E55E7FD36AA71E56210719FB4F5B66DE5B6F40AC2D2F61E62BCBF34DA6FACB352CD45FD0FE544B44B378BBA8C4D9C82260324F0B459055A5D7CAA2DE46DACE3D5A1AE2ECC12A7A0622281A7CD2AD0EA3228112C957C092C6D56815556678D5A1A2C56034B75D51AD75655F9304CC5EB2815C04608EBBD3361B0AE0A7E4F4A7CFB2F981533FE4AF440759CC315F04A5589B332EEA005BADD97363EA30E5485DB7D6963B2E440D5B652816DE3A28CC8304C45AD7CE511FB3CCC9F7DC4BE56EA6F6A10E48F4046D0E5BC9DEA9BABE8312E9D2E01A3F213E1B8E21A22E06157E86382FC47E022DCEDC234CDDFA9FD05041924C7850FD0BB8A6E32B4CD105E320C1F02CE0411E7AD69FEBC6C98C7797193DF814887580246D327A78437D1A7CC0FBC0AEF4BC5498B0604F10A8BC324B297881C2A6D5E2B485FE3C8105041BECA99BD83E136C0C0D29B680D9E611FDC30EB7D811BE0BE963757F540DA378227FBE2C2079B04846901A31E8F7FC53CEC852F3FFC0FF049C9CEFD740000, N'6.4.4')
GO
SET IDENTITY_INSERT [dbo].[BlogComments] ON 

INSERT [dbo].[BlogComments] ([Id], [Content], [CreationDate], [IsDeleted], [IsStatus], [UserId], [BlogPostId]) VALUES (2, N'testds', CAST(N'2024-01-02T01:45:32.717' AS DateTime), 0, 0, 1, 6)
INSERT [dbo].[BlogComments] ([Id], [Content], [CreationDate], [IsDeleted], [IsStatus], [UserId], [BlogPostId]) VALUES (3, N'İstanbul, tarihi ve kültürel zenginlikleri ile büyüleyici bir mozaik gibidir. Her köşesi tarih kokar, her sokakta yaşanmışlıkların izleri vardır. Ayasofya''nın muhteşem kubbesi, Topkapı Sarayı''nın ihtişamı ve Sultanahmet Camii''nin zarif minareleri gibi tarihi yapılar, İstanbul''un tarihine ve kültürüne derin bir saygıyı yansıtır.

Boğaz''ın mavi suları, Asya ve Avrupa''yı birbirine bağlayan bu büyülü su yolunun kenarında sakin ve huzurlu bir atmosfer sunar. Özellikle gün batımında, Boğaz Köprüsü''nün altında parlayan güneş ışığı, unutulmaz anlar yaratır.', CAST(N'2024-01-02T01:58:38.320' AS DateTime), 0, 0, 3, 6)
INSERT [dbo].[BlogComments] ([Id], [Content], [CreationDate], [IsDeleted], [IsStatus], [UserId], [BlogPostId]) VALUES (4, N'adgsfdsgfdgfd', CAST(N'2024-01-02T03:50:03.957' AS DateTime), 0, 0, 3, 2)
SET IDENTITY_INSERT [dbo].[BlogComments] OFF
GO
SET IDENTITY_INSERT [dbo].[BlogLikes] ON 

INSERT [dbo].[BlogLikes] ([Id], [CreationDate], [UserId], [BlogPostId], [IsDeleted]) VALUES (1, CAST(N'2024-01-02T03:38:39.220' AS DateTime), 1, 2, 0)
INSERT [dbo].[BlogLikes] ([Id], [CreationDate], [UserId], [BlogPostId], [IsDeleted]) VALUES (2, CAST(N'2024-01-02T03:40:02.153' AS DateTime), 3, 2, 0)
SET IDENTITY_INSERT [dbo].[BlogLikes] OFF
GO
SET IDENTITY_INSERT [dbo].[BlogPosts] ON 

INSERT [dbo].[BlogPosts] ([Id], [Title], [Content], [CreationDate], [Image], [IsDeleted], [IsStatus], [UserId], [CityId]) VALUES (2, N'Adana''da bir gün', N'Adana: Lezzetlerin Başkenti ve Tarihi Zenginliklerin Şehri

Türkiye''nin güneyinde bulunan Adana, hem lezzetleriyle ünlü hem de tarihi zenginlikleriyle göz kamaştıran bir şehirdir. Akdeniz''in sıcak ve güneşli iklimi, burayı yıl boyunca cazip bir turistik destinasyon haline getirirken, Adana''nın kendine özgü kültürü ve mutfağı da burayı benzersiz kılıyor.

Adana Mutfağı:

Adana denince akla ilk gelen şey, kendine özgü ve lezzetli yemekleri olan Adana kebaplarıdır. Etin mükemmel baharatlarla harmanlandığı bu kebap, hem yerel halkın hem de turistlerin favorisi olmuştur. Bunun yanı sıra şehirde bulunan pide ve lahmacunlar da tatilcilerin damak zevkine hitap eder.

Tarihi ve Kültürel Zenginlikler:

Adana, tarihi ve kültürel açıdan da zengin bir şehirdir. Roma dönemine ait Taşköprü, Osmanlı dönemine ait olan Adana Saat Kulesi ve Adana Ulu Camii gibi tarihi yapılar, şehrin ziyaretçilere sunabileceği güzelliklerden sadece birkaçıdır. Ayrıca, Adana''nın tarihi müzeleri ve antik kalıntıları da tarihseverler için ilgi çekicidir.

Doğal Güzellikler:

Adana, doğal güzellikleri ile de ünlüdür. Seyhan Nehri ve Ceyhan Nehri, şehirdeki doğal yaşamın merkezini oluşturur. Aynı zamanda şehre yakın olan Aladağlar Milli Parkı da doğa tutkunları için harika bir kaçış noktasıdır. Bu parkta yürüyüş yapabilir, dağcılık deneyimleri yaşayabilir ve doğanın tadını çıkarabilirsiniz.

Sonuç:

Adana, lezzetli mutfağı, tarihi zenginlikleri ve doğal güzellikleri ile Türkiye''nin keşfedilmeyi bekleyen bir hazine gibi şehirlerinden biridir. Hem yerel kültürü yaşayabilir hem de muhteşem yemekleri tadabilirsiniz. Tarihi ve doğal güzellikler ise ziyaretinizi unutulmaz kılacaktır. Adana, sıcakkanlı insanları ve zengin mirası ile sizi bekliyor.', CAST(N'2023-12-31T01:33:58.050' AS DateTime), N'https://im.haberturk.com/l/2023/04/27/ver1682599142/3586723/jpg/640x360', 0, 1, 1, 1)
INSERT [dbo].[BlogPosts] ([Id], [Title], [Content], [CreationDate], [Image], [IsDeleted], [IsStatus], [UserId], [CityId]) VALUES (6, N'Tahanlı denediniz mi?', N'Bursa: Yeşilin ve Tarihin Şehri

Türkiye''nin Marmara bölgesinde yer alan Bursa, doğal güzellikleri, tarihi zenginlikleri ve lezzetli mutfağıyla ünlü bir şehirdir. Yeşil Bursa olarak da bilinen bu şehir, doğal parkları ve tarihi yapıları ile ziyaretçilerini büyüler.

Bursa''nın Doğal Güzellikleri:

Bursa''nın en ünlü doğal güzelliklerinden biri Uludağ''dır. Türkiye''nin en yüksek dağı olan Uludağ, kışın kayak yapmak için ve yazın doğa yürüyüşleri yapmak için ideal bir destinasyondur. Aynı zamanda Uludağ''da bulunan termal oteller, ziyaretçilere rahatlatıcı bir spa deneyimi sunar.

Şehirdeki Botanik Park ve Gölyazı gibi diğer doğal alanlar da huzurlu yürüyüşler ve piknikler için idealdir.

Bursa''nın Tarihi Zenginlikleri:

Bursa, Osmanlı İmparatorluğu''nun ilk başkenti olarak önemli bir tarihi mirasa sahiptir. Bursa Kalesi, Ulu Camii ve Osman Gazi Türbesi gibi tarihi yapılar şehirdeki görülmeye değer yerlerdendir. Ayrıca, Bursa''da bulunan tarihi hamamlar da tarihseverler için ilgi çekicidir.

İznik: Tarihi Bir Mücevher

Bursa''ya sadece bir saatlik mesafede bulunan İznik, antik Nikaia şehri olarak bilinir. Şehir, Roma ve Bizans dönemlerine ait tarihi kalıntıları ile ünlüdür. İznik Gölü''nün kıyısında bulunan bu şehir, antik dönemden kalan surları, tiyatrosu ve kiliseleri ile tarihi bir mücevherdir.

Ayrıca, İznik seramiği de ünlüdür ve el yapımı seramik ürünlerini alabileceğiniz atölyeleri ziyaret etmek ilginç bir deneyim sunar.

Sonuç:

Bursa ve İznik, doğanın ve tarihin mükemmel bir uyumunu sunan şehirlerdir. Yeşillikler içinde huzurlu bir tatil geçirmek isterseniz Bursa''ya, antik dönemin izlerini sürmek ve seramik sanatını keşfetmek isterseniz İznik''e gitmek harika bir seçenektir. Bursa ve İznik, Türkiye''nin zengin kültürel ve doğal mirasını keşfetmek isteyenler için vazgeçilmez destinasyonlardır.', CAST(N'2024-01-01T15:11:50.700' AS DateTime), N'https://www.gurmex.com/wp-content/uploads/2015/08/Bursada-tahanli-tahinli-pide-nerede-yenir-en-iyi-tahanli-pideciler-bursa-gurme-yeme-icme-blog-1.png', 0, 1, 1, 16)
INSERT [dbo].[BlogPosts] ([Id], [Title], [Content], [CreationDate], [Image], [IsDeleted], [IsStatus], [UserId], [CityId]) VALUES (9, N'Hatay ve Asi Nehri', N'Türkiye''nin güneyinde Akdeniz''e kıyısı olan Hatay, tarihi ve kültürel zenginlikleriyle öne çıkan büyüleyici bir şehirdir. Hem doğal güzellikleri hem de farklı kültürlerin izlerini taşıyan tarihi yerleri ile Hatay, her türlü gezginin ilgisini çekiyor.

Lezzetlerin Başkenti:

Hatay mutfağı, Türkiye''nin en çeşitli ve lezzetli mutfaklarından birini sunar. Antakya mutfağının öne çıkan lezzetleri arasında humus, kebaplar, zahter salatası ve baklava bulunur. Ayrıca, şehirde tüketebileceğiniz enfes meze çeşitleri ve yöresel tatlar sizi lezzet yolculuğuna çıkarır.

Tarihi Zenginlikler:

Hatay, tarih ve kültür meraklıları için bir cennettir. Antakya, tarihi kalıntıları, Antik Roma dönemine ait mozaikleri ve Saint Pierre Kilisesi gibi önemli yerleri ile ünlüdür. Ayrıca, şehirdeki Uzuncaburç Antik Kenti ve Vespasianus Tüneli de tarihseverlerin ilgisini çekecektir.

Çok Kültürlü Miras:

Hatay, farklı kültürlerin bir araya geldiği bir bölge olduğundan, Arap, Türk, Ermeni ve diğer kültürlerin izlerini taşır. Bu çok kültürlü miras, şehirdeki çeşitli dini ve tarihi yerlerde görülebilir. Hatay, farklı dinlere ait ibadet yerleri ve tarihi camileriyle dini bir çeşitliliği de yansıtır.

Doğal Güzellikler:

Hatay sadece tarihi ve kültürel açıdan değil, aynı zamanda doğal güzellikleri ile de büyüler. Arsuz ve İskenderun sahilleri, deniz, güneş ve kum sevenler için idealdir. Aynı zamanda şehirdeki Harbiye Şelalesi, doğa tutkunları için harika bir kaçış noktasıdır.

Sonuç:

Hatay, lezzetli mutfağı, zengin tarihi mirası ve doğal güzellikleriyle her türlü gezgin için cazip bir destinasyondur. Hem kültürü yaşayabilir hem de eşsiz lezzetlerin tadını çıkarabilirsiniz. Tarihi ve doğal güzellikler şehirdeki ziyaretinizi unutulmaz kılacaktır. Hatay, tarih ve doğanın muhteşem bir buluşma noktasıdır.', CAST(N'2023-12-31T01:33:58.050' AS DateTime), N'https://www.temizmekan.com/wp-content/uploads/2023/02/Hatay.jpg', 0, 1, 3, 31)
INSERT [dbo].[BlogPosts] ([Id], [Title], [Content], [CreationDate], [Image], [IsDeleted], [IsStatus], [UserId], [CityId]) VALUES (11, N'Doğanın Kucağında Bir Cennet', N'Rize: Doğanın Kucağında Bir Cennet

Türkiye''nin Karadeniz bölgesinde yer alan Rize, muhteşem doğal güzellikleri, yeşil dağları ve benzersiz kültürü ile ünlü bir şehirdir. Karadeniz''in incisi olarak bilinen Rize, hem doğaseverlerin hem de tarihseverlerin ilgisini çekiyor.

Yeşilin Başkenti:

Rize''nin en belirgin özelliklerinden biri muhteşem yeşil doğasıdır. Şehir, yoğun yağışlar nedeniyle yemyeşil ormanlarla kaplıdır. Rize''nin çay bahçeleri, dünyanın en iyi çaylarının üretildiği yerlerden biri olarak ün yapmıştır. Çay tarlalarını ziyaret ederek çayın yapılış sürecini gözlemlemek ilginç bir deneyim olabilir.

Trabzon ve Ayder Yaylası:

Rize''ye yakın olan Trabzon şehri ve Ayder Yaylası, bölgeyi ziyaret edenler için popüler destinasyonlardır. Trabzon, tarihi ve doğal güzellikleri ile ünlüdür. Ayder Yaylası ise şehrin eteklerinde yer alan serinletici bir kaçış noktasıdır. Burada termal sular, doğa yürüyüşleri ve muhteşem manzaralar sizi bekliyor.

Karadeniz Mutfağı:

Rize, zengin ve lezzetli bir Karadeniz mutfağına ev sahipliği yapar. Mısır ekmeği, hamsi tava, kuymak ve laz böreği gibi yerel lezzetler Rize''de tadabileceğiniz enfes yemeklerdir. Aynı zamanda yöresel fındık ürünleri de meşhurdur.

Tarihi ve Kültürel Zenginlikler:

Rize, tarihi ve kültürel açıdan da ilgi çekicidir. Rize Kalesi ve Çayeli Camii gibi tarihi yapılar, şehirdeki tarihi zenginlikler arasındadır. Ayrıca, Karadeniz''in geleneksel el sanatlarına ait ürünleri satan yerel pazarlar da ziyaret edilebilir.

Sonuç:

Rize, muhteşem doğal güzellikleri, zengin kültürü ve lezzetli mutfağı ile Karadeniz''in gözde destinasyonlarından biridir. Doğa severler için cennet olan bu şehirde, yeşilin ve denizin tadını çıkarabilirsiniz. Rize''nin sıcakkanlı insanları ve kendine özgü atmosferi, ziyaretinizi unutulmaz kılacaktır.', CAST(N'2024-01-01T15:11:50.700' AS DateTime), N'https://www.kanuni.com.tr/wp-content/uploads/2023/07/Rizede-Gezilecek-Yerler.png', 0, 1, 3, 53)
INSERT [dbo].[BlogPosts] ([Id], [Title], [Content], [CreationDate], [Image], [IsDeleted], [IsStatus], [UserId], [CityId]) VALUES (12, N'Dünyanın Merkezi', N'İstanbul, tarihi ve kültürel zenginlikleri ile büyüleyici bir mozaik gibidir. Her köşesi tarih kokar, her sokakta yaşanmışlıkların izleri vardır. Ayasofya''nın muhteşem kubbesi, Topkapı Sarayı''nın ihtişamı ve Sultanahmet Camii''nin zarif minareleri gibi tarihi yapılar, İstanbul''un tarihine ve kültürüne derin bir saygıyı yansıtır.

Boğaz''ın mavi suları, Asya ve Avrupa''yı birbirine bağlayan bu büyülü su yolunun kenarında sakin ve huzurlu bir atmosfer sunar. Özellikle gün batımında, Boğaz Köprüsü''nün altında parlayan güneş ışığı, unutulmaz anlar yaratır.

Kapalıçarşı ve Grand Bazaar gibi alışveriş mekanları, İstanbul''un alışveriş cenneti olarak ün salmıştır. Burada el yapımı halılar, geleneksel takılar ve lezzetli baharatlar gibi benzersiz ürünleri bulabilirsiniz.

İstanbul mutfağı, dünya çapında tanınan lezzetleriyle damakları şenlendirir. Döner, kebap, baklava ve simit gibi yiyecekler, sokaklarda satılan lezzetler arasında yer alırken, yerel restoranlarda da Osmanlı mutfağından geleneksel lezzetler sunulur.

İstanbul''un güzelliklerini anlatmak bitmek bilmez çünkü bu şehir her köşesinde yeni bir keşif sunar. Tarihi, doğal güzellikleri, kültürü ve lezzetleri ile İstanbul, dünyanın dört bir yanından gelen ziyaretçileri büyülemeye devam ediyor. Bu büyüleyici şehri keşfetmek, her anı unutulmaz bir serüven sunar.', CAST(N'2024-01-02T02:12:30.207' AS DateTime), N'https://cdn1.ntv.com.tr/gorsel/33zcTShTfkCxr22gDaMvbA.jpg?width=952&height=540&mode=both&scale=both', 0, 1, 3, 34)
INSERT [dbo].[BlogPosts] ([Id], [Title], [Content], [CreationDate], [Image], [IsDeleted], [IsStatus], [UserId], [CityId]) VALUES (13, N' Lezzetlerin ve Tarihin Buluştuğu Şehir', N'Türkiye''nin güneydoğusunda yer alan Kahramanmaraş, zengin tarihi mirası, eşsiz mutfağı ve doğal güzellikleri ile dikkat çeken bir şehirdir. "Dondurma" ve "beyran" gibi ünlü lezzetleriyle bilinse de, bu şehir aynı zamanda tarih ve kültür açısından da büyük bir zenginliğe sahiptir.

Kahramanmaraş Mutfağı:

Kahramanmaraş, Türkiye''nin en ünlü mutfağına ev sahipliği yapar. Dondurması, özellikle sıcak yaz günlerinde serinlemek isteyenlerin vazgeçilmezidir. Ayrıca, kırmızı biberiyle ünlü Maraş biberi, şehrin yemeklerine lezzet katan önemli bir malzemedir. Beyran çorbası ise kahvaltıda veya öğle yemeğinde tercih edilen geleneksel bir lezzettir.

Tarihi Zenginlikler:

Kahramanmaraş, tarihi ve kültürel açıdan da keşfedilmeye değer bir şehirdir. Şehirdeki tarihi kale, taş köprüler ve camiler, ziyaretçilere geçmişe yolculuk yapma fırsatı sunar. Maraş Kalesi, şehir manzarasına hakim bir konumda bulunur ve tarihi atmosferiyle büyüler.

Doğal Güzellikler:

Kahramanmaraş, doğal güzellikleri ile de ünlüdür. Munzur Dağları, Yedikuyular Yaylası ve Kapıçam Tabiat Parkı gibi doğal alanlar, doğa tutkunları için harika bir kaçış noktasıdır. Bu bölgelerde trekking, kamp ve doğa yürüyüşleri yapabilirsiniz.

Sonuç:

Kahramanmaraş, lezzetli mutfağı, tarihi zenginlikleri ve doğal güzellikleri ile Türkiye''nin keşfedilmeyi bekleyen gizli mücevherlerinden biridir. Hem geleneksel tatlarını deneyebilir hem de tarihi ve doğal güzelliklerini keşfedebilirsiniz. Kahramanmaraş''ın samimi insanları ve zengin kültürel mirası, ziyaretinizi unutulmaz kılacaktır. Bu şehir, lezzetlerin ve tarihin buluştuğu özel bir destinasyondur.', CAST(N'2024-01-02T02:23:53.907' AS DateTime), N'https://www.efsusemlak.com/wp-content/uploads/2020/12/kahramanmaras-3.jpg', 0, 1, 3, 46)
INSERT [dbo].[BlogPosts] ([Id], [Title], [Content], [CreationDate], [Image], [IsDeleted], [IsStatus], [UserId], [CityId]) VALUES (14, N'Rafık yani dost', N'Türkiye''nin güneydoğusunda yer alan Gaziantep, özgün ve lezzetli mutfağı ile ünlüdür. Ancak bu şehir sadece gastronomi açısından değil, aynı zamanda tarihi ve kültürel zenginlikleriyle de dikkat çeker.

Gaziantep Mutfağı:

Gaziantep mutfağı, Türkiye''nin en zengin ve çeşitli mutfaklarından birini sunar. Şehrin simgesi haline gelen "baklava" ve "katmer" gibi tatlılarıyla ünlüdür. Ayrıca, Antep kebabı, lahmacun, çiğ köfte, beyran çorbası ve daha birçok lezzetli yemeğiyle Gaziantep, gastronomi tutkunlarının vazgeçilmez destinasyonlarından biridir.

Tarihi ve Kültürel Zenginlikler:

Gaziantep, tarihi ve kültürel açıdan da büyük bir zenginliğe sahiptir. Gaziantep Kalesi, Zeugma Mozaik Müzesi ve Bakırcılar Çarşısı gibi tarihi mekanlar, ziyaretçilere şehrin geçmişine dair önemli ipuçları sunar. Ayrıca, Antep evleri olarak bilinen geleneksel taş yapılar, şehirdeki tarihi dokunun bir parçasıdır.

Gaziantep El Sanatları:

Gaziantep, geleneksel el sanatları açısından da zengindir. Özellikle bakır işlemeciliği ve kilim dokuma, şehirde yaygın olarak uygulanan el sanatlarıdır. Gaziantep''teki çarşılarda bu el sanatlarına ait ürünleri bulabilir ve satın alabilirsiniz.

Doğal Güzellikler:

Şehrin doğal güzellikleri de göz ardı edilmemelidir. Gaziantep, Ballıca Mağarası ve Rumkale gibi doğal güzelliklere ev sahipliği yapar. Bu bölgelerde doğa yürüyüşleri yapabilir ve tarihi kalıntıları keşfedebilirsiniz.

Sonuç:

Gaziantep, lezzetli mutfağı, tarihi zenginlikleri ve doğal güzellikleri ile Türkiye''nin en özel şehirlerinden biridir. Burada hem geleneksel tatları deneyebilir hem de tarihi ve kültürel zenginlikleri keşfedebilirsiniz. Gaziantep''in sıcakkanlı insanları ve zengin mirası, ziyaretinizi unutulmaz kılacaktır. Bu şehir, lezzetin ve tarihin başkenti olarak anılmayı hak ediyor.', CAST(N'2024-01-02T04:59:32.193' AS DateTime), N'https://www.carwingo.com.tr/dosya/112/blog/17-1-gaziantepde-gezilecek-yerler_742.png', 0, 1, 1, 27)
SET IDENTITY_INSERT [dbo].[BlogPosts] OFF
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (1, N'Adana', N'Adana: Sabancı Merkez Camii. Fotoğraf, Ali Başarır', N'https://img.memurlar.net/galeri/4400/6c283fe2-bb68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (2, N'Adıyaman', N'Adıyaman: Nemrut Dağı. Fotoğraf, Coolbiere. A', N'https://img.memurlar.net/galeri/4400/2b9d58e8-bb68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (3, N'Afyonkarahisar', N'Afyon: Frig Vadisi. (Yıldız Pozlama) Fotoğraf, Hümeyra Çelik', N'https://img.memurlar.net/galeri/4400/23ed7aee-bb68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (4, N'Ağrı', N'Ağrı: İshak Paşa Sarayı ve Ağrı Dağı manzarası. Fotoğraf, Nuro Aksoy', N'https://img.memurlar.net/galeri/4400/2ded7aee-bb68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (5, N'Amasya', N'Amasya: Kral mezarları ve Amasya''nın gece görünüşü. Fotoğraf, Can Eser', N'https://img.memurlar.net/galeri/4400/d402a7f4-bb68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (6, N'Ankara', N'Ankara: Gece Işıklandırmasıyla Anıtkabir', N'https://img.memurlar.net/galeri/4400/39e50110-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (7, N'Antalya', N'Antalya: Side Apollon Tapınağı. Fotoğraf, Necat Çetin', N'https://img.memurlar.net/galeri/4400/b4577816-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (8, N'Artvin', N'Kara Göl. Fotoğraf, Özcan Malkoçer', N'https://img.memurlar.net/galeri/4400/efe1c31c-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (9, N'Aydın', N'Apollon Tapınağı. Fotoğraf, Veli Toluay', N'https://img.memurlar.net/galeri/4400/4116e022-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (10, N'Balıkesir', N'Manyas Kuş Cenneti. Fotoğraf, Zafer Çankırı', N'https://img.memurlar.net/galeri/4400/b6ab6a36-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (11, N'Bilecik', N'Orhan Gazi Camii', N'https://img.memurlar.net/galeri/4400/0dd3973c-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (12, N'Bingöl', N'Yüzen Ada', N'https://img.memurlar.net/galeri/4400/546aaa56-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (13, N'Bitlis', N'Ahlat Selçuklu Mezarları. Fotoğraf, Erkam Uğur', N'https://img.memurlar.net/galeri/4400/d7833a5d-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (14, N'Bolu', N'Göynük Evleri. Fotoğraf, Erdal Irgat', N'https://img.memurlar.net/galeri/4400/f1833a5d-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (15, N'Burdur', N'Kibyra Antik Kenti. Fotoğraf, Recep Çirik', N'https://img.memurlar.net/galeri/4400/96304163-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (16, N'Bursa', N'Cumalıkızık Köyü. Fotoğraf, Gökhan Güzeltepe', N'https://img.memurlar.net/galeri/4400/0ecc4769-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (17, N'Çanakkale', N'Çanakkale Şehitleri Anıtı', N'https://img.memurlar.net/galeri/4400/20cc4769-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (18, N'Çankırı', N'Tuz Mağaraları. Fotoğraf Melih Sular', N'https://img.memurlar.net/galeri/4400/eba9dc7c-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (19, N'Çorum', N'Osmancık Köprüsü. Fotoğraf, Can Eser', N'https://img.memurlar.net/galeri/4400/8f0e9291-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (20, N'Denizli', N'Pamukkale. Fotoğraf, Ahmet Şahin', N'https://img.memurlar.net/galeri/4400/3d0abb97-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (21, N'Diyarbakır', N'Ulu Camii. Fotoğraf, Kadir Kömür', N'https://img.memurlar.net/galeri/4400/4b0abb97-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (22, N'Edirne', N'Selimiye Camii ve şehir silüeti. Fotoğraf, Ömer Şahin', N'https://img.memurlar.net/galeri/4400/c14a129e-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (23, N'Elazığ', N'Harput Kalesi. Fotoğraf, Hıdır Yıldırım', N'https://img.memurlar.net/galeri/4400/d44a129e-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (24, N'Erzincan', N'Girlevik Şelalesi. Fotoğraf, Çağrı Çırak', N'https://img.memurlar.net/galeri/4400/d84639a4-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (25, N'Erzurum', N'Üç Kümbetler. Fotoğraf, Barış Yorulmaz', N'https://img.memurlar.net/galeri/4400/e04639a4-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (26, N'Eskişehir', N'Odun Pazarı. Fotoğraf, Murat Fındık', N'https://img.memurlar.net/galeri/4400/9d6868aa-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (27, N'Gaziantep', N'Tarihi Bedesten içindeki bakırıcılar çarşısı. Fotoğraf, Hakkı Arıcan', N'https://img.memurlar.net/galeri/4400/71798ab0-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (28, N'Giresun', N'Kümbet Yaylası. Fotoğraf, Ahmet Yapan', N'https://img.memurlar.net/galeri/4400/7f798ab0-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (29, N'Gümüşhane', N'Kürtün Vadisi. Fotoğraf, Mustafa Olgun', N'https://img.memurlar.net/galeri/4400/5647d1b6-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (30, N'Hakkari', N'Mergan Yaylası. Fotoğraf, Mahmut Peynirci', N'https://img.memurlar.net/galeri/4400/6d47d1b6-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (31, N'Hatay', N'M.Ö. 1. yüzyılda yapılmış Vespasianus ve Titus Tüneli. Fotoğraf, Soner Pehlivan', N'https://img.memurlar.net/galeri/4400/15d48fbd-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (32, N'Isparta', N'Eğirdir gece silüeti ve Eğirdir Gölü. Fotoğraf, Mehmet Altınay', N'https://img.memurlar.net/galeri/4400/20d48fbd-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (33, N'Mersin', N'Kız Kalesi. Fotoğraf, Erdal Suat', N'https://img.memurlar.net/galeri/4400/f7ce2ac5-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (34, N'İstanbul', N'Galata Kulesi. Fotoğraf, Gökhan Girgine', N'https://img.memurlar.net/galeri/4400/00cf2ac5-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (35, N'İzmir', N'Efes Antik Kenti. Fotoğraf, Tingy Wu', N'https://img.memurlar.net/galeri/4400/7a5841cb-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (36, N'Kars', N'Ani Harabeleri. Fotoğraf, Salih Borbozan', N'https://img.memurlar.net/galeri/4400/865841cb-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (37, N'Kastamonu', N'Kastamonu Kalesi. Fotoğraf, Sertaç Ünal', N'https://img.memurlar.net/galeri/4400/ea7584d1-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (38, N'Kayseri', N'Kapuzbaşı Şelalesi. Fotoğraf, Ramazan Yücel Öner', N'https://img.memurlar.net/galeri/4400/f47584d1-bc68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (39, N'Kırklareli', N'Bizans döneminde İmparator II. Teodosius''un bu bölgedeki önemli şövalyelerinden biri olan Kozmos Dimitriyadis tarafından yaptırıldığı varsayılan Pınarhisar Kalesi.', N'https://img.memurlar.net/galeri/4400/a2aa283e-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (40, N'Kırşehir', N'Mucur Yeraltı Şehri', N'https://img.memurlar.net/galeri/4400/33ac5544-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (41, N'Kocaeli', N'Maşukiye Yaylası. Fotoğraf, Gökhan Alpdoğan', N'https://img.memurlar.net/galeri/4400/45ac5544-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (42, N'Konya', N'Mevlana Türbesi. Fotoğraf, İlknur Akpınar', N'https://img.memurlar.net/galeri/4400/f76f504a-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (43, N'Kütahya', N'Aizanoi Antik Kenti. Fotoğraf, Zafer Çankırı', N'https://img.memurlar.net/galeri/4400/6152d056-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (44, N'Malatya', N'Günpınar Şelalesi. Fotoğraf, Sefa Özdemir', N'https://img.memurlar.net/galeri/4400/6952d056-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (45, N'Manisa', N'Sardes Antik Kenti. Fotoğraf, Ali Başarır', N'https://img.memurlar.net/galeri/4400/7ccad35c-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (46, N'Kahramanmaraş', N'Taş Köprü. Fotoğraf, Ümit Bor', N'https://img.memurlar.net/galeri/4400/c1f07363-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (47, N'Mardin', N'Bir bütün olarak, Mardin şehrinin gece silüeti. Fotoğraf, Erkam Uğur', N'https://img.memurlar.net/galeri/4400/caf07363-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (48, N'Muğla', N'Ölü Deniz. Fotoğraf, Nejdet Düzen', N'https://img.memurlar.net/galeri/4400/8b0b7f69-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (49, N'Muş', N'Murat Köprüsü. Fotoğraf, Hidayet Kara', N'https://img.memurlar.net/galeri/4400/920b7f69-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (50, N'Nevşehir', N'Kapadokya/Peri Bacaları. Fotoğraf, Reynaldi Herdinanto', N'https://img.memurlar.net/galeri/4400/665bea6f-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (51, N'Niğde', N'Alaaddin Camii. Fotoğraf, Serdar Güner', N'https://img.memurlar.net/galeri/4400/3c29ea75-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (52, N'Ordu', N'Boztepe''den gece Ordu görünüşü. Fotoğraf, Kerim Gültaş', N'https://img.memurlar.net/galeri/4400/4b29ea75-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (53, N'Rize', N'Pokut Yaylası. Fotoğraf, Ferzan Uğurdağ', N'https://img.memurlar.net/galeri/4400/9a4bf17b-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (54, N'Sakarya', N'Sapanca Gölü. Fotoğraf, Selçuk Gülen', N'https://img.memurlar.net/galeri/4400/43050682-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (55, N'Samsun', N'Atatürk Heykeli', N'https://img.memurlar.net/galeri/4400/cc143688-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (56, N'Siirt', N'Siirt''in Aydınlar ilçesinde ekinoks zamanlarında güneş ışınlarının belli bir vakitte belli bir noktaya düşeceğinin 17-18. yüzyıllarda hesap edilmesine dayalı olarak inşa edilen türbe. Fotoğraf, Tarık Oran.', N'https://img.memurlar.net/galeri/4400/dd8c588e-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (57, N'Sinop', N'Sinop Kalesi ve fotoğrafta görüldüğü gibi surları. Fotoğraf, Caucas Blue', N'https://img.memurlar.net/galeri/4400/e68c588e-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (58, N'Sivas', N'Divriği Ulu Camii ve Darüşşifası. Fotoğraf, Ahmet Özbaş', N'https://img.memurlar.net/galeri/4400/8abe1195-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (59, N'Tekirdağ', N'Ayçiçeği/Günebakan Bahçeleri. Fotoğraf, Ramis Akar', N'https://img.memurlar.net/galeri/4400/99be1195-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (60, N'Tokat', N'Ballıca Mağarası. Fotoğraf, Tuna Ozata', N'https://img.memurlar.net/galeri/4400/d3f8209b-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (61, N'Trabzon', N'Sümela Manastırı. Fotoğraf, Mustafa Tayar', N'https://img.memurlar.net/galeri/4400/dcf8209b-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (62, N'Tunceli', N'Pertek Kalesi. Fotoğraf, Engin Asil', N'https://img.memurlar.net/galeri/4400/e0831aa1-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (63, N'Şanlıurfa', N'Büyük kısmı Birecik Barajı nedeniyle sular altında kalmış Halfeti İlçesi. Fotoğraf, Aylin Erözcan', N'https://img.memurlar.net/galeri/4400/e9831aa1-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (64, N'Uşak', N'Ulubey Kanyonları', N'https://img.memurlar.net/galeri/4400/65dc19a7-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (65, N'Van', N'Akdamar Adası ve Kilisesi. Fotoğraf, Coolbiere. A', N'https://img.memurlar.net/galeri/4400/21d108bb-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (66, N'Yozgat', N'Kazankaya Kanyonu. Fotoğraf, Adem Yağız', N'https://img.memurlar.net/galeri/4400/2cd108bb-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (67, N'Zonguldak', N'Mitolojik karakter Herakles''in ölüler ülkesinin kapısını bekleyen üç başlı köpek cerberus''u yakaladığı yer olduğu rivayet edilen Cehennemağzı Mağaraları.', N'https://img.memurlar.net/galeri/4400/1c513ec2-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (68, N'Aksaray', N'Ihlara Vadisi. Fotoğraf, Erol Şahin', N'https://img.memurlar.net/galeri/4400/2e513ec2-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (69, N'Bayburt', N'Bayburt Kalesi ve şehir silüeti. Fotoğraf, Can Savcı', N'https://img.memurlar.net/galeri/4400/aac638c8-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (70, N'Karaman', N'Hatuniye Medresesi', N'https://img.memurlar.net/galeri/4400/b1c638c8-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (71, N'Kırıkkale', N'Celal Bayar Parkı', N'https://img.memurlar.net/galeri/4400/a2b46fce-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (72, N'Batman', N'Hasankeyf. Fotoğraf, Mehmet Çay', N'https://img.memurlar.net/galeri/4400/a7b46fce-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (73, N'Şırnak', N'Kırmızı Medrese', N'https://img.memurlar.net/galeri/4400/8ddf76d4-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (74, N'Bartın', N'İnkum Plajı. Fotoğraf, Murat Güler', N'https://img.memurlar.net/galeri/4400/97df76d4-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (75, N'Ardahan', N'Kış sezonunda Çıldır Gölü. Fotoğraf, Ahmet Hrmnc', N'https://img.memurlar.net/galeri/4400/3934eada-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (76, N'Iğdır', N'Halıkışla. Fotoğraf, Özkan Soylu', N'https://img.memurlar.net/galeri/4400/4a34eada-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (77, N'Yalova', N'Erikli Şelalesi. Fotoğraf, Hüseyin Atakuru', N'https://img.memurlar.net/galeri/4400/d22a17e1-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (78, N'Karabük', N'Bulak Mağarası. Fotoğraf, Emrah Balaban', N'https://img.memurlar.net/galeri/4400/ce5e3de7-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (79, N'Kilis', N'Ravanda Kalesi, içinden görünüm. Fotoğraf, Hannan Aslan', N'https://img.memurlar.net/galeri/4400/db5e3de7-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (80, N'Osmaniye', N'Ceyhan Nehri. Fotoğraf, Murat Beşbudak', N'https://img.memurlar.net/galeri/4400/731b67ed-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
INSERT [dbo].[Cities] ([Id], [Name], [Description], [Image]) VALUES (81, N'Düzce', N'Kardüz Yaylası', N'https://img.memurlar.net/galeri/4400/7d1b67ed-bd68-e311-8b97-14feb5cc1801.jpg?width=800')
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name], [IsDeleted]) VALUES (2, N'Admin', 0)
INSERT [dbo].[Roles] ([Id], [Name], [IsDeleted]) VALUES (3, N'User', 0)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [Password], [CreationDate], [Image], [IsDeleted], [IsStatus], [RoleId]) VALUES (1, N'Emrullah', N'Yabasun', N'emrullah@user.com', N'123', CAST(N'2023-12-31T01:33:58.050' AS DateTime), N'https://media.licdn.com/dms/image/D4D03AQE7_rKdC9TcDw/profile-displayphoto-shrink_800_800/0/1698277565876?e=1709769600&v=beta&t=39t8bp2FGk6P0NMZSbM9Q3Xu0w_5FRXaWierQuWtbSY', 0, 1, 3)
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [Password], [CreationDate], [Image], [IsDeleted], [IsStatus], [RoleId]) VALUES (2, N'Emrullah', N'Yabasun', N'emrullah@admin.com', N'123', CAST(N'2024-01-01T15:11:50.700' AS DateTime), N'https://media.licdn.com/dms/image/D4D03AQE7_rKdC9TcDw/profile-displayphoto-shrink_800_800/0/1698277565876?e=1709769600&v=beta&t=39t8bp2FGk6P0NMZSbM9Q3Xu0w_5FRXaWierQuWtbSY', 0, 1, 2)
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [Password], [CreationDate], [Image], [IsDeleted], [IsStatus], [RoleId]) VALUES (3, N'Erhan', N'Kaya', N'erhan@user.com', N'123', CAST(N'2024-01-01T15:15:12.187' AS DateTime), N'https://media.licdn.com/dms/image/C4D03AQEc2_1nx1AOGg/profile-displayphoto-shrink_800_800/0/1614607244458?e=1709769600&v=beta&t=ot_acD5wtXtk3q6iyKPhcnYL0ulNP9KPlceN8PhJ9L8', 0, 1, 3)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_BlogPostId]    Script Date: 2.01.2024 06:37:13 ******/
CREATE NONCLUSTERED INDEX [IX_BlogPostId] ON [dbo].[BlogComments]
(
	[BlogPostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 2.01.2024 06:37:13 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[BlogComments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BlogPostId]    Script Date: 2.01.2024 06:37:13 ******/
CREATE NONCLUSTERED INDEX [IX_BlogPostId] ON [dbo].[BlogLikes]
(
	[BlogPostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 2.01.2024 06:37:13 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[BlogLikes]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CityId]    Script Date: 2.01.2024 06:37:13 ******/
CREATE NONCLUSTERED INDEX [IX_CityId] ON [dbo].[BlogPosts]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 2.01.2024 06:37:13 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[BlogPosts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 2.01.2024 06:37:13 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[Users]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BlogComments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BlogComments_dbo.BlogPosts_BlogPostId] FOREIGN KEY([BlogPostId])
REFERENCES [dbo].[BlogPosts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlogComments] CHECK CONSTRAINT [FK_dbo.BlogComments_dbo.BlogPosts_BlogPostId]
GO
ALTER TABLE [dbo].[BlogComments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BlogComments_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlogComments] CHECK CONSTRAINT [FK_dbo.BlogComments_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[BlogLikes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BlogLikes_dbo.BlogPosts_BlogPostId] FOREIGN KEY([BlogPostId])
REFERENCES [dbo].[BlogPosts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlogLikes] CHECK CONSTRAINT [FK_dbo.BlogLikes_dbo.BlogPosts_BlogPostId]
GO
ALTER TABLE [dbo].[BlogLikes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BlogLikes_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlogLikes] CHECK CONSTRAINT [FK_dbo.BlogLikes_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[BlogPosts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BlogPosts_dbo.Cities_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlogPosts] CHECK CONSTRAINT [FK_dbo.BlogPosts_dbo.Cities_CityId]
GO
ALTER TABLE [dbo].[BlogPosts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BlogPosts_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[BlogPosts] CHECK CONSTRAINT [FK_dbo.BlogPosts_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Roles_RoleId]
GO
USE [master]
GO
ALTER DATABASE [TravelGuideWebsiteDb] SET  READ_WRITE 
GO
