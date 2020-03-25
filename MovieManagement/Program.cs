using System;

namespace MovieManagement
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to our application. Hope you'll have a good experience.");
            int choice;
            
            Console.WriteLine("1. Add any new Actor/Actress Detail");
            Console.WriteLine("2. Add any new Movie Detail");
            Console.WriteLine("3. Delete information of a actor");
            Console.WriteLine("4. Delete information of a movie");
            Console.WriteLine("Enter your choice");
            choice = Convert.ToInt32(Console.ReadLine());
            switch(choice)
            {
                case 1:Actor actor = new Actor();
                    actor.Add();
                    break;
                case 2:Movie movie = new Movie();
                    movie.Add();
                    break;
                case 3: Actor actor1 = new Actor();
                    actor1.Delete();
                    break;
                case 4: Movie movie1 = new Movie();
                    movie1.Delete();
                    break;
                    
                
                default:Console.WriteLine("Please enter valid choice");
                    break;
            }
            
         
        }
    }
}
