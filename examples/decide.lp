#script (python)

class Heuristic:
    def decide(self,vsids):
        print("decide")
        return vsids

    def init(self, init):
        pass

def main(prg):
    prg.set_heuristic(Heuristic())
    prg.ground([("base", [])])
    ret = prg.solve()
    print(ret)

#end.
