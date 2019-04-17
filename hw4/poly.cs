using System;
using System.Collections.Generic;
class poly{
    public static List<string> rearrange(string line){
        string newLine = "";
        for(int j = 0; j < line.Length; j++){
            if(line[j] == "-" || line[j] == "+" || line[j] == "x"){
                newLine += " ";
            }
            newLine += line[j];
        }

        if (line[j] == "^" && (line[j] != "-" || line[j] != "+")){
            newLine += " ";
        }

    newLine += line[-1];

    string[] temp = newLine.split(" ");
    List<string> polys = new List<string>();
    for (int i = 0; i < temp.Length; i++){
        if(temp[i] != ""){
            polys.add(temp[i]);
        }
    } 

    return polys;
    }

    public static void Main(){
        string line;
        while((line = Console.ReadLine()) != null && line != ""){
            int count = Int32.Parse(line[0]);
            for(int k = 0; k < count; k++){
                Dictionary<string, string> dicA = new Dictionary<string, string>();
                Dictionary<string, string> dicB = new Dictionary<string, string>();
                Dictionary<int, int> result = new Dictionary<int, int>();
                line = Console.ReadLine();

                List<string> polys = rearrange(line);

                for(int i = 0; i < polys.Length(); i++){
                    if(polys[i] == "x^"){
                        dicA.add(polys[i+1], polys[i-1]);
                    }
                }

                line = Console.ReadLine();
                List<string> newPolys = rearrange(line);
                for(int i = 0; i < newPolys.Length(); i++){
                    if(newPolys[i] == "x^"){
                        dicB.add(newPolys[i+1], newPolys[i-1]);
                    }
                }

                foreach(KeyValuePair<string, string> A in dicA){
                    foreach(KeyValuePair<string, string> B in dicB){
                        if(Int32.Parse(A.Key) + Int32.Parse(B.Key) == 0){
                            result.add(1, Int32.Parse(A.Value) * Int32.Parse(B.Value));
                        }
                        if(!result.Contains(Int32.Parse(A.Key) + Int32.Parse(B.Key))){
                            result.add(Int32.Parse(A.Key) + Int32.Parse(B.Key),
                             Int32.Parse(A.Value) * Int32.Parse(B.Value));
                        }else{
                            result.add(Int32.Parse(A.Key) + Int32.Parse(B.Key),
                             result[Int32.Parse(A.Key) + Int32.Parse(B.Key)] + Int32.Parse(A.Value) * Int32.Parse(B.Value));
                        }
                    }
                }
                
                List<int> answer = new List<int>();
                foreach (KeyValuePair<int, int> item in result){
                    answer.add(item.Key);
                }
                answer.sort();

                for(int i = 0; i < answer.length(); i++){
                    Console.write(answer[i]);

                }

            }
        }

    }
}