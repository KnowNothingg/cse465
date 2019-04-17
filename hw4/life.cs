using System;

class life{

    public static void Main(){
        int number = 1;

        string line;

        while((line = Console.ReadLine()) != null && line != ""){
            string[] nums = line.Split(" ");

            int mintues = Int32.Parse(nums[0]);

            bool allZero = true;

            for(int i = 1; i < 11; i++){
                if(Int32.Parse(nums[i]) != 0){
                    allZero = false;
                }
            }
            if(allZero){break;}

            int[] temp = {mintues, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};

            for(int i = 0; i < mintues; i++){
                for(int  j = 1; j < 11; j++){
                    if(j == 1){
                        if(Int32.Parse(nums[2]) < 3 || Int32.Parse(nums[2])>7){
                            temp[1] = Int32.Parse(nums[1]) - 1;
                            if(temp[1] < 0){
                                temp[1] = 0;
                            }
                        }
                        if(Int32.Parse(nums[2]) > 3 && Int32.Parse(nums[2]) < 8){
                            temp[1] = Int32.Parse(nums[1]) + 1;
                            if(temp[1] > 9){
                                temp[1] = 9;
                            }
                        }
                        if(Int32.Parse(nums[2]) == 3){
                            temp[1] = Int32.Parse(nums[1]);
                        }
                    }else if(j == 10){
                         if(Int32.Parse(nums[9]) < 3 || Int32.Parse(nums[9]) > 7){
                            temp[10] = Int32.Parse(nums[10]) - 1;
                            if(temp[10] < 0){
                                temp[10] = 0;
                            }
                        }
                        if(Int32.Parse(nums[9]) >= 4 && Int32.Parse(nums[9]) <= 7){
                            temp[10] = Int32.Parse(nums[10]) + 1;
                            if(temp[10] > 9){
                                temp[10] = 9;
                            }
                        }
                        if(Int32.Parse(nums[9]) == 3){
                            temp[10] = Int32.Parse(nums[10]);
                        }
                    }else {
                        int sum = Int32.Parse(nums[j - 1]) + Int32.Parse(nums[j + 1]);
                        if(sum < 3 || sum > 7){
                            temp[j] = Int32.Parse(nums[j]) - 1;
                            if(temp[j] < 0){
                                temp[j] = 0;
                            }
                        }
                        if(sum >= 4 && sum <= 7){
                            temp[j] = Int32.Parse(nums[j]) + 1;
                            if(temp[j] > 9){
                                temp[j] = 9;
                            }
                        }
                        if(sum == 3){
                            temp[j] = Int32.Parse(nums[j]);
                        }
                    }
                }
                temp[0] = mintues - 1;
                for(int k = 1; k < 11; k++){
                    nums[k] = temp[k].ToString();
                }
            }
            Console.Write("#{0}: {1} {2} {3} {4} {5} {6} {7} {8} {9} {10}\n", number, nums[1], nums[2], nums[3], nums[4], nums[5], nums[6], nums[7], nums[8], nums[9], nums[10]);
            number += 1;
          }
    }
}