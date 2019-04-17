using System;

class qb{
    static void Main(){
        string line;
        int number = 1;

        while((line = Console.ReadLine()) != null && line != ""){
            if(line.Length < 3){
                line = Console.ReadLine();
            }
            string[] nums = line.Split(" ");

            int completion = Int32.Parse(nums[0]);
            int attempt = Int32.Parse(nums[1]);
            int yards = Int32.Parse(nums[2]);
            int inter = Int32.Parse(nums[3]);
            int td = Int32.Parse(nums[4]);
            
            if(attempt == 0){
                break;
            }

            double completion_p = ((completion / attempt) - 0.3) * 5;
            double td_p = (td/attempt) * 20;
            double yardPerAttempt = (yards/attempt - 3) * 0.25;
            double interception = 2.375 - (100 * (inter / ( 4 * attempt )));

            if(completion_p > 2.375){
                completion_p = 2.375;
            }else if(completion_p < 0){
                completion_p = 0;
            }

            if(td_p > 2.375){
                td_p = 2.375;
            }else if(td_p < 0){
                td_p = 0;
            }

            if(yardPerAttempt > 2.375){
                yardPerAttempt = 2.375;
            }else if(yardPerAttempt < 0){
                yardPerAttempt = 0;
            }

            if(interception > 2.375){
                interception = 2.375;
            }else if(interception < 0){
                interception = 0;
            }

            double qb = (100 * (completion_p + td_p + yardPerAttempt + interception)) / 6;

            string deci = (qb - (int)qb).ToString();
        
            if((int)deci[2] >= 5){
                qb = Math.Ceiling(qb);
            }else{
                qb = Math.Floor(qb);
            }

            Console.WriteLine("QB #" + number + ": " + qb);
            number += 1;
        
            }
        }
}