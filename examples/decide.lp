{ a;b;c }.

#script (python)

class Heuristic:
    def decide(self,vsids):
        return -vsids

    def init(self, init):
        for a in init.symbolic_atoms:
            init.add_watch(init.solver_literal(a.literal))

    def propagate(self, ctl, changes):
        pass

    def undo(self, thread_id, assign, changes):
        pass

def main(prg):
    prg.set_heuristic(Heuristic())
    prg.ground([("base", [])])
    ret = prg.solve()
    print(ret)

#end.
