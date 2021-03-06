USE [master]
GO
/****** Object:  Database [MovieDetailDb]    Script Date: 25-03-2020 10.29.12 AM ******/
CREATE DATABASE [MovieDetailDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieDetailDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MovieDetailDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MovieDetailDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MovieDetailDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MovieDetailDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieDetailDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieDetailDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieDetailDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieDetailDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieDetailDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieDetailDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieDetailDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MovieDetailDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieDetailDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieDetailDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieDetailDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieDetailDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieDetailDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieDetailDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieDetailDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieDetailDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MovieDetailDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieDetailDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieDetailDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieDetailDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieDetailDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieDetailDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MovieDetailDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieDetailDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MovieDetailDb] SET  MULTI_USER 
GO
ALTER DATABASE [MovieDetailDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieDetailDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieDetailDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieDetailDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MovieDetailDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MovieDetailDb] SET QUERY_STORE = OFF
GO
USE [MovieDetailDb]
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 25-03-2020 10.29.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors](
	[ActorId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[ActorDetails] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Actors] PRIMARY KEY CLUSTERED 
(
	[ActorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieDetails]    Script Date: 25-03-2020 10.29.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieDetails](
	[ActorId] [int] NOT NULL,
	[MovieId] [int] NOT NULL,
	[RoleInMovie] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 25-03-2020 10.29.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieId] [int] IDENTITY(1,1) NOT NULL,
	[MovieTitle] [varchar](50) NOT NULL,
	[Language] [varchar](50) NOT NULL,
	[MovieReleaseDate] [datetimeoffset](7) NOT NULL,
	[MovieDescription] [varchar](50) NOT NULL,
	[MovieTime] [int] NOT NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vMovies]    Script Date: 25-03-2020 10.29.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vMovies]
AS
SELECT dbo.Movies.MovieTitle, dbo.Movies.MovieDescription, dbo.Movies.MovieReleaseDate, dbo.Movies.MovieTime, dbo.MovieDetails.RoleInMovie, dbo.Actors.FirstName, dbo.Actors.LastName, dbo.Actors.ActorDetails
FROM     dbo.Movies INNER JOIN
                  dbo.MovieDetails ON dbo.Movies.MovieId = dbo.MovieDetails.MovieId INNER JOIN
                  dbo.Actors ON dbo.MovieDetails.ActorId = dbo.Actors.ActorId
GO
/****** Object:  View [dbo].[vActors]    Script Date: 25-03-2020 10.29.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vActors]
AS
SELECT dbo.Actors.FirstName, dbo.Actors.LastName, dbo.MovieDetails.RoleInMovie, dbo.Movies.MovieTitle, dbo.Movies.MovieDescription, dbo.Movies.MovieTime, dbo.Movies.Language, dbo.Actors.ActorDetails
FROM     dbo.Actors INNER JOIN
                  dbo.MovieDetails ON dbo.Actors.ActorId = dbo.MovieDetails.ActorId INNER JOIN
                  dbo.Movies ON dbo.MovieDetails.MovieId = dbo.Movies.MovieId
GO
ALTER TABLE [dbo].[MovieDetails]  WITH CHECK ADD  CONSTRAINT [FK_MovieDetails_Movies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
GO
ALTER TABLE [dbo].[MovieDetails] CHECK CONSTRAINT [FK_MovieDetails_Movies]
GO
ALTER TABLE [dbo].[MovieDetails]  WITH CHECK ADD  CONSTRAINT [FK_MovieDetails_Movies1] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
GO
ALTER TABLE [dbo].[MovieDetails] CHECK CONSTRAINT [FK_MovieDetails_Movies1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Actors"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "MovieDetails"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 148
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Movies"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 751
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vActors'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vActors'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Actors"
            Begin Extent = 
               Top = 7
               Left = 557
               Bottom = 170
               Right = 751
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Movies"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 267
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MovieDetails"
            Begin Extent = 
               Top = 7
               Left = 315
               Bottom = 148
               Right = 509
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vMovies'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vMovies'
GO
USE [master]
GO
ALTER DATABASE [MovieDetailDb] SET  READ_WRITE 
GO
