{ a;b;c }.

#script (python)

class Heuristic:
    def __init__(self):
        print(self)

    def decide(self):
        print("decide called")
        return True

def main(prg):
    prg.set_heuristic(Heuristic())
    prg.ground([("base", [])])
    ret = prg.solve()
    print(ret)

#end.
