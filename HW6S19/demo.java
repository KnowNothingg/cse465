public class demo {
	public static int f(int [] ary) {
		// Do something simple, so that the execution time
		// can generally be attributed to just the parameter passing.
		return ary[0];
	}
	public static void timeIt(int N) {
		final long ITERATIONS = 60000000L;// found a value that works
		int [] ary = new int [N];
		long start = System.nanoTime();
		for (long i=0; i<ITERATIONS; i++) {
			f(ary);
		}
		long end = System.nanoTime();
		System.out.println(N + ": " + (end - start)/1000000000.0);
	}
	public static void main(String [] args) {        
		timeIt(100);
		timeIt(10000);
		timeIt(1000000);
	}
}
