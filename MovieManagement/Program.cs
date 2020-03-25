using System;

namespace MovieManagement
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to our application. Hope you'll have a good experience.");
            int choice;
            Console.WriteLine("1. See the Details of Movie");
            Console.WriteLine("2. See the Details of Actor/Actress");
            Console.WriteLine("3. Add any new Actor/Actress Detail");
            Console.WriteLine("4. Add any new Movie Detail");
            Console.WriteLine("5. Delete information of a actor");
            Console.WriteLine("6. Delete information of a movie");
            Console.WriteLine("Enter your choice");
            choice = Convert.ToInt32(Console.ReadLine());
            switch(choice)
            {
                case 1:break;
                case 2:break;
                case 3:Actor actor = new Actor();
                    actor.Add();
                    break;
                case 4:
                    Movie movie = new Movie();
                    movie.Add();
                    break;
                case 5:
                    Actor actor1 = new Actor();
                    actor1.Delete();
                    break;
                case 6: Movie movie1 = new Movie();
                    movie1.Delete();
                    break;
                default:Console.WriteLine("Please enter valid choice");
                    break;
            }
            
         
        }
    }
}
