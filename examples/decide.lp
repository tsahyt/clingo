{ a;b;c }.

#script (python)

class Heuristic:
    def __init__(self):
        print(self)

    def decide(self,vsids):
        print("decide called with {}".format(vsids))
        return vsids

    def init(self, init):
        print("init called")
        for a in init.symbolic_atoms:
            print((a.symbol, init.solver_literal(a.literal)))
            init.add_watch(init.solver_literal(a.literal))
        pass

    def propagate(self, ctl, changes):
        print(changes)

    def undo(self, thread_id, assign, changes):
        print("undo")
        print(changes)

def main(prg):
    prg.set_heuristic(Heuristic())
    prg.ground([("base", [])])
    ret = prg.solve()
    print(ret)

#end.
