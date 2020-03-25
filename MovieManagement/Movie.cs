using System;
using System.Collections.Generic;
using System.Text;

namespace MovieManagement
{
    class Movie:Connection
    {
        public string MovieTitle { get; set; }
        public string Language { get; set; }
        public DateTime MoviereleaseDate   { get; set; }
        public string MovieReleaseDate { get; set; }
        public string MovieDescription { get; set; }
        public int MovieTime { get; set; }

        public void GetDetails()
        {
            Console.WriteLine("Enter the title of movie");
            MovieTitle = Console.ReadLine();
            Console.WriteLine("Enter the Lanuage in which movie is made");
            Language = Console.ReadLine();
            Console.WriteLine("Enter movie release date");
            MovieReleaseDate = Console.ReadLine();
            Console.WriteLine("Enter the Description of movie");
            MovieDescription = Console.ReadLine();
            Console.WriteLine("Movie Time");
            MovieTime = Convert.ToInt32(Console.ReadLine());



        }
        public void Add()
        {
            this.GetDetails();
 
            this.ExecuteNonQuery($"insert into Movies(MovieTitle,Language,MovieReleaseDate,MovieDescription,MovieTime) values('{MovieTitle}','{Language}','{MovieReleaseDate}','{MovieDescription}',{MovieTime})");


        }
        public void Delete()
        {
            Console.WriteLine("Enter the movie title for which you want to perform delete operation.");
            MovieTitle = Console.ReadLine();
            this.ExecuteNonQuery($"delete from Movies where MovieTitle='{MovieTitle}'");
            Console.WriteLine("You have successfully deleted ");
        }
    }
}
