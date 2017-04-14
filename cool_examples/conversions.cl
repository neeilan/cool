class Main inherits A2I
{
        --  A2I = Ascii to Integer. This program adds 1 to a user-entered number --
        main() : Object {
                {
                        (new IO).out_string( i2a ( a2i( (new IO).in_string() ) +1 ) );
                }
        };
};
