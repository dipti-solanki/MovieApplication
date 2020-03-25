using System;
using System.Collections.Generic;
using System.Text;

namespace MovieManagement
{
    class Actor : Connection
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Gender { get; set; }
        public string ActorDetails { get; set; }

        public void GetDetails()
        {
            Console.WriteLine("Enter the Name of Actor/Actress");
            FirstName = Console.ReadLine();
            Console.WriteLine("Enter the Surname of Actor/Actress");
            LastName = Console.ReadLine();
            Console.WriteLine("Enter another Details");
            ActorDetails = Console.ReadLine();
            Console.WriteLine("Gender Detail is Necessary");
            Gender = Console.ReadLine();



        }
        
        public void Add()
            {
            this.GetDetails();
            this.ExecuteNonQuery($"insert into Actors(FirstName,LastName,Gender,ActorDetails) values('{FirstName}','{LastName}','{Gender}','{ActorDetails}')");


            }
        public void Delete()
        {
            Console.WriteLine("Enter the actor/actress for which you want to perform delete operation.");
            FirstName = Console.ReadLine();
            Console.WriteLine(FirstName);
            this.ExecuteNonQuery($"delete from Actors where FirstName='{FirstName}'");
            Console.WriteLine("You have successfully deleted ");
        }

    }
}
