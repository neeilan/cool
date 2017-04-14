class List inherits A2I {
        item: Object;
        next: List;

        init(i : Object, n : List):List {
                {
                        item <- i;
                        next <- n;
                        self;
                }
        };

        flatten():String {
                -- want to pick operation based on type --
                 let string:String <-
                        case item of
                                i : Int => i2a(i);
                                s : String => s;
                                o : Object => { abort(); ""; };  -- case needs to return a str --
                        esac
                 in
                 if (isvoid next) then
                        string
                else
                        string.concat(next.flatten())

                fi
        };
};

class Main inherits IO {

        main() : Object {
                -- COOL doesn't have a pointer to void (~null/none), so use empty var nil --
                let hello: String <- "Hello ",
                    world: Int <- 12,
                    nil : List,
                    newline : String <- "\n",
                    list : List <- (new List).init(hello,
                                        (new List).init(world,
                                                (new List).init(newline, nil)))
                in
                        out_string(list.flatten())
        };
};
