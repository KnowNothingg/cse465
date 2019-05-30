using System;

class alarm {
    static void Main() {
        string line;
        while((line = Console.ReadLine()) != null && line != ""){
            if(line.Length < 11){
                line = Console.ReadLine();
            }
            int pushes = 0;
            time startTime = new time(-1, -1, -1, "MM");
            time endTime = new time(-1, -1, -1, "MM");

            startTime.setHour(line[0] - '0');
            startTime.setM1(line[2] - '0');
            startTime.setM2(line[3] - '0');
            startTime.setAp(line[4].ToString() + "m");

            endTime.setHour(line[7] - '0');
            endTime.setM1(line[9] - '0');
            endTime.setM2(line[10] - '0');
            endTime.setAp(line[11].ToString() + "m");

            int hDif = Math.Abs(startTime.getHour() - endTime.getHour());
            pushes += Math.Min(hDif, 12 - hDif);

            int m1Dif = Math.Abs(startTime.getM1() - endTime.getM1());
            pushes += Math.Min(m1Dif, 6 - m1Dif);

            int m2Dif = Math.Abs(startTime.getM2() - endTime.getM2());
            pushes += Math.Min(m2Dif, 10 - m2Dif);

            if(!string.Equals(startTime.getAp(), endTime.getAp())){
                pushes += 1;
            }
            
            if(pushes == 1){
                Console.Write("Going from " + startTime.display() + " to "  + endTime.display() + " requires "  + pushes +  " push\n");
            }else {
                Console.Write("Going from " + startTime.display() + " to "  + endTime.display() + " requires "  + pushes +  " pushes\n");
            }

        }

    }

    public class time {
        public int hour, m1, m2;
        public string ap;

        // time constructor
        public time(int hour, int m1, int m2, string ap){
            this.hour = hour;
            this.m1 = m1;
            this.m2 = m2;
            this.ap = ap;
        }

        public int getHour(){
            return hour;
        }
        public void setHour(int n){
            this.hour = n;
        }
        public int getM1(){
            return m1;
        }
        public void setM1(int n) {
            this.m1 = n;
        }
        public int getM2(){
            return m2;
        }
        public void setM2(int n){
            this.m2 = n;
        }
        
        public string getAp(){
            return ap;
        }

        public void setAp(string a){
            this.ap = a;
        }

        public string display(){
            return (this.getHour() + ":" + this.getM1() + this.getM2() + this.getAp());
        }
    }
}