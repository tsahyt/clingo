{ a;b;c }.

#script (python)

class Heuristic:
    def decide(ctl):
        print("decide called")
        return 1

def main(prg):
    prg.set_heuristic(Heuristic())
    prg.ground([("base", [])])
    ret = prg.solve()
    print(ret)

#end.
