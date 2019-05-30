using System;
using System.Diagnostics;

namespace Demo {
	public struct MyStruct {
		public double a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t;
	}
	public class Timing {
		public static double f(MyStruct ms) {
			return ms.a + ms.b;
		}
		public static double f(ref MyStruct ms) {
			return ms.a + ms.b;
		}
        public static void Main(string[] args)
        {        
        	const int ITERATIONS = 10000000;
        	int i;
        	double sum = 0;
        	var obj = new MyStruct();

			Stopwatch stopWatch = new Stopwatch();
			stopWatch.Start();
        	for (i=0; i<ITERATIONS; i++)
        		sum += f(obj);
	        stopWatch.Stop();
        	Console.WriteLine(stopWatch.Elapsed);

			stopWatch.Start();
        	for (i=0; i<ITERATIONS; i++)
        		sum += f(ref obj);
	        stopWatch.Stop();
        	Console.WriteLine(stopWatch.Elapsed);
        }
    }
}
