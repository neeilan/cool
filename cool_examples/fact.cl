class Main inherits A2I {

        factorial : Int;

        main() : Object {
                {
                        (new IO).out_string("Enter number : ");
                        factorial <-  fact ( a2i( (new IO).in_string() ) );
                        (new IO).out_string("\nFactorial is : ");
                        (new IO).out_string(i2a(factorial));
                }
        };

        fact (i: Int) : Int {
                if (i = 0)
                        then 1
                 else
                        i * fact(i-1)
                fi
        };

        fact_iterative(i: Int) : Int {
                let fact: Int <- 1 in {
                        while (not (i = 0)) loop
                         {
                                fact <- fact * i;
                                i <- i - 1;
                        } pool;
                fact;
                }
        };

};
